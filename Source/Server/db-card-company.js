const express = require('express');
const mysql = require('mysql');

const router = express.Router();

const mysqlConnection = mysql.createConnection({
    host: '#########', // RDS endpoint (AWS RDS)
    user: '##########',
    password: '##########',
    database: '###########'
});

console.log("Code 1");

mysqlConnection.connect();

router.get('/', (req, res) => {
    console.log('Request received');

    const sql = 'SELECT * FROM tbl_카드사';
    mysqlConnection.query(sql, (error, results) => {
        if (error) {
            console.log(error);
            res.status(500).send('Error retrieving data from database');
        } else {
            console.log(results);
            res.json(results);
        }
    });
});

module.exports = router;




