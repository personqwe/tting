const mysql = require('mysql');
const {Router} = require('express');
const router = Router();

const mysqlConnection = mysql.createConnection({
    host: '############', 
    user: '###########',
    password: '#########',
    database: '###########'
});

mysqlConnection.connect();

console.log("들어왔음");

router.get('/dbtest', (req, res) =>{
    const query = 'SELECT * FROM tbl_카드 WHERE id = 1';
    mysqlConnection.query(query, (err, result) => {
    if (err) {
      throw err;
    }
    console.log("ok");
    res.json(result);
  });
});

module.exports = router;