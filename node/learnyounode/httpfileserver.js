var http = require('http');
var fs = require('fs');

// Console args.
var port = process.argv[2];
var file = process.argv[3];

var server = http.createServer(function (request, response) {
  // Set response header
  response.writeHead(200, { 'content-type' : 'text/plain' });
  // The stream given via console args will be piped to response.
  fs.createReadStream(file).pipe(response);
}); 

server.listen(port);
  
