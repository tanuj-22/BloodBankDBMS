const express = require("express");
var bodyParser = require("body-parser");
const mysql = require("mysql");

// Create connection

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  multipleStatements: true,
  database: "bloodbankdb",
});

//connect

db.connect((err) => {
  if (err) {
    console.log(err);
  }
  console.log("mysql connected");
});

const app = express();
app.use(bodyParser.json());






app.listen("3001", () => {
    console.log("Server started at port 3001");
  });