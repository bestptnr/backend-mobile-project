var express = require('express');
var app = express();
var bodyParser = require('body-parser');
const recipes = require('./routes/uesr')
const adminBackend = require('./routes/admin')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended:true
}))

app.get('/',(req,res)=>{
    return res.send({error:true,message:"Test web API"})
})



app.use('/food',recipes)
app.use('/admin',adminBackend)

app.listen(3000,()=>{
    console.log("Node app is running on port 3000")
})

module.exports = app;