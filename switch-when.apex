// switch-when is used to check one expression for multiple values and execute the appropriate block of code

Integer hour = 12;

// Checks if multiple values match and executes blocks of code
switch on hour {
    when 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 {
        System.debug('Good Morning!');
    }
    when 12, 13, 14, 15, 16 {
        System.debug('Good Afternoon!');
    }
    // When none of the above conditions are true, the else-block executes
    when else {
        System.debug('Good Night!');
    }
}