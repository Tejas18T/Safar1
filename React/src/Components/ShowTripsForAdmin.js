import React, { useEffect, useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import "../CSS/showtripsforadmin.css";

const Trips = () => {
  const [trips, setTrips] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [selectedTrip, setSelectedTrip] = useState(null); // Store selected trip for the modal
  const [searchQuery, setSearchQuery] = useState(""); // Store search query

  const backendUrl = "http://localhost:8080/getalltrips"; // Replace with your actual backend URL
  const Url = "http://localhost:8080/deletetrips";

  useEffect(() => {
    const fetchTrips = async () => {
      try {
        const response = await fetch(backendUrl);
        if (!response.ok) {
          throw new Error("Failed to fetch trips");
        }
        const data = await response.json();
        setTrips(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchTrips();
  }, []);

  const deleteTrip = async (tripId) => {
    try {
      const response = await fetch(`${Url}/${tripId}`, {
        method: "DELETE",
      });
      // if (!response.ok) {
      //   throw new Error("Failed to delete trip");
      // }
      alert("Trip delete successfully!!");
      // Remove the trip from the local state after successful deletion
      setTrips((prevTrips) => prevTrips.filter((trip) => trip.trip_id !== tripId));
    } catch (err) {
      setError(err.message);
    }
  };

  const openModal = (trip) => {
    setSelectedTrip(trip); // Set selected trip for the modal
  };

  const closeModal = () => {
    setSelectedTrip(null); // Close the modal by clearing selected trip
  };

  // Filter trips based on the search query
  const filteredTrips = trips.filter((trip) =>
    trip.packageid.package_name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  if (loading) return <div className="text-center mt-5">Loading...</div>;
  if (error) return <div className="text-center text-danger mt-5">Error: {error}</div>;

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Manage Trips</h1>

      {/* Search Bar */}
      <div className="mb-4">
        <input
          type="text"
          className="form-control"
          placeholder="Search for trips by package name"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          style={{ width: '100%', boxShadow: '0 2px 6px rgba(0, 0, 0, 0.2)' }
          }
        />
      </div>

      <div className="row">
        {filteredTrips.map((trip) => (
          <div className="col-md-4 mb-4" key={trip.trip_id}>
            <div className="card h-100">
              <img
                src={trip.packageid.image_desc.replace(/'/g, "")}
                className="card-img-top"
                alt={trip.packageid.package_name}
                style={{ height: "200px", objectFit: "cover" }}
              />
              <div className="card-body">
                <h5 className="card-title">{trip.packageid.package_name}</h5>
                <button
                  className="btn btn-danger mt-2"
                  onClick={() => deleteTrip(trip.trip_id)}
                >
                  Delete Trip
                </button>
                <button
                  className="btn btn-info mt-2 ms-2"
                  onClick={() => openModal(trip)}
                >
                  View Details
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Modal for Trip Details */}
      {selectedTrip && (
        <div className="modal show" style={{ display: "block" }} tabIndex="-1">
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title">{selectedTrip.packageid.package_name}</h5>
                <button type="button" className="btn-close" onClick={closeModal}></button>
              </div>
              <div className="modal-body">
                <p><strong>Description:</strong> {selectedTrip.packageid.description}</p>
                <p><strong>Source:</strong> {selectedTrip.packageid.source}</p>
                <p><strong>Destination:</strong> {selectedTrip.packageid.destination}</p>
                <p><strong>Price per Person:</strong> ₹{selectedTrip.packageid.person_per_package}</p>
                <p><strong>Start Date:</strong> {selectedTrip.start_date}</p>
                <p><strong>End Date:</strong> {selectedTrip.end_date}</p>
                <img
                  src={selectedTrip.packageid.image_desc.replace(/'/g, "")}
                  alt={selectedTrip.packageid.package_name}
                  style={{ width: "100%", maxHeight: "400px", objectFit: "cover" }}
                />
              </div>
              <div className="modal-footer">
                <button
                  type="button"
                  className="btn btn-secondary"
                  onClick={closeModal}
                >
                  Close
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Trips;
