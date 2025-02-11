import React, { useState } from 'react';
import { Link, Outlet } from 'react-router-dom';
import { Container, Navbar, Button } from 'react-bootstrap';
import { useSelector } from 'react-redux';

function UserControlPanel() {
  const [showOptions, setShowOptions] = useState(false);
  const userDetails = useSelector((state) => state.logged.userDetails);
  const firstLetter = userDetails?.firstname ? userDetails.firstname.charAt(0).toUpperCase() : 'U';
  const username = userDetails?.firstname ? userDetails.firstname : 'Guest';

  const headerStyle = {
    backgroundColor: 'rgb(0, 63, 92)', // Custom blue color
    color: '#fff',
    fontSize: '1.2rem', // Reduced font size for a smaller navbar
    fontWeight: 'bold',
    padding: '8px 16px', // Reduced padding for a smaller navbar
  };

  const handleOptionClick = () => {
    setShowOptions(false);  // Close the options when any link is clicked
  };

  return (
    <Container fluid className="p-0 m-0">
      {/* Full-Width Navbar with Smaller Height */}
      <Navbar
        expand="lg"
        className="px-3 d-flex justify-content-between align-items-center w-100"
        style={{
          backgroundColor: 'rgb(0, 63, 92)', // Custom blue color
          color: '#fff',
          width: '100%',
          margin: '0',
          position: 'sticky',
          top: '0',
          zIndex: '1000',
          padding: '0.5rem 1rem', // Reduced padding for smaller navbar height
          boxShadow: 'rgba(0, 0, 0, 0.1) 0px 4px 6px',
        }}
      >
        <Navbar.Brand className="text-white m-0" style={headerStyle}>🌍 Safar</Navbar.Brand>
        <h2 className="text-white m-0" style={headerStyle}>
          Welcome, {username}!
        </h2>
        <div className="position-relative">
          <Button
            className="btn btn-light rounded-circle d-flex align-items-center justify-content-center"
            style={{
              width: '35px', // Smaller button size
              height: '35px', // Smaller button size
              fontSize: '1rem',
              fontWeight: 'bold',
              boxShadow: '0 2px 6px rgba(0, 0, 0, 0.2)',
              border: 'none',
            }}
            onClick={() => setShowOptions(!showOptions)}
          >
            {firstLetter}
          </Button>
          {showOptions && (
            <div
              className="position-absolute bg-white shadow p-2 rounded"
              style={{ right: '0px', top: '50px', zIndex: 1000 , width: '170px'}}
            >
             <Link className="d-block p-2 text-dark text-decoration-none" to="MyCard" onClick={handleOptionClick}>View Card</Link>
              <Link className="d-block p-2 text-dark text-decoration-none" to="Wishlist" onClick={handleOptionClick}>Wishlist</Link>
              <Link className="d-block p-2 text-dark text-decoration-none" to="MyBookings" onClick={handleOptionClick}>My Bookings</Link>
              <Link className="d-block p-2 text-dark text-decoration-none" to="mytriphistroy" onClick={handleOptionClick}>Trip Histroy</Link>
              <Link className="d-block p-2 text-dark text-decoration-none" to="My profile" onClick={handleOptionClick}>My profile</Link>
              <Link className="d-block p-2 text-dark text-decoration-none" to="logout" onClick={handleOptionClick}>Logout</Link>
            </div>
          )}
        </div>
      </Navbar>

      {/* Main Content */}
      <div>
        <Outlet /> {/* This will render the component based on the selected route */}
      </div>
    </Container>
  );
}

export default UserControlPanel;
