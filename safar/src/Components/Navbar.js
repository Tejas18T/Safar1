import { Link } from "react-router-dom";

function Navbar() {
    return (
        <nav className="navbar navbar-expand-lg navbar-dark" style={{ backgroundColor: '#003f5c', padding: '1rem' }}>
            <div className="container-fluid">
                {/* Brand */}
                <Link to="/" className="navbar-brand fw-bold d-flex align-items-center">
                     Safar 🌍
                </Link>

                {/* Toggler for Mobile View */}
                <button
                    className="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarContent"
                    aria-controls="navbarContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                >
                    <span className="navbar-toggler-icon"></span>
                </button>

                {/* Navbar Links */}
                <div className="collapse navbar-collapse" id="navbarContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link to="/" className="nav-link text-white">Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link to="/about" className="nav-link text-white">About</Link>
                        </li>
                    </ul>

                    {/* Right-Side Links */}
                    <ul className="navbar-nav d-flex">
                        <li className="nav-item">
                            <Link to="/login" className="nav-link text-white">Login</Link>
                        </li>
                        <li className="nav-item">
                            <Link to="/signup" className="btn btn-warning ms-3 text-white fw-bold">Sign Up</Link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    );
}

export default Navbar;
