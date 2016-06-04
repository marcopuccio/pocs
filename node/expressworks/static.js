// Dependencies
var express = require('express');
var path = require('path');

// Args
var port = process.argv[2];
var public = process.argv[3];

// App 
var app = express();
app.use(express.static(public || path.join(__dirname, 'templates')));
app.listen(port);
