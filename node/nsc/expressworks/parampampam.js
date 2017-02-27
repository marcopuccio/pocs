// Dependencies
var express = require('express');
var crypto = require('crypto');

// Args
var port = process.argv[2];

// App 
var app = express();
// App settings
app.put('/message/:id', function(request, response){
  var id = request.params.id;
  var currDate = new Date().toDateString()
  var hash = crypto.createHash('sha1').update(currDate + id).digest('hex');
  response.send(hash);
});

app.listen(port || 8080);
