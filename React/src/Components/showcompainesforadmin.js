import React, { useState, useEffect } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { Alert } from "react-bootstrap";

const Companies = () => {
  const [companies, setCompanies] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [searchQuery, setSearchQuery] = useState(""); // Store search query

  const backendUrl = "http://localhost:8080/getallCompnies"; // Replace with your actual backend URL
  const url="http://localhost:8080/deletecompany";

  useEffect(() => {
    const fetchCompanies = async () => {
      try {
        const response = await fetch(backendUrl);
        if (!response.ok) {
          throw new Error("Failed to fetch companies");
        }
        const data = await response.json();
        setCompanies(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchCompanies();
  }, []);

  const deleteCompany = async (companyId) => {
    try {
      const response = await fetch(`${url}/${companyId}`, {
        method: "DELETE",
      });
      
      alert("Company delete successfully!!");
      // Remove the company from the local state after successful deletion
      setCompanies((prevCompanies) =>
        prevCompanies.filter((company) => company.company_id !== companyId)
      );
    } catch (err) {
      setError(err.message);
    }
  };

  // Filter companies based on the search query
  const filteredCompanies = companies.filter((company) =>
    company.company_name.toLowerCase().includes(searchQuery.toLowerCase())
  );

  if (loading) return <div className="text-center mt-5">Loading...</div>;
  if (error) return <div className="text-center text-danger mt-5">Error: {error}</div>;

  return (
    <div className="container mt-5">
      <h1 className="text-center mb-4">Manage Companies</h1>

      {/* Search Bar */}
      <div className="mb-4">
        <input
          type="text"
          className="form-control"
          placeholder="Search for companies by name"
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
          style={{ width: '100%', boxShadow: '0 2px 6px rgba(0, 0, 0, 0.2)' }
          }
        />
      </div>

      <table className="table table-striped">
        <thead>
          <tr>
            <th>Company Name</th>
            <th>Registration No</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {filteredCompanies.map((company) => (
            <tr key={company.company_id}>
              <td>{company.company_name}</td>
              <td>{company.company_reg_no}</td>
              <td>
                <button
                  className="btn btn-danger"
                  onClick={() => deleteCompany(company.company_id)}
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

export default Companies;
