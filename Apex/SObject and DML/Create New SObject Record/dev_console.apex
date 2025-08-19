// Create a new account instance using SObject
SObject accountRec = (SObject)Type.forName('Account').newInstance();
// Sets field values
accountRec.put('Name', 'New SObject Account');
accountRec.put('Phone', '123-456-7890');
accountRec.put('Industry', 'Technology');

// Insert the new account record
insert accountRec;