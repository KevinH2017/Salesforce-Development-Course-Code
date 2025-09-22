/*
Assert class has additional methods to make testing clearer and intentional assertions

As well as, the assertion results in an exceptionm, easier to read and understand

Assert statements are used to check for expected results, they output boolean values

Documentation:
https://salesforcecommercecloud.github.io/b2c-dev-doc/docs/upcoming/scriptapi/html/index.html?target=class_dw_util_Assert.html
*/

// Checks for equals
Assert.areEqual('Expected One', 'Got Two', 'This assert failed');               // Fail
Assert.areNotEqual('Expected One', 'Got Two', 'This assert succeeded');         // Success

// Checks for boolean (true or false)
Assert.isTrue(1 == 2);                  // Fail
Assert.isFalse(1 == 2);                 // Success

// Checks for null or not null
Assert.isNull(null);                    // Sucess
Assert.isNotNull(null);                 // Fail

// Check for instance/object type (if acc is an instance of the Account class)
Account acc = new Account();
Assert.isInstanceOfType(acc, Account.class);        // Success
Assert.isNotInstanceOfType(acc, Account.class);     // Fail
