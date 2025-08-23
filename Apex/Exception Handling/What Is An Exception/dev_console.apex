// Exceptions are used to note errors and other events that disrupt the normal flow of code execution
// Exception Examples:

// System.MathException: Divide by 0
Double result = 10/0;
System.debug('Result: ' + result);

/*
System.DmlException: Insert failed. 
First exception on row 0; 
first error: REQUIRED_FIELD_MISSING, 
Required fields are missing: [Name]: [Name]
*/
Account accRec = new Account();
insert accRec;

// System.NullPointerException: Attempt to de-reference a null object
String str;
System.debug(str.toLowerCase());

// Throw an exception using a program
// System.NullPointerException: Script-thrown exception
throw new NullPointerException();