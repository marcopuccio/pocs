var net = require('net');  
var strftime = require('strftime');

var port = process.argv[2];

var server = net.createServer(function (socket) {  
  var date = new Date();
  var dateFormat = '%F %H:%M';
  socket.write(strftime(dateFormat, date) + '\n');
  socket.end();
})

server.listen(port)  
