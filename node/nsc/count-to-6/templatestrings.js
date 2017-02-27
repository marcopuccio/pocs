const argString = process.argv[2];

let tplString = `Hello, ${argString}!
Your name lowercased is "${argString.toLowerCase()}".`;

console.log(tplString);