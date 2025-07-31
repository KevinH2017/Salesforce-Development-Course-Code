// while-loop challenge
// Print the first 20 Fibonacci numbers

Integer current;
Integer previous = 1;
Integer beforePrevious = 0;

// 1st number; 0
System.debug(beforePrevious);
// 2nd number; 1
System.debug(previous);

// Print next 18 numbers
Integer i = 0;
while (i < 18) {
    current = previous + beforePrevious;
    System.debug(current);
    
    // Update beforePrevious with previous
    beforePrevious = previous;
    // Update previous with current
    previous = current;

    // Increment i
    i++;
}
