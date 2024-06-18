const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('mysql');

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'video_streaming'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to database');
});

app.post('/login', (req, res) => {
    const { email, senha } = req.body;
    const query = 'SELECT * FROM Cliente WHERE email = ? AND senha = ?';
    db.query(query, [email, senha], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, message: 'Login successful' });
        } else {
            res.send({ success: false, message: 'Invalid credentials' });
        }
    });
});

app.listen(3000, () => {
    console.log('Server running on port 3000');
});
