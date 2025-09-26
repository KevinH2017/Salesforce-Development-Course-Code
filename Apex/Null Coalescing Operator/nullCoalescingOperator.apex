/*
Null Coalescing Operator

The null coalescing operator (??) returns its right-hand side operand when its left-hand side operand is null,
similar to the safe navigation operaotr (?.), ?? replaces verbose and explicit checks for null references in code

The null coalescing operator is a binary operator in the form a ?? b that returns a if a isn't null,
otherwise it returns b

The operator is left-associative, meaning that the left-hand operand is evaluated only one time, while the
right-hand operand is only evaluated if the left-hand operand is null

You must ensure type compatibility between the operands, for example, objectZ result = objectA ?? objectB
BOTH objectA and objectB must be instances of objectZ to avoid compile-time error

Example:
Integer notNullReturnValue = anInteger ?? 100;

While using null coalescing operators, always keep operator precedence in mind, using parantheses is necessary to obtain the desired result
For example:
top ?? 100 will evalute to top ?? (100 - bottom ?? 0) AND NOT (top ?? 100) - (bottom ?? 0)

The null coalescing operator can be used to deal with the case where a SOQL query doesn't return any rows

If a SOQL query is used as the left-hand operand of the operator and rows are returned, then the null coalescing operator returns the query results,
if no rows are returned, the null coalescing operator returns the right-hand operand\

Restrictions:
- You can't use the null coalescing operator as the left side of an assignment operator in assignment
- SOQL bind expressions don't support the null coalescing operator
*/

List<Opportunity> opps = [SELECT Id, Name, Description, Account.Website FROM Opportunity];

for (Opportunity opp : opps) {
    opp.Description = opp.Account.Website ?? 'Null coalescing demo';
}
update opps;

// The null coalescing operator can be chained together
// Example:
Contact contact = [SELECT Preffered_Phone__c, MobilePhone, HomePhone, WorkPhone
                    FROM Contact WHERE Id = :contactId];

String contactPhone = contact.Preffered_Phone__c 
                    ?? contact.MobilePhone 
                    ?? contact.HomePhone 
                    ?? contact.WorkPhone 
                    ?? 'No phone available';