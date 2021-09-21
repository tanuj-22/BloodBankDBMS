import "./App.css";
import "./index.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Navbar from "./components/Navbarmui";
import Home from "./components/Home";
import NavbarLoggedIn from "./components/NavbarmuiLoggedIn";
import Footer from "./components/Footer";
import AdminLogin from "./components/AdminLogin";
import Dashboard from "./components/Dashboard";

function App() {
  return (
    <div className="App" >
      <div className="App">
        <Router>
          <Switch>
            <Route exact path="/">
              <Navbar />
              <Home />
              <Footer/>
            </Route>
            <Route exact path="/patient/dashboard">
              <NavbarLoggedIn />
            </Route>
            <Route exact path="/admin/login">
              <AdminLogin/>
            </Route>
            
             <Route exact path="/dashboard" component={Dashboard} />
          {/*<Route exact path="/login" component={Login} />
          <Route exact path="/logout" component={Logout}/>
          <Route exact path="/signup" component={Signup} />
          <Route exact path="/About" component={About}/> */}
          </Switch>
          
        </Router>
      </div>
    </div>
  );
}

export default App;
