var express = require('express');
var app = express();

var users = [
  { firstName: 'John 1', lastName: 'Doe 1', group: 'Super' },
  { firstName: 'John 2', lastName: 'Doe 2', group: 'Guest' },
  { firstName: 'John 3', lastName: 'Doe 3', group: 'Super' },
  { firstName: 'John 4', lastName: 'Doe 4', group: 'User' },
];

app.use(express.bodyParser());

app.get('/', function(req, res) {
  res.json(users);
});

app.get('/user/random', function(req, res) {
  var id = Math.floor(Math.random() * users.length);
  var q = users[id];
  res.json(q);
});

app.get('/user/:id', function(req, res) {
  if(users.length <= req.params.id || req.params.id < 0) {
    res.statusCode = 404;
    return res.send('Error 404: No user found');
  }

  var q = users[req.params.id];
  res.json(q);
});

app.post('/user', function(req, res) {
  if(!req.body.hasOwnProperty('firstName') || !req.body.hasOwnProperty('lastName')) {
    res.statusCode = 400;
    return res.send('Error 400: Post syntax incorrect.');
  }

  var newUser = {
    firstName : req.body.firstName,
    lastName : req.body.lastName,
    group : req.body.group
  };

  users.push(newUser);
  res.json(true);
});

app.delete('/user/:id', function(req, res) {
  if(users.length <= req.params.id) {
    res.statusCode = 404;
    return res.send('Error 404: No user found');
  }

  users.splice(req.params.id, 1);
  res.json(true);
});

app.listen(process.env.PORT || 8080);