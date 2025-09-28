// Queries can now go up to 5 levels from parent to child query

// Level 1: SELECT Name FROM ACCOUNT
// Level 2: SELECT LastName FROM Contact
// Level 3: SELECT Subject FROM Case
// Level 4: SELECT CommentBody FROM CaseComments
List<Account> accs = [
    SELECT Name, 
        (
        SELECT LastName, 
            (
            SELECT Subject,
                (
                SELECT CommentBody 
                FROM CaseComments
                )
            FROM Cases
            )
        FROM Contacts
        ) 
    FROM Account
];

System.debug('Accounts: ' + accs);