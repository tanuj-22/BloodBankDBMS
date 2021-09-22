import "./App.css";
import "./index.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Logout from "./components/Logout";
import Navbar from "./components/Navbarmui";
import Home from "./components/Home";
import NavbarLoggedIn from "./components/NavbarmuiLoggedIn";
import Footer from "./components/Footer";
import AdminLogin from "./components/AdminLogin";
import Dashboard from "./components/Dashboard";
import RoleBasedRoute from "./components/RoleBasedRoute";

function App() {
  return (
    <div className="App">
      <div className="App">
        <Router>
          <Switch>
            <Route exact path="/">
              <Navbar />
              <Home />
              <Footer />
            </Route>
            <Route exact path="/patient/dashboard">
              <NavbarLoggedIn />
            </Route>
            <Route exact path="/admin/login">
              <AdminLogin />
            </Route>

            <Route exact path="/dashboard">
              <NavbarLoggedIn />
              <Dashboard />
            </Route>
            <Route exact path="/logout" component={Logout} />
            {/*<Route exact path="/login" component={Login} />
          <Route exact path="/logout" component={Logout}/>
          <Route exact path="/signup" component={Signup} />
          <Route exact path="/About" component={About}/> */}

            <RoleBasedRoute
              exact
              path="/admin-donor-view"
              role="admin"
              component={() => {
                return <>admin-donor-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-patient-view"
              role="admin"
              component={() => {
                return <>admin-patient-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-donations-view"
              role="admin"
              component={() => {
                return <>admin-donations-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-bloodrequests-view"
              role="admin"
              component={() => {
                return <>admin-bloodrequests-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-requesthistory-view"
              role="admin"
              component={() => {
                return <>admin-requesthistory-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-bloodstockupdate-view"
              role="admin"
              component={() => {
                return <>admin-bloodstockupdate-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/admin-bloodstockupdate-view"
              role="donor"
              component={() => {
                return <>admin-bloodstockupdate-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/donor-donateblood-view"
              role="donor"
              component={() => {
                return <>donor-donateblood-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/donor-donationhistory-view"
              role="donor"
              component={() => {
                return <>donor-donationhistory-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/patient-makebloodrequests-view"
              role="patient"
              component={() => {
                return <>patient-makebloodrequests-view</>; 
              }}
            />
            <RoleBasedRoute
              exact
              path="/patient-requesthistory-view"
              role="patient"
              component={() => {
                return <>patient-requesthistory-view</>; 
              }}
            />

          </Switch>
        </Router>
      </div>
    </div>
  );
}

export default App;
