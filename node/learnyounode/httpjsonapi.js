var http = require('http');
var url = require('url');
var port = process.argv[2]

//Set Server
var server = http.createServer(function (request, response) {
  var urlObject = url.parse(request.url, true)
  var path = urlObject.pathname
  var time = urlObject.query.iso 
  var parsedTime;

  if (path === '/api/unixtime') {
    parsedTime = getUnixTimestamp(time);
  }
  else if (path === '/api/parsetime') {
    parsedTime = getTimeAPI(time);
  }
  // Response
  if (parsedTime) {
    response.writeHead(200, { 'Content-Type': 'application/json' });
    response.end(JSON.stringify(parsedTime));
  }
  else {
    response.writeHead(404);
    response.end();
  }
});
server.listen(port);


function parseTimestamp(time) {
  // Generic function to parse Date Objs. 
  return Date.parse(time);
}

function getUnixTimestamp(time) {
  // Return JSON with timestamp
  return {
    unixtime: parseTimestamp(time)
  };  
}

function getTimeAPI(time) {
  var date = new Date(parseTimestamp(time));
  // return parsed JSON
  return {
    hour: date.getHours(),
    minute: date.getMinutes(),
    second: date.getSeconds()
  };
}