// Differences between Database Methods and DML Statements

// Database Methods:
Database.SaveResult[] srList = Database.insert(accList, false);
// Partial control over record processing
// NO exception is thrown, instead a result array is returned

// DML Statements:
insert accList;
// NO partial record processing
// Results in exception