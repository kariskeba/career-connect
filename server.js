
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
// const redirectDelay = 2000; // 2 seconds delay
const app = express();
const PORT = process.env.PORT || 3000;


// Set the view engine to Pug
app.set('view engine', 'pug');
app.use(express.static('public'));

// Parse URL-encoded bodies (as sent by HTML forms)
app.use(bodyParser.urlencoded({ extended: true }));

// Middleware to parse JSON and URL-encoded form data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Set up MySQL connection
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'career-connect'
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database: ' + err.stack);
    return;
  }
  console.log('Connected to MySQL database as id ' + connection.threadId);
});

// Route to handle login form submission
app.post('/login', (req, res) => {
  const { username, password } = req.body;


// Validate form data (e.g., check for required fields)

 // Insert data into the database
 const sql = 'INSERT INTO users (username, password) VALUES (?, ?)';
 connection.query(sql, [username, password], (err, result) => {
   if (err) {
     console.error('Error inserting data:', err);
     res.status(500).send('Error inserting data into the database');
   } else {
     console.log('Data inserted successfully');
     res.status(200).send('Data inserted successfully');
   }
 });
});



// Route to handle contact form submission
app.post('/contact', (req, res) => {
  const { name, email, message } = req.body;

  // Validate form data (e.g., check for required fields)

  // Insert data into the database
  const sql = 'INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)';
  connection.query(sql, [name, email, message], (err, result) => {
    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Error inserting data into the database');
    } else {
      console.log('Data inserted successfully');
      res.status(200).send('Data inserted successfully');
      
      //  res.send(
      // <script>
      // setTimeout(function() {
      //   window.location.href = '/dashboard'
      // }, ${redirectDelay});
      // </script>
  // );
        
  res.send(
  setTimeout(() => {
    res.redirect('/');
  }), 2000);
} });
});


// Define routes
app.get('/', (req, res) => {
  res.render('home');
});

app.get('/contact', (req, res) => {
  res.render('contact');
});

app.get('/about', (req, res) => {
  res.render('about');
});

app.get('/login', (req, res) => {
  res.render('login');
});


app.get('/modules', (req, res) => {
  res.render('modules');
});

app.get('/lecturers', (req, res) => {
  res.render('lecturers');
});

app.get('/course', (req, res) => {
  res.render('course');
});

app.get('/dashboard', (req, res) => {
  res.render('dashboard');
});


app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

