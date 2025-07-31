// Challenge
// A leap year has 366 days, check if a year is a leap year.
// A year is a leap year if it is evenly divisible by 4
// Except, if that year is also evenly divisible by 100
// Unless, the year is also evenly divisible by 400

// Integer year = 2200;     // Output false
Integer year = 2000;        // Output true
Boolean isLeapYear;

// // Nested if-else statements
// // Checks if year is evenly divisible by 4
// if (Math.mod(year, 4) == 0) {
//     // Checks if year is evenly divisible by 100
//     if (Math.mod(year, 100) == 0) {
//         // Checks if year is evenly divisible by 400
//         if (Math.mod(year, 400) == 0) {
//             isLeapYear = true;
//         } else {
//             isLeapYear = false;
//         }
//     } else {
//         isLeapYear = true;
//     }
// } else {
//     isLeapYear = false;
// }

// Multiple if statements can be chained together in one block
if (Math.mod(year, 4) == 0              // Checks if evenly divisible by 4
    && Math.mod(year, 100) != 0         // Checks if evenly divisible by 100
    || Math.mod(year, 400) == 0) {      // Checks if evenly divisible by 400
    isLeapYear = true;
} else {
    isLeapYear = false;
}

System.debug('Is ' + year + ' a leap year?: ' + isLeapYear);