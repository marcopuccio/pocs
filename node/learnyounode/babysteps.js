var total = 0;

for (i=0; i < process.argv.length - 2; i++) {
  total += Number(process.argv[i + 2]);
}

console.log(total);