import './App.css';
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Website from './Components/Landing';
import Safar_ForgetPass from './Components/Safar_ForgetPass';
import Register from './Components/Register';
import Safar_login from './Components/Login';
import { useSelector } from 'react-redux';
import AdminPanel from './Components/Admin';
import Logout from './Components/logout';
import View from './Components/Companyviewtrips';
import ViewTripsforUser from './Components/ViewforUser';
import UserPage from './Components/User';
import CompanyPanel from './Components/CompanyPanel';
import AddPackage from './Components/PackageAdd';
import AdminRegister from './Components/NewAdmin';
import TripsRegister from './Components/AddTripDetails';
import Trips from './Components/ShowTripsForAdmin';
import Companies from './Components/showcompainesforadmin';
import Tourists from './Components/adminviewtourist';
import AddPackageForm from './Components/AddNewPackageforCompany';

function App() {
  const myState = useSelector((state) => state.logged);

  return (
    <div>
      <div style={{ display: myState.loggedIn ? "none" : "block" }}>
        {/* Navigation Bar */}
        <nav style={styles.navBar}>
          <div className="container-fluid d-flex justify-content-between align-items-center">
            {/* Brand */}
            <Link to="/" className="navbar-brand text-white fw-bold d-flex align-items-center">
              🌍 Safar
            </Link>

            {/* Navigation Links */}
            <ul style={styles.navList}>
              <li><Link to="/" style={styles.navLink}>Home</Link></li>
              <li><Link to="/about" style={styles.navLink}>About Us</Link></li>
              <li><Link to="/login" style={styles.navLink}>Login</Link></li>
              <li><Link to="/signup" style={styles.navLink}>Signup</Link></li>
            </ul>
          </div>
        </nav>
      </div>

      {/* Routes */}
      <Routes>
        <Route path="/" element={<Website />} />
        <Route path="/forgetpassword" element={<Safar_ForgetPass />} />
        <Route path="/signup" element={<Register />} />
        <Route path="/login" element={<Safar_login />} />
       
        <Route path="/admin" element={<AdminPanel />} >
          <Route path="managetrips" element={ <Trips />} />
          <Route path="managecompanies" element={ <Companies />} />
          <Route path="managetourists" element={ <Tourists />} />
          <Route path="newadmin" element={ <AdminRegister/>} />
          <Route path="logout" element={ <Logout />} />
        </Route>
       
        <Route path="/user" element={<UserPage/>} >
           <Route path="view" element={ <ViewTripsforUser />} />
           <Route path="updateprofile" element={ <Safar_ForgetPass />} />
          <Route path="logout" element={ <Logout />} />
         </Route>
         <Route path="/company" element={<CompanyPanel />} >
          <Route path="view" element={ <View />} />
          <Route path="addnewpack" element={ <AddPackageForm />} />
          <Route path="addnewtrips" element={ <AddPackage />} />
          <Route path="logout" element={ <Logout />} />
        </Route>
      </Routes>
    </div>
  );
}

const styles = {
  navBar: {
    backgroundColor: '#003f5c',
    padding: '1rem',
    boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
    position: 'sticky',
    top: 0,
    zIndex: 1000,
  },
  navList: {
    display: 'flex',
    justifyContent: 'flex-end',
    listStyleType: 'none',
    margin: 0,
    padding: 0,
    gap: '1rem',
  },
  navLink: {
    textDecoration: 'none',
    color: '#ffffff',
    padding: '0.5rem 1rem',
    fontWeight: 'bold',
    borderRadius: '5px',
    transition: 'background-color 0.3s ease, color 0.3s ease',
  },
  navLinkHover: {
    backgroundColor: '#ff7e5f',
    color: '#ffffff',
  },
};

export default App;
