import { Box, Button, MenuItem, TextField } from "@material-ui/core";
import React, { useState } from "react";
import axios from "../../axios";

const PatientMakeRequest = () => {

    const [bloodgrp, setBloodGrp] = useState(null);
  const [unit, setUnit] = useState(0);
  const [reason, setReason] = useState(null);
  const [doctorName, setDoctorName] = useState(null);

  if(localStorage.getItem("roleID") && bloodgrp===null ){
    axios.post("/getPatientBloodGroup",{  patientID:localStorage.getItem("roleID") }).then(res=>setBloodGrp(res.data.blood_group));
  }


  const handleChange = (event) => {
    setBloodGrp(event.target.value);
  };
  const handleChange1 = (event) => {
    setUnit(event.target.value);
  };
  const handleChange2 = (event) => {
    setReason(event.target.value);
  };
  const handleChange3 = (event) => {
    setDoctorName(event.target.value);
  };
  const handleClick = (e) => {
    if(unit===0 || bloodgrp==="Blood Group" ){
        alert("Please fill all the fields");
    }
    else if(parseInt(unit)<0){
        alert("Please enter valid units");
    }
    else{
    e.preventDefault();
    axios
      .post("/makeBloodRequest", {  unit: parseInt(unit),patientID:localStorage.getItem("roleID"),reason:reason,doctor:doctorName })
      .then((res) => {
        console.log(res.data);
        if (res.status === 200) {
            alert("Request Sent Successfully");
          window.location.reload();
        }
      })
      .catch((err) => console.log(err));
  };
}

    return (
        <div>
      <Box
        component="form"
        sx={{
          "& .MuiTextField-root": { m: 1, width: "25ch" },
        }}
        noValidate
        autoComplete="off"
      >
        <br />
        <br />
        <h2 className="text-center">REQUEST BLOOD</h2>
        <br />
        <br />
        <div>
          <TextField
            id="outlined-select-bloodgrp"
            label="Your Blood Group"
            defaultValue="-- Blood Group"
            value={bloodgrp}
            // onChange={handleChange}
            variant="outlined"
            style={{ margin: "0 15px" }}
            center
            InputProps={{
                readOnly: true,
              }}
            //helperText="Please select blood group"
          >
            
          </TextField>
          <br />
          <br />
          <TextField
            required
            id="outlined-required"
            label="Unit"
            defaultValue="0"
            variant="outlined"
            style={{ margin: "0 15px" }}
            onChange={handleChange1}
          />
          <br />
          <br />
          <TextField
            required
            id="outlined-required"
            label="Reason"
            
            variant="outlined"
            style={{ margin: "0 15px" }}
            onChange={handleChange2}
          />
          <br />
          <br />
          <TextField
            required
            id="outlined-required"
            label="Doctor's Name"
            
            variant="outlined"
            style={{ margin: "0 15px" }}
            onChange={handleChange3}
          />
          <br />
          <br />
          <Button
            variant="contained"
            color="secondary"
            onClick={handleClick}
            style={{ marginTop: "8px" }}
          >
            Make Request
          </Button>
        </div>
      </Box>
    </div>
    )
}

export default PatientMakeRequest
