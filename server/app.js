const express = require("express");
var bodyParser = require("body-parser");
const mysql = require("mysql");
const cors = require('cors');

// Create connection

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  multipleStatements: true,
  database: "bloodbankdbver1",
});

//connect

db.connect((err) => {
  if (err) {
    console.log(err);
  }
  console.log("mysql connected");
});

const app = express();
app.use(cors());
app.use(express.json());

app.post('/getUserInfo',(req,res)=>{
  
  console.log(req.body);
  let sql = `CALL get_user('${req.body.username}', @role, @ID)`;

  let query = db.query(sql,(err,result)=>{
    if (err){
      console.log(err);
      res.send("User does not exist");
      res.status(404);
    }
    console.log(result);
    result = result[0][0];
    res.send({role : result["role"],roleID : result["ID"]});
    res.status(200);

  })

});




app.listen("3001", () => {
    console.log("Server started at port 3001");
  });