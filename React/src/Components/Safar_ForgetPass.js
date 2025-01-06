import React, { useReducer, useState } from "react";
import { Link } from "react-router-dom";

export default function Safar_ForgetPass({ closeModal }) {
  const [msg, setMsg] = useState("");

  const init = {
    username: "",
    mobileno: "",
    email: "",
    password: "",
  };

  const reducer = (state, action) => {
    switch (action.type) {
      case "update":
        return {
          ...state,
          [action.field]: action.value,
        };
      default:
        return state;
    }
  };

  const [info, dispatch] = useReducer(reducer, init);

  const inUsername = (e) => {
    dispatch({ type: "update", field: "username", value: e.target.value });
  };

  const inMobile = (e) => {
    dispatch({ type: "update", field: "mobileno", value: e.target.value });
  };

  const inEmail = (e) => {
    dispatch({ type: "update", field: "email", value: e.target.value });
  };

  const inPassword = (e) => {
    dispatch({ type: "update", field: "password", value: e.target.value });
  };

  const onReset = (e) => {
    e.preventDefault();
    if (!info.username || !info.mobileno || !info.email || !info.password) {
      setMsg("All fields are required.");
      return;
    }

    const setInfo = {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(info),
    };
    fetch("http://localhost:8080/forgotpassword", setInfo)
      .then((response) => response.text())
      .then((msg) => setMsg(msg))
      .catch((err) => setMsg(err.toString()));
  };

  return (
    <div className="container d-flex justify-content-center align-items-center" style={{ minHeight: '100vh' }}>
      <div className="login-container" style={styles.loginContainer}>
        <h2 className="res-sty text-center" style={styles.resSty}>Reset Password</h2>
        <form onSubmit={onReset}>
          <div className="form-group">
            <label htmlFor="username" className="form-label" style={styles.formLabel}>Username:</label>
            <input
              type="text"
              value={info.username}
              onChange={inUsername}
              className="form-control"
              placeholder="Enter your username"
              required
              style={styles.formControl}
            />
          </div>
          <div className="form-group">
            <label htmlFor="mobileno" className="form-label" style={styles.formLabel}>Mobile No:</label>
            <input
              type="text"
              value={info.mobileno}
              onChange={inMobile}
              className="form-control"
              placeholder="Enter your mobile no"
              required
              style={styles.formControl}
            />
          </div>
          <div className="form-group">
            <label htmlFor="email" className="form-label" style={styles.formLabel}>Email:</label>
            <input
              type="email"
              value={info.email}
              onChange={inEmail}
              className="form-control"
              placeholder="Enter your email"
              required
              style={styles.formControl}
            />
          </div>
          <div className="form-group">
            <label htmlFor="password" className="form-label" style={styles.formLabel}>New Password:</label>
            <input
              type="password"
              value={info.password}
              onChange={inPassword}
              className="form-control"
              placeholder="Enter your new password"
              required
              style={styles.formControl}
            />
          </div>
          <br/>
          <button type="submit" className="btn btn-primary btn-block" style={styles.button}>
            Reset Password
          </button>
          <div className="mt-3 text-center">
          <Link
  to="#"
  onClick={(e) => {
    e.preventDefault();
    closeModal();  // This will close the forgot password modal
  }}
  style={styles.link}
>
  Back to Login
</Link>
</div>
          {msg && <p className="message text-center" style={styles.message}>{msg}</p>}
        </form>
      </div>
    </div>
  );
}

const styles = {
  loginContainer: {
    width: '100%',
    maxWidth: '500px',
    background: 'rgba(255, 255, 255, 0.8)',
    padding: '30px',
    borderRadius: '10px',
    boxShadow: '0 4px 8px rgba(0, 0, 0, 0.1)',
  },
  resSty: {
    color: '#e67600',
    fontFamily: "'Arial', sans-serif",
    fontWeight: '600',
    fontSize: '24px',
    textAlign: 'center',
    marginBottom: '20px',
  },
  formLabel: {
    fontWeight: 'bold',
    color: '#333',
    fontSize: '16px',
    marginBottom: '5px',
    textTransform: 'capitalize',
  },
  formControl: {
    width: '100%',
    padding: '12px',
    fontSize: '16px',
    border: '1px solid #ccc',
    borderRadius: '8px',
    transition: 'all 0.3s ease',
    outline: 'none',
  },
  message: {
    color: 'red',
    fontSize: '14px',
    textAlign: 'center',
    marginTop: '15px',
  },
  button: {
    width: '100%',
    padding: '12px',
    backgroundColor: 'orange',
    color: 'white',
    fontSize: '16px',
    border: 'none',
    borderRadius: '8px',
    cursor: 'pointer',
    transition: 'background-color 0.3s ease',
  },
  link: {
    color: '#28a745',
    textDecoration: 'none',
    fontSize: '14px',
    fontWeight: '500',
    transition: 'color 0.3s ease',
  },
};
