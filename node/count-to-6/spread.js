var numbers = process.argv.slice(2);;
var max = Math.min(...numbers);

console.log(`The minimum of [${numbers}] is ${max}`);