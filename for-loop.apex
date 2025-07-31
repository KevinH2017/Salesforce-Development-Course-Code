// for loops have the variable initialized, check condition, and increment inside the parantheses

Integer year;
for (year = 1100; year <= 2000; year++) {
    // Loop block to execute code
    if (Math.mod(year, 4) == 0              // Checks if evenly divisible by 4
        && Math.mod(year, 100) != 0         // Checks if evenly divisible by 100
        || Math.mod(year, 400) == 0) {      // Checks if evenly divisible by 400
            System.debug('Is ' + year + ' a leap year?: true');
        } else {
            System.debug('Is ' + year + ' a leap year?: false');
        }
}
System.debug('Year after do-while loop: ' + year);