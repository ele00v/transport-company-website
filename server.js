const mysql = require('mysql2');
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
// Set the views directory
app.set('views', path.join(__dirname, 'views'));
app.use(express.json());
// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});


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
  connection.query(`SELECT FROM_CITY, TO_CITY, DATE_T, SEATS_AVAIL, PRICE FROM schedule WHERE FROM_CITY = ? AND TO_CITY = ?`, [from, to], (error, results) => {
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
  const sql = 'SELECT DATE_T FROM schedule WHERE from_city = ? AND to_city = ?';

  connection.query(sql, [fromCity, toCity], (err, results) => {
    if (err) {
      console.log(err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else { 
      res.json(results);
      console.log(results);
    }
  });
});

app.post('/book', (req, res) => {
  const fromCity = req.body.from;
  const toCity = req.body.to;
  const date = req.body.date;
  const firstName = req.body.fname;
  const lastName = req.body.lname;
  const email = req.body.email;
  console.log(date);
  console.log(fromCity);
  console.log(toCity);
  connection.query(
    'SELECT schedule_id FROM schedule WHERE from_city = ? AND to_city = ? AND DATE(date_t) = DATE(?)',
    [fromCity, toCity, date],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).json({ error: 'Internal Server Error' });
      } else {
        if (results.length === 0) {
          res.status(404).json({ error: 'No schedule found' });
        } else {
          const scheduleId = results[0].schedule_id;
          console.log(scheduleId);
        }
      }
    }
  );
});