// Handling an Exception
// The try, catch, and finally statements can be used to recover from a thrown exception

// Example:
System.debug('Before Exception');
try {
    // Code that may throw an exception
    Double result = 10 / 0;
    System.debug('Result: ' + result);

    // DML Exception
    Account account = new Account();
    insert account;
    
    System.debug('Empty Try Block');

} catch (Exception e) {
    // Code to handle the exception
    System.debug('Exception caught: ' + e.getMessage());
} finally {
    // Code that will always execute
    System.debug('Finally block executed');
}
System.debug('After Exception');

// Catch block only executes if the exception is thrown IN the try block and matches its exception type
// Finally block will always execute regardless if an exception is thrown or not

// Exception e, will catch any type of exception being thrown