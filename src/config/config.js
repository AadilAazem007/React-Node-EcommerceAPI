import mysql from 'mysql'

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "12345",
  database: 'ecommerce'
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

export default con
