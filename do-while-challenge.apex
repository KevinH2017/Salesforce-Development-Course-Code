// do-while challenge
// Fizzbuzz problem

Integer num = 0;

do {
    if (Math.mod(num, 3) == 0 && Math.mod(num, 5) == 0) {
        System.debug('fizzbuzz');
    } else if (Math.mod(num, 3) == 0) {
        System.debug('fizz');
    } else if (Math.mod(num, 5) == 0) {
        System.debug('buzz');
    } else {
        System.debug(num);
    }
    num++;
} while (num <= 100);