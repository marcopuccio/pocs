
var http = require('http');
var bl = require('bl');

var urls = process.argv.slice(2);
var result = [];

urls.forEach(function(url, i) {
  http.get(url, function(response) {
    response.pipe(bl(function(err, data) { 
      if (err) return console.error(err);
      result[i] = data.toString();
      if (result.filter(function(res) { return res !== undefined; }).length === urls.length){
        console.log(result.join('\n')); 
      } 
    }));
  });
});