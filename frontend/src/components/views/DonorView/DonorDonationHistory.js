import axios from "../../axios";
import React from "react";
import { useEffect } from "react";
import { useState } from "react";

const DonorDonationHistory = () => {
  const [donations, setDonations] = useState([]);
  useEffect(() => {
    axios
      .get("/getDonorDonationsHistory/"+localStorage.getItem("roleID"))
      .then((res) => {
        console.log(res.data);
        setDonations(res.data);
      })
      .catch((err) => console.log(err));
  }, []);


  const actionTab = (donation) => {
    
    if (donation.status === "approved") {
      return (
        <td>
          <span className="label success">Approved</span>
        </td>
      );
    } else if (donation.status === "rejected") {
      return (
        <td>
          <span className="label danger">Rejected</span>
        </td>
      );
    } else {
      return (
        <td>
          <span className="label warning"> Pending </span>
        </td>
      );
    }
  };
  const DonationTab = donations.map((donation) => {
    return (
      <tbody>
        <tr>
          <td>{donation.donationID}</td>
          <td>{donation.unit}</td>
          <td>{`${donation.date_of_donation}`.slice(0, 10)}</td>
          {actionTab(donation)}
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
        <h4 className="text-center">BLOOD DONATION HISTORY</h4>
        <br />

        <table className="table table-light table-hover table-bordered table-striped">
          <thead className="bg-info">
            <tr>
              <th scope="col">Donation ID</th>
              <th scope="col">Unit</th>
              <th scope="col">Donation Date</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          {DonationTab}
        </table>
      </div>
    </>
  );
};

export default DonorDonationHistory;
