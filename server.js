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

app.get('/about', (req, res) => {
  res.render('about');
});

app.get('/book', (req, res) => {
  res.render('book');
});

app.get('/home', (req, res) => {
  res.render('home');
});

app.get('/schedule', (req, res) => {
  const from = req.query.from;
  const to = req.query.to;
  // Retrieve data from the database based on the user's input
  connection.query(`SELECT FROM_CITY, TO_CITY, DATE_FORMAT(DATE_T, \'%d/%m/%Y %H:%i\') AS DATE_T, SEATS_AVAIL, PRICE FROM schedule WHERE FROM_CITY = ? AND TO_CITY = ?`, [from, to], (error, results) => {
    if (error) {
      console.error(error);
      res.status(500).send('Internal server error');
    } else {
      res.render('schedule', { data: results });
    }
  });
});

app.get('/get_to_cities', (req, res) => {
  const fromCity = req.query.from;
  const sql = 'SELECT DISTINCT to_city FROM schedule WHERE from_city = ?';
  connection.query(sql, [fromCity], (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(results);
    }
  });
});

app.get('/get_dates', (req, res) => {
  const fromCity = req.query.from;
  const toCity = req.query.to;
  const sql = 'SELECT DATE_FORMAT(DATE_T, \'%d/%m/%Y %H:%i\') AS DATE_T FROM schedule WHERE from_city = ? AND to_city = ?';

  connection.query(sql, [fromCity, toCity], (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else { 
      res.json(results);
    }
  });
});

app.post('/book', (req, res) => {
  const from=req.query.from;
  const to = req.query.to;
  const date = req.query.date;
  const fname = req.query.fname;
  const lname = req.query.lname;

  // Retrieve the schedule id based on the selected from_city, to_city, and date_t values
  connection.query(`SELECT SCHEDULE_ID FROM schedule WHERE FROM_CITY = ? AND TO_CITY = ? AND DATE_FORMAT(DATE_T, \'%d/%m/%Y %H:%i\')= ?`, [from, to, date], (error, results) => {
    if (error) {
      console.error(error);
      res.status(500).send('Internal server error');
    } else {

      // If the query returns no results, return an error
      if (results.length === 0) {
        res.status(400).send('Invalid schedule selected');
        return;
      }

      const scheduleId = results[0].id;

      // Insert the booking into the database
      connection.query('INSERT INTO bookings (schedule_id, name, surname) VALUES (?, ?, ?)', [scheduleId, fname, lname], (error, results) => {
        if (error) {
          console.error(error);
          res.status(500).send('Internal server error');
        } else {
          res.render('booking_confirmation');
        }
      });
    }
  });
});


// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});