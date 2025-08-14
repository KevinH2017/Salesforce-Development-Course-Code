// Code to be executed in Dev Console, in Anonymous Window

// Retrieves all accounts and puts it into a List
List<Account> accounts = [SELECT Name, Phone FROM Account];

// Iterates over all accounts and prints account information
for (Account account : accounts) {
    System.debug('Account Name: ' + account.Name + ' Account Phone: ' + account.Phone);
}

// Gets SOQL results and puts it into a Map
Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Name, Phone FROM Account]);
for (Account account : accountsMap.values()) {
    System.debug('Account Name: ' + account.Name + ' Account Phone: ' + account.Phone);
}

// Retrieves all books and assigns it to a List
List<Book__c> books = [SELECT Name, Price__c FROM Book__c];
for (Book__c book : books) {
    System.debug('Book Name: ' + book.Name + ' Book Price: ' + book.Price__c);
}
