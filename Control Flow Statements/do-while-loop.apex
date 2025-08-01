// do-while loops will ALWAYS execute at least once

// A year is a leap year if it is evenly divisible by 4
// Except, if that year is also evenly divisible by 100
// Unless, the year is also evenly divisible by 400

Integer year = 1100;

do {
    // Loop block to execute code
    if (Math.mod(year, 4) == 0              // Checks if evenly divisible by 4
        && Math.mod(year, 100) != 0         // Checks if evenly divisible by 100
        || Math.mod(year, 400) == 0) {      // Checks if evenly divisible by 400
            System.debug('Is ' + year + ' a leap year?: true');
        } else {
            System.debug('Is ' + year + ' a leap year?: false');
        }
    year++;     // Increment through years
} while (year <= 2000);     // Checks condition after loop block

System.debug('Year after do-while loop: ' + year);