const express = require('express')
const cors = require('cors')
const bp = require('body-parser')

// router
const api_authen = require('./src/api/authen/authenRouter')

require('dotenv').config()

const app = express()
app.use(cors());
app.use((req,res,next)=>{
    res.header('Access-Control-Allow-Headers, *, Access-Control-Allow-Origin', 'Origin, X-Requested-with, Content_Type,Accept,Authorization','http://localhost:4200');
    if(req.method === 'OPTIONS') {
        res.header('Access-Control-Allow-Methods','PUT,POST,PATCH,DELETE,GET');
        return res.status(200).json({});
    }
    next();
});

app.use(bp.json())
app.use(bp.urlencoded({ extended: true }))

// app.use(function (req, res, next) {
//   res.setHeader('Access-Control-Allow-Origin', '*');
//   res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
//   res.setHeader('Access-Control-Allow-Methods', 'POST, GET, PATCH, DELETE, OPTIONS');
//   next();
// });

// api
app.use('/api_authen', api_authen)

app.listen(process.env.PORT, () =>
	console.log(`Server is running port ${process.env.IP}`)
)
