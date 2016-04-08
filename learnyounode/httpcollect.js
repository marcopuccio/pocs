var http = require('http');
var bl = require('bl');
var url = process.argv[2];

http.get(url, function(response) {
  response.pipe(bl(function(err, data) {
    if (err) throw err;
    //prints the length of Stream
    console.log(data.length);
    console.log(data.toString());
  }));
  response.on('error', function(data) {
    console.error(error);
  });
});