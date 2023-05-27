const mysql = require('mysql2');
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const { PDFDocument, StandardFonts } = require('pdf-lib');
const fs = require('fs');

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
          // Insert the email information into the database
          connection.query(
            'INSERT INTO bookings (schedule_id, name, surname, email) VALUES (?, ?, ?, ?)',
            [scheduleId, firstName, lastName, email],
            (insertErr, insertResult) => {
              if (insertErr) {
                console.log(insertErr);
                res.status(500).json({ error: 'Failed to insert email' });
              } else // Retrieve the inserted email information
              connection.query(
                'SELECT b.name, b.surname, b.email, s.from_city, s.to_city, s.date_t, s.price FROM bookings AS b INNER JOIN schedule AS s ON b.schedule_id = s.schedule_id WHERE b.booking_id = ?',
                [insertResult.insertId],
                (selectErr, selectResult) => {
                  if (selectErr) {
                    console.log(selectErr);
                    res.status(500).json({ error: 'Failed to retrieve email information' });
                  } else if (selectResult.length === 0) {
                    console.log('No email information found');
                    res.status(500).json({ error: 'No email information found' });
                  } else {
                    // Render the ticket page with the required information
                    res.render('ticket', {
                      name: selectResult[0].name,
                      surname: selectResult[0].surname,
                      email: selectResult[0].email,
                      from:selectResult[0].from_city,
                      to:selectResult[0].to_city,
                      date_t:selectResult[0].date_t,
                      price:selectResult[0].price,
                    });
                  }
                }
              );
            }
          );
        }
      }
    }
  );
});



