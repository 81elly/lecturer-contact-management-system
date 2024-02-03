// app.js (or your main file)

const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const path = require('path');
const mysql = require('mysql2');
const app = express();

// MySQL Connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'lecturer_contact',
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL: ', err);
  } else {
    console.log('Connected to MySQL database');
  }
});

// Middleware
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

// Routes
// Mount the auth router
app.use('/', router);

// auth.js
// Implement your authentication logic, e.g., checking credentials against a database
async function authenticateUser(email, password, userType) {
  // Implement authentication logic here
  // Return true if authentication is successful, false otherwise
  return true; // Replace with your actual authentication logic
}

// Render the login page
router.get('/login', (req, res) => {
  res.render('login');
});

// Handle login form submission
router.post('/login', async (req, res) => {
  const { email, password, userType } = req.body;

  // Authenticate user
  const isAuthenticated = await authenticateUser(email, password, userType);

  // Redirect based on user type
  if (isAuthenticated) {
    if (userType === 'student') {
      res.redirect('/student');
    } else if (userType === 'admin') {
      res.redirect('/admin');
    }
  } else {
    res.send('Invalid credentials');
  }
});

// Render student page
app.get('/student', (req, res) => {
  // Implement logic to fetch student data and pass it to the student.pug template
  db.query('SELECT * FROM lecturers', (err, results) => {
    if (err) {
      console.error('Error querying lecturers: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.render('student', { lecturers: results });
    }
  });
});

// Render admin page

app.get('/admin', (req, res) => {
  // Implement logic to fetch admin data and pass it to the index.pug template
  db.query('SELECT * FROM lecturers', (err, results) => {
    if (err) {
      console.error('Error querying lecturers: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.render('index', { lecturers: results });
    }
  });
});


// Additional routes for adding, editing, and deleting lecturers (as in your provided code)

// Student View Route
app.get('/student', (req, res) => {
  db.query('SELECT * FROM lecturers', (err, results) => {
    if (err) {
      console.error('Error querying lecturers: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.render('student', { lecturers: results });
    }
  });
});


app.get('/', (req, res) => {
  db.query('SELECT * FROM lecturers', (err, results) => {
    if (err) {
      console.error('Error querying lecturers: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.render('index', { lecturers: results });
    }
  });
});

app.post('/add', (req, res) => {
  const { name, email, phone } = req.body;
  db.query('INSERT INTO lecturers (name, email, phone) VALUES (?, ?, ?)', [name, email, phone], (err) => {
    if (err) {
      console.error('Error adding lecturer: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.redirect('/');
    }
  });
});

app.get('/edit/:id', (req, res) => {
  const lecturerId = req.params.id;
  db.query('SELECT * FROM lecturers WHERE id = ?', [lecturerId], (err, result) => {
    if (err) {
      console.error('Error querying lecturer: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      const lecturer = result[0];
      res.render('edit', { lecturer });
    }
  });
});

app.post('/edit/:id', (req, res) => {
  const lecturerId = req.params.id;
  const { name, email, phone } = req.body;
  db.query('UPDATE lecturers SET name = ?, email = ?, phone = ? WHERE id = ?', [name, email, phone, lecturerId], (err) => {
    if (err) {
      console.error('Error updating lecturer: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.redirect('/');
    }
  });
});

app.get('/delete/:id', (req, res) => {
  const lecturerId = req.params.id;
  db.query('DELETE FROM lecturers WHERE id = ?', [lecturerId], (err) => {
    if (err) {
      console.error('Error deleting lecturer: ', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.redirect('/');
    }
  });
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});


