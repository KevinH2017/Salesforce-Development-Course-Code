public class AccountController {
    // Inserts list of accounts
    public static List<Account> insertAccounts(List<Account> accountToInsert) {
        insert accountToInsert;
        return accountToInsert;
    }

    // Inserts a single account
    public static Account insertAccount(Account accountToInsert) {
        insert accountToInsert;
        return accountToInsert;
    }

    // Retrieves all accounts
    public static List<Account> getAllAccounts() {
        List<Account> accounts = [SELECT Id, Name, Phone FROM Account];
        return accounts;
    }

    // Prints all accounts
    public static void printAllAccounts() {
        List<Account> accounts = getAllAccounts();
        for (Account account : accounts) {
            System.debug('Name: ' + account.Name + ', Phone: ' + account.Phone);
        }
    }

    // Gets the size of all accounts
    public static Integer getAccountSize() {
        List<Account> accounts = getAllAccounts();
        return accounts.size();
    }
}