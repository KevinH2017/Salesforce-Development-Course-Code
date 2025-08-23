// Exception methods can get more specific information about the exception

System.debug('Before Exception');
try {
    // Math Exception
    Double result = 10 / 0;
    System.debug('Result: ' + result);

    // DML Exception
    Account account = new Account();
    insert account;

    System.debug('Empty Try Block');

} catch (Exception e) {
    // Exception methods
    System.debug('Cause: ' + e.getCause());
    System.debug('Message: ' + e.getMessage());
    System.debug('Line Number: ' + e.getLineNumber());
    System.debug('Stack Trace: ' + e.getStackTraceString());
    System.debug('Exception caught: ' + e.getMessage());
} finally {
    System.debug('Finally block executed');
}
System.debug('After Exception');