module.exports = function average(...args) {
    let total = args.reduce((t, n) => t + n, 0); 
    return total / args.length;
};
