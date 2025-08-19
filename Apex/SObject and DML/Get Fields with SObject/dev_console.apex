// Retrieves all accounts and assigns it to a list
List<SObject> accounts = [SELECT Id, Name FROM Account];
// SObject is a generic representation of any Salesforce object
for (SObject account : accounts) {
    System.debug('Account Id: ' + account.get('Id'));
    System.debug('Account Name: ' + account.get('Name'));
}