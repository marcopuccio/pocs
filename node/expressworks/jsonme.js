// Dependencies
var express = require('express');
var fs = require('fs');

// Args
var port = process.argv[2];
var file = process.argv[3]

// App 
var app = express();

app.get('/books', function (request, response) {
  fs.readFile(file, function(err, data){
    if (err) throw err
    response.send(JSON.parse(data));
  });
});

app.listen(port || 8080);