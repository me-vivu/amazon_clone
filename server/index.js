//Imports from packages
const express = require('express');
const mongoose = require('mongoose');


//Imports from other files
const authRouter = require("./routes/auth");

//Defining the port for the app server
const PORT = 3000;
const dbUrl = "mongodb+srv://amazonClone:zKq5zhRUSos0kIxJ@cluster0.ftjd6iv.mongodb.net/?retryWrites=true&w=majority"

const app = express();

app.use(express.json());
app.use(authRouter);


//Connection Between backend to database
mongoose
 .connect(dbUrl)
 .then(() => {
    console.log("Connection Successful!");
 })
 .catch((e) => {
    console.log(e);
 });

app.listen(PORT, "192.168.56.1", () =>{
    console.log(`Connected at port ${PORT} world` );
});