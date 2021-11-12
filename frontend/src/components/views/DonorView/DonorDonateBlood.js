import { Box, Button, MenuItem, TextField } from "@material-ui/core";
import React, { useState } from "react";
import axios from "../../axios";
const DonorDonateBlood = () => {
  

  const [bloodgrp, setBloodGrp] = useState(null);
  const [unit, setUnit] = useState(0);

  if(localStorage.getItem("roleID") && bloodgrp===null ){
    axios.post("/getDonorBloodGroup",{  donorId:localStorage.getItem("roleID") }).then(res=>setBloodGrp(res.data.blood_group));
  }

  const handleChange = (event) => {
    setBloodGrp(event.target.value);
  };
  const handleChange1 = (event) => {
    setUnit(event.target.value);
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
      .post("/makeDonationRequest", {  unit: parseInt(unit),donorId:localStorage.getItem("roleID") })
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
        <h2 className="text-center">DONATE BLOOD</h2>
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
  );
};

export default DonorDonateBlood;
