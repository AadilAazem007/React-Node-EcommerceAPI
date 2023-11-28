import express from "express";
import router from "./routes/web.js";
import cors from 'cors'
import bodyParser from 'body-parser'

const app = express()
const port = 3002

//app.use(bodyParser.json({ type: 'application/*+json' }))
app.use(cors())
app.use(bodyParser.json());
app.use('/', router)

app.listen(port, ()=> {
    console.log(`server connect on port ${port}`)
})