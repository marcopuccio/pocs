var express = require('express');
var app = express();
var port = process.argv[2];


app.get('/home', function(request, response){
  response.end("Hello World!");
});
app.listen(port);
