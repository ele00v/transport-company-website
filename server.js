const mysql = require('mysql2');
const express = require('express');
const path = require('path');
const app = express();

// Set the views directory
app.set('views', path.join(__dirname, 'views'));

// Connect to the database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'roadrunner'
});

// Set the static directories for CSS and images
app.use(express.static(path.join(__dirname, 'public')));

// Set the view engine to EJS
app.set('view engine', 'ejs');

// Define the home route
app.get('/', (req, res) => {
  res.render('home');
});

app.get('/schedule', (req, res) => {
  const from = req.query.from;
  const to = req.query.to;
  // Retrieve data from the database based on the user's input
  connection.query(`SELECT FROM_CITY, TO_CITY,DATE_FORMAT(DATE_T, '%c/%e/%Y') AS DATE_T, TIME_FORMAT(DEPARTURE, '%H:%i:%s') AS DEPARTURE, TIME_FORMAT(ARRIVAL, '%H:%i:%s') AS ARRIVAL, SEATS_AVAIL, PRICE FROM schedule WHERE FROM_CITY = ? AND TO_CITY = ?`, [from, to], (error, results) => {
    if (error) {
      console.error(error);
      res.status(500).send('Internal server error');
    } else {
      res.render('schedule', { data: results });
    }
  });
});
app.get('/about', (req, res) => {
  res.render('about');
});

app.get('/book', (req, res) => {
  res.render('book');
});

app.get('/home', (req, res) => {
  res.render('home');
});

// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});