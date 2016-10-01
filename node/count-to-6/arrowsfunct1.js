var inputs = process.argv.slice(2);

// The map returns a array with the first char of the string. 
// The reduce takes each element of the array and concatenate it.
var result = inputs.map( x => x[0]).reduce((x, y) => x + y);


console.log(`[${inputs}] becomes "${result}"`);