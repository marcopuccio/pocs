// Dependencies
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');

// Args
var port = process.argv[2];

// App 
var app = express();
// App settings
app.use(bodyParser.urlencoded({extended: false}))

// URL
app.post('/form', function(request, response){
  response.send(request.body.str.split('').reverse().join(''));
});

app.listen(port || 8080);
