import React, { useState } from 'react';
import { Link, Outlet } from 'react-router-dom';
import { Container, Row, Col } from 'react-bootstrap';

function UserPage() {
  const [selectedOption, setSelectedOption] = useState('Dashboard');

  return (
    <Container fluid >
      {/* Admin Panel Layout */}
      <Row>
        {/* Sidebar */}
        <Col xs={3} className="bg-dark text-white vh-100 p-3">
          <h3 className="text-center mb-4">User Panel</h3>
          <div className="list-group" >
            <Link
              to="#"
              className={`list-group-item list-group-item-action ${selectedOption === 'Dashboard' ? 'active' : ''}`}
              
            >
              Dashboard
            </Link>
            <Link
              to="view"
              className={`list-group-item list-group-item-action ${selectedOption === 'Users' ? 'active' : ''}`}
              
            >
              View trips
            {/* </Link>
            <Link
              to="#"
              className={`list-group-item list-group-item-action ${selectedOption === 'Settings' ? 'active' : ''}`}
              
            >
              Add new Company
            </Link>
            <Link
              to="#"
              className={`list-group-item list-group-item-action ${selectedOption === 'Reports' ? 'active' : ''}`}
              
            >
              Reports */}
            </Link>
            <Link
              to="updateprofile"
              className={`list-group-item list-group-item-action ${selectedOption === 'Logout' ? 'active' : ''}`}
              
            >
              Update Profile
            </Link>
            <Link
              to="logout"
              className={`list-group-item list-group-item-action ${selectedOption === 'Logout' ? 'active' : ''}`}
              
            >
              Logout
            </Link>
          </div>
        </Col>

        <Col xs={9} className="p-4">
          <Outlet />
        </Col>
      </Row>
    </Container>
  );
}

export default UserPage;
