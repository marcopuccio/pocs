var http = require('http');
var url = process.argv[2];

/* 
The http.get() method takes 2 args. The first one is the url to get,
and the second one is a callback that has a different signature 
unlike other callbacks(callback(err, data){ ... }): 
  callback(response){ ... }; 
*/
http.get(url, function(response) {
  response.setEncoding('utf-8')
  response.on('data', function(data) {
    console.log(data);
  });
  response.on('error', function(data) {
    console.error(error);
  });
});