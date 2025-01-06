import React, { useState } from "react";
import { useParams } from "react-router-dom";

const AddPackageForm = () => {
  const { company_id } = useParams(); 

  const [formData, setFormData] = useState({
    package_name: "",
    description: "",
    source: "",
    destination: "",
   
    image_desc: "",
  });

  const [message, setMessage] = useState(""); 

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prevData) => ({ ...prevData, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch(`http://localhost:8080/companies/${company_id}/packages`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        setMessage("Package added successfully!");
        setFormData({
          package_name: "",
          description: "",
          source: "",
          destination: "",
         
          image_desc: "",
        });
      } else {
        const errorData = await response.json();
        setMessage(`Failed to add package: ${errorData.message}`);
      }
    } catch (error) {
      console.error("Error adding package:", error);
      setMessage("An error occurred while adding the package.");
    }
  };

  const handleReset = () => {
    setFormData({
      package_name: "",
      description: "",
      source: "",
      destination: "",
      person_per_package: "",
      image_desc: "",
    });
    setMessage("");
  };

  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div
            className="p-4 rounded"
            style={{
              backgroundColor: "#ffffff",
              boxShadow: "0 4px 8px rgba(0, 0, 0, 0.1)",
            }}
          >
            <h2 className="text-center mb-4">Add Package for Company {company_id}</h2>
            {message && (
              <div className={`alert ${message.startsWith("Failed") ? "alert-danger" : "alert-success"}`} role="alert">
                {message}
              </div>
            )}
            <form onSubmit={handleSubmit}>
              <div className="mb-3">
                <label htmlFor="package_name" className="form-label">
                  Package Name
                </label>
                <input
                  type="text"
                  className="form-control"
                  id="package_name"
                  name="package_name"
                  value={formData.package_name}
                  onChange={handleChange}
                  required
                />
              </div>
              <div className="mb-3">
                <label htmlFor="description" className="form-label">
                  Description
                </label>
                <textarea
                  className="form-control"
                  id="description"
                  name="description"
                  rows="4"
                  value={formData.description}
                  onChange={handleChange}
                  required
                ></textarea>
              </div>
              <div className="mb-3">
                <label htmlFor="source" className="form-label">
                  Source
                </label>
                <input
                  type="text"
                  className="form-control"
                  id="source"
                  name="source"
                  value={formData.source}
                  onChange={handleChange}
                  required
                />
              </div>
              <div className="mb-3">
                <label htmlFor="destination" className="form-label">
                  Destination
                </label>
                <input
                  type="text"
                  className="form-control"
                  id="destination"
                  name="destination"
                  value={formData.destination}
                  onChange={handleChange}
                  required
                />
              </div>
              
              <div className="mb-3">
                <label htmlFor="image_desc" className="form-label">
                  Image URL
                </label>
                <input
                  type="url"
                  className="form-control"
                  id="image_desc"
                  name="image_desc"
                  value={formData.image_desc}
                  onChange={handleChange}
                  required
                />
              </div>
              <div className="row">
                <div className="col-6">
                  <button type="submit" className="btn btn-warning w-100">
                    Submit
                  </button>
                </div>
                <div className="col-6">
                  <button type="button" className="btn btn-warning w-100" onClick={handleReset}>
                    Reset
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AddPackageForm;
