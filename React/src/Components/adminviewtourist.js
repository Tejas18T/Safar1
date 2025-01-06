import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";

const Tourists = () => {
  const [tourists, setTourists] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchQuery, setSearchQuery] = useState("");

  const backendUrl = "http://localhost:8080/alluser"; // Replace with your actual backend URL
  const url="http://localhost:8080/deleteuser";

  useEffect(() => {
    const fetchTourists = async () => {
      try {
        const response = await fetch(backendUrl);
        if (!response.ok) {
          throw new Error("Failed to fetch tourists");
        }
        const data = await response.json();
        setTourists(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchTourists();
  }, []);

  const deleteTourist = async (userId) => {
    try {
      const response = await fetch(`${url}/${userId}`, {
        method: "DELETE",
      });
      alert("User delete successfully!!");
      // Remove the tourist from the local state after successful deletion
      setTourists((prevTourists) =>
        prevTourists.filter((tourist) => tourist.user_id !== userId)
      );
    } catch (err) {
      setError(err.message);
    }
  };

  // Filter tourists based on the search query
  const filteredTourists = tourists.filter(
    (tourist) =>
      tourist.firstname.toLowerCase().includes(searchQuery.toLowerCase()) ||
      tourist.lastname.toLowerCase().includes(searchQuery.toLowerCase()) ||
      tourist.username.toLowerCase().includes(searchQuery.toLowerCase()) ||
      tourist.email.toLowerCase().includes(searchQuery.toLowerCase())
  );

  if (loading) return <div className="text-center mt-5">Loading...</div>;
  if (error) return <div className="text-center text-danger mt-5">Error: {error}</div>;

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Manage Users</h1>

      {/* Search Bar */}
      <div className="mb-4">
        <input
          type="text"
          className="form-control"
          placeholder="Search for User"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          style={{ width: '100%', boxShadow: '0 2px 6px rgba(0, 0, 0, 0.2)' }
          }
        />
      </div>

      {/* Tourist Table */}
      <table className="table table-striped">
        <thead>
          <tr>
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact No</th>
            <th>Address</th>
            <th>Account Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {filteredTourists.map((tourist) => (
            <tr key={tourist.user_id}>
              <td>{tourist.username}</td>
              <td>{tourist.firstname}</td>
              <td>{tourist.lastname}</td>
              <td>{tourist.email}</td>
              <td>{tourist.contactno}</td>
              <td>{tourist.address}</td>
              <td>
                {tourist.accountstatus === 1 ? (
                  <span className="text-success">Active</span>
                ) : (
                  <span className="text-danger">Inactive</span>
                )}
              </td>
              <td>
                <button
                  className="btn btn-danger"
                  onClick={() => deleteTourist(tourist.user_id)}
                >
                  Delete
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Tourists;
