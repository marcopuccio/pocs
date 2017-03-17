// Dependencies
var path = require('path');
var express = require('express');

// Args
var port = process.argv[2];
var template = process.argv[3];

// App 
var app = express();
// App settings
app.use(require('stylus').middleware(template ||'templates'));
app.use(express.static(template || path.join(__dirname, 'templates')));

app.listen(port || 8080);
