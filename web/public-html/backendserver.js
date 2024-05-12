const waitPort = require('wait-port');
const mysql = require('mysql2');
const express = require('express');
const app = express();

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', 'http://localhost:8080');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.header('Content-Type', 'application/json; charset=utf-8');  
  next();
});

const params = {
  host: 'db', // If running in Docker and using Docker Compose, use the service name defined in docker-compose.yml
  port: 3306,
};

waitPort(params)
  .then(({ open, ipVersion }) => {
    if (open) {
      const PORT = process.env.PORT || 3000;

      const connection = mysql.createConnection({
          host     : 'db', // Same here, use 'db' or your MySQL container service name
          user     : 'root',
          password : 'root',
          database : 'studentdatabase',
          port: 3306,
      });

      connection.connect(function(err) {
          if (err) {
              console.error('error connecting: ' + err.stack);
          } else {
              console.log('connected as id ' + connection.threadId);
          }
      });

      app.listen(PORT, () => {
        console.log(`Server listening on port ${PORT}!`);
      });

      app.get('/students', (req, res) => {
        connection.query('SELECT * FROM Students', function (error, results, fields) {
          if (error) {
              console.log(error);
              res.status(500).send('Error retrieving data');
          } else {
            const students = results.map(result => ({
              id: result.StudentID,
              firstName: result.FirstName,
              lastName: result.LastName,
              enrollmentDate: result.EnrollmentDate,
              email: result.Email,
              cgpa: parseFloat(result.CGPA),
              age: result.Age
            }));
            console.log(students);
            res.send(students);
          }
        });
      });

    } else {
      console.log('The port did not open before the timeout...');
    }
  })
  .catch((err) => {
    console.error(`An unknown error occurred while waiting for the port: ${err}`);
  });
