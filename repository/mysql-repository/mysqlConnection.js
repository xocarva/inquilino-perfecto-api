const mysql = require('mysql2/promise')


const { MYSQL_HOST, MYSQL_DATABASE, MYSQL_ROOT_USER, MYSQL_ROOT_PASSWORD } = process.env

const pool = mysql.createPool({
  host: MYSQL_HOST,
  user: MYSQL_ROOT_USER,
  password: MYSQL_ROOT_PASSWORD,
  database: MYSQL_DATABASE,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
})

module.exports = pool