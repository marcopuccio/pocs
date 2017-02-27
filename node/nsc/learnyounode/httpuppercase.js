
var http = require('http');
var map = require('through2-map')  

// Console args.
var port = process.argv[2];


var server = http.createServer(function (request, response) {
  // Check if the request method is POST or not. 
  if (request.method != 'POST') {
    return response.end("The request isn't a POST");
  }
  //
  request.pipe(map(function (chunk) {  
   return chunk.toString().toUpperCase();  
 })).pipe(response);
}); 

server.listen(port);