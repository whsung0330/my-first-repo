const factorial = n => {
    var result = 1;
    for (let i = n; i > 0; i--){
        result = result*i;
    }
    return result;
};

const permutation = (n,r) => {
    var numerator = factorial(n);
    var denominator = factorial(n-r);
    return numerator/denominator;    
};

const combination = (n,r) => {
    var numerator = factorial(n);
    var denominator = factorial(n-r) * factorial(r);
    return numerator/denominator; 
};

const multiPermutation = (n,r) => n**r;

const multiCombination = (n,r) => {
    combination(n+r-1, r);
};

module.exports = {
    permutation: permutation,
    combination: combination,
    multiPermutation: multiPermutation,
    multiCombination: multiCombination
};