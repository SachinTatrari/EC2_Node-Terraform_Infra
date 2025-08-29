const express = require('express');

const app = express();
app.use(express.json());

app.get('/',(req, res) => {
    res.send("You are seeing the application live");
})

app.listen(3000, '0.0.0.0' , () =>{
    console.log('Server is running on port 3000')
})

module.exports= app;