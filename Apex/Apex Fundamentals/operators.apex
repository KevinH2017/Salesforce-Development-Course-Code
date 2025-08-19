// Assignment operator
Integer x = 5;
System.debug('Assignment operator: ' + x);

// Addition operator
x = x + 5;
System.debug('Addition operator: ' + x);

// Subtraction operator
x = x - 5;
System.debug('Subtraction operator: ' + x);

// Multiplication operator
x = x * 5;
System.debug('Multiplication operator: ' + x);

// Division operator
x = x / 5;
System.debug('Division operator: ' + x);

// Increment operator
x++;        // Same as x = x + 1;
System.debug('Increment operator: ' + x);

// Decrement operator
x--;        // Same as x = x - 1;
System.debug('Decrement operator: ' + x);

// Addition assignment operator
x += 5;     // Same as x = x + 5;
System.debug('Addition assignment operator: ' + x);

// Subtraction assignment operator
x -= 5;     // Same as x = x - 5;
System.debug('Subtraction assignment operator: ' + x);

// Multiplication assignment operator
x *= 5;     // Same as x = x * 5;
System.debug('Multiplication assignment operator: ' + x);

// Division assignment operator
x /= 5;     // Same as x = x / 5;
System.debug('Division assignment operator: ' + x);

// Using addition operator on strings
String str1 = 'Hello';
String str2 = 'World';
System.debug('Using addition operator on strings: ' + str1 + str2);     // HelloWorld
System.debug(str1 + ' ' + str2);    // Hello World

Boolean first = true;
Boolean second = false;
Boolean result;

// AND operator
result = first && second;       // If both first and second are true, then result is true, else it is false
System.debug('AND operator: ' + result);    // Outputs false 

// OR operator
result = first || second;       // If both first and second are false, then result is false, else it is true
System.debug('OR operator: ' + result);     // Outputs true

// Equality operator
result = (first == second);     // If both expressions have the same value, then result is true, else it is false
System.debug('Equality operator Boolean: ' + result);   // Outputs false

result = (5 == 5);
System.debug('Equality operator Integer: ' + result);   // Outputs true

result = ('Hello' == 'World');
System.debug('Equality operator String: ' + result);   // Outputs false

// Less Than operator
result = (5 < 6);
System.debug('Less than operator: ' + result);   // Outputs true

// Greater Than operator
result = (5 > 4);
System.debug('Greater than operator: ' + result);   // Outputs true

// Less Than or Equal To operator
result = (5 <= 6);
System.debug('Less than or equal to operator: ' + result);   // Outputs true
result = (6 <= 6);
System.debug('Less than or equal to operator 2: ' + result);   // Outputs true

// Greater Than or Equal To operator
result = (5 >= 6);
System.debug('Greater than or equal to operator: ' + result);   // Outputs false
result = (6 >= 6);
System.debug('Greater than or equal to operator 2: ' + result);   // Outputs true

// NOT operator
System.debug('NOT operator before: ' + first);    // Outputs true
first = !first;
System.debug('NOT operator after: ' + first);     // Outputs false

// Ternary operator
String greeting = '';
Integer hour = 10;
// If hour is less than 12, then greeting prints 'Good Morning', else 'Good Afternoon'
greeting = (hour < 12) ? 'Good Morning' : 'Good Afternoon';
System.debug('Ternary operator, hour=10: ' + greeting);

hour = 13;
greeting = (hour < 12) ? 'Good Morning' : 'Good Afternoon';
System.debug('Ternary operator, hour=13: ' + greeting);
