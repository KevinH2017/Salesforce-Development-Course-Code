// While loops check the condition before executing the loop code block, will only execute if the condition is met

Integer year = 1100;

while (year <= 2000) {
    // Loop block to execute code
    if (Math.mod(year, 4) == 0              // Checks if evenly divisible by 4
        && Math.mod(year, 100) != 0         // Checks if evenly divisible by 100
        || Math.mod(year, 400) == 0) {      // Checks if evenly divisible by 400
            System.debug('Is ' + year + ' a leap year?: true');
        } else {
            System.debug('Is ' + year + ' a leap year?: false');
        }
    year++;
}
System.debug('Year after do-while loop: ' + year);