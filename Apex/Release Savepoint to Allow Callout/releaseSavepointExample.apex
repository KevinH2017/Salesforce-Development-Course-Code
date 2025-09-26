/*
Make Callouts After Rolling Back DML and Releasing Savepoints

You can roll back all uncommitted DML by using a savepoint by using the Database.releaseSavepoint method to explicitly release
savepoints before making a desired callout

Before, callouts after creating savepoints resulted in a CalloutException regardless of whether there was uncommitted DML
or the changes were rolled back to a savepoint

When Database.releaseSavepoint() is called, SAVEPOINT_RELEASE is logged if savepoints are found and released
*/

// Example:
Savepoint sp = Database.setSavepoint();
try {
    // Try a database operation
    insert new Account(name='Foo');
    integer bang = 1 / 0;       // This line will throw an exception

} catch (Exception ex) {
    // If exception occurs, rollback database changes
    Database.rollback(sp);
    
    // Also releases any savepoints created after 'sp' savepoint
    Database.releaseSavepoint(sp);

    // Callout is allowed because uncommitted work is rolled back and savepoints are released
    makeACallout(); 
}

// Example with unreleased savepoint:
Savepoint sp = Database.setSavepoint();
try {
    // Try to make callout
    makeACallout(); 

} catch (System.CalloutException ex) {
    // Exception occurs, the savepoint wasn't released
    Assert.isTrue(ex.getMessage().contains('All active Savepoints must be released before making callouts.'));
}

// Example with pending DML when the callout is made:
Savepoint sp = Database.setSavepoint();
// Changes to the database
insert new Account(name='Foo');
// Releases savepoint
Database.releaseSavepoint(sp);

try {
    // Try to make callout
    makeACallout(); 

} catch (System.CalloutException ex) {
    // Exception occurs, the above insert statement was not committed to the database
    Assert.isTrue(ex.getMessage().contains('You have uncommitted work pending. Please commit or rollback before calling out.'));
}
