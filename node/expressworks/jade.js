// Dependencies
var express = require('express');
var path = require('path');

// Args
var port = process.argv[2];
var template = process.argv[3];

// App 
var app = express();
// App settings
app.set('views', template || path.join(__dirname, 'templates'));
app.set('view engine', 'jade');

// URL
app.get('/home', function(request, response){
  var tplData = {
    'date': new Date().toDateString()
  } 
  response.render('index', tplData);
});

app.listen(port || 8080);
