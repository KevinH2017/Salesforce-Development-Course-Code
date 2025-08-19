// Creates a List of contacts with relationships to Cases and Account tables
// SOQL query with Parent-to-Child and Child-to-Parent relationships
List<Contact> contacts = [
    SELECT Account.Name, Account.Rating, 
    Name, Department, Title, 
    (Select CaseNumber, Subject FROM Cases) 
    FROM Contact 
    ORDER BY Name];

// for-loop to get Contacts departments, titles, and Account names and ratings related to them
for (Contact contact : contacts) {
    System.debug('Contact Name: ' + contact.Name +
                ', Contact Department: ' + contact.Department +
                ', Contact Title: ' + contact.Title +
                ', Account Name: ' + contact.Account.Name +
                ', Account Rating: ' + contact.Account.Rating);

    // for-loop to get Cases numbers and subjects related to the Contact
    for (Case contactCase : contact.Cases) {
        System.debug('Case Number: ' + contactCase.CaseNumber +
                    ', Case Subject: ' + contactCase.Subject);
    }
}