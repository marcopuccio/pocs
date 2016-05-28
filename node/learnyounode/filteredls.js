var fs = require('fs');
var path = require('path');

function filteredLS(arrayOfArgs){
  fs.readdir(arrayOfArgs[2], function(err, files) {
    if (err) throw err;
    var filteredFiles = files.filter(function(file) {
      var fileExt = path.extname(file).replace('.','');
      if (fileExt === arrayOfArgs[3]) {
        console.log(file);
      }
    });
  });
}

filteredLS(process.argv);

