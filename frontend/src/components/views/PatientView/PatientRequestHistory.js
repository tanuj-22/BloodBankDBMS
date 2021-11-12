import React from 'react'
import { useEffect } from 'react';
import { useState } from 'react';
import axios from "../../axios";
const PatientRequestHistory = () => {

    const [bloodrequests, setBloodrequests] = useState([]);
    useEffect(() => {
      axios
      .get("/getpatientsbloodrequestHistory/"+localStorage.getItem("roleID"))
        .then((res) => {
          console.log(res.data);
          setBloodrequests(res.data);
        })
        .catch((err) => console.log(err));
    }, []);
  
    
  
    const actionTab = (bloodrequests) => {
    
     if (bloodrequests.status === "approved") {
        return (
          <td>
            <span className="label success">
              Approved
            </span>
          </td>
        );
      } else if (bloodrequests.status === "rejected") {
        return (
          <td>
            <span className="label danger">Rejected</span>
          </td>
        );
      }
      else{
          return (<td>
          <span className="label warning">Pending</span>
        </td>)
      }
  }
    const AllRequestTab = bloodrequests.map((bloodrequests) => {
        
      return (
        <tbody>
          <tr>
            <td>{bloodrequests.requestID}</td>
            <td>{bloodrequests.reason}</td>
            <td>{bloodrequests.doctor}</td>
            <td>{bloodrequests.unit}</td>
            <td>{`${bloodrequests.date_of_request}`.slice(0, 10)}</td>
            {actionTab(bloodrequests)}
          </tr>
        </tbody>
      );
    });
  

    return (
        <>
      <style
        dangerouslySetInnerHTML={{
          __html:
            "\n        .label {\n     color: white;\n     padding: 8px;\n   }\n   \n   .success {background-color: #4CAF50;} /* Green */\n   .info {background-color: #2196F3;} /* Blue */\n   .warning {background-color: #ff9800;} /* Orange */\n   .danger {background-color: #f44336;} /* Red */\n   .other {background-color: #e7e7e7; color: black;} /* Gray */\n    ",
        }}
      />
      <br />
      <br />
      <div className="container">
        <h4 className="text-center">BLOOD REQUESTED</h4>
        <br />

        <table className="table table-light table-hover table-bordered table-striped">
          <thead className="bg-info">
            <tr>
                <th>Request Number</th>
              <th scope="col">Reason</th>
              <th scope="col">Doctor</th>
              <th scope="col">Unit</th>
              <th scope="col">Request Date</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          {AllRequestTab}
        </table>
      </div>
    </>
    )
}

export default PatientRequestHistory
