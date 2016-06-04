// Dependencies
var express = require('express');
// Args
var port = process.argv[2];
// App 
var app = express();

app.get('/search', function (request, response) {
  /*
   There isn't necessary to parse to JSON because
   `request.query` is already a JSON object. 
  */
  response.send(request.query);
});

app.listen(port || 8080);