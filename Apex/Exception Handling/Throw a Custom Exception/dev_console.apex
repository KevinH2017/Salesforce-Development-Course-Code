System.debug('Before Exception');
try {
    // Throws custom exception from ProcessException.cls
    throw new ProcessException('My Custom Exception');
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