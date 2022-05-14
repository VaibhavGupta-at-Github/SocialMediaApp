/* eslint-disable no-unused-vars */
/* eslint-disable react-hooks/exhaustive-deps */
import { useEffect } from "react";
import { useLocation } from "react-router";
import "./App.css";
import Header from "./components/Layout/Header";

const isLoggedIn = () => {
  const userData = localStorage.getItem("userData");
  if (userData != null) {
    return (
      <a className="btn btn-primary btn-lg" href="/profile" role="button">
        Go to Profile
      </a>
    );
  } else {
    return (
      <a className="btn btn-primary btn-lg" href="/signup" role="button">
        Sign Up
      </a>
    );
  }
};

const App = () => {
  const { state } = useLocation();
  let m=""
  let s=""

  useEffect(() => {
    if (state) {
      const { messageStatus, message } = state;
      m=messageStatus
      s=message
    }
  }, [state]);
  return (
    <div>
      <Header image={true} />
      <div
        className="jumbotron container"
        style={{
          border: "5px solid #4bcfff",
          borderRadius: "5px",
          textAlign: "center",
          padding: "10px",
          width: "100%",
          marginLeft: "auto",
          marginRight:"auto",
          marginTop: "20px",
        }}
      >
        <h1 className="display-3">Welcome to Social Media Platform</h1>
        <p className="lead">
          Now connect with your loved ones across the globe.
        </p>
        <hr className="my-4" />
        <p>Join the community of millions.</p>
        <div>{isLoggedIn()}</div>
      </div>
    </div>
  );
};

export default App;
