public class AccountController {

    public static void updateAvgCaseResolutionDays(List<Id> accountIds){
        // Maps for account total cases and total days
        Map <Id, Integer> accountTotalCaseMap = new Map <Id, Integer>();
        Map <Id, Integer> accountTotalCaseDaysMap = new Map <Id, Integer>();

        // Retrive all the cases for this account
        // Get resolution days for each account (ClosedDate - CreatedDate)
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate, AccountId
                             FROM Case
                             WHERE IsClosed=true
                            	AND AccountId IN :accountIds]){
                               
            // If map does not have current account Id, then add it
            if (!accountTotalCaseMap.containsKey(caseObj.AccountId)) {
            	accountTotalCaseMap.put(caseObj.AccountId, 0);
                accountTotalCaseDaysMap.put(caseObj.AccountId, 0);
            }
                                    
            Integer totalCases = accountTotalCaseMap.get(caseObj.AccountId);                  
            // Goes to next case
            totalCases++;
            // Maps total cases to the caseObj AccountId
            accountTotalCaseMap.put(caseObj.AccountId, totalCases);
                                    
            // Get duration in days and add it to totalDays                                    
            Integer totalDays = accountTotalCaseDaysMap.get(caseObj.AccountId);
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
            // Maps total days to the CaseObj AccountId
			accountTotalCaseDaysMap.put(caseObj.AccountId, totalDays);
        }
        
        // List of accounts to update
        List<Account> accountsToUpdate = new List<Account>();
        // Iterates through all accounts by accountId value
        for (Id accountId: accountTotalCaseMap.keySet()) {
            // Gets average days by dividing total case days and total cases from the accountId
        	Decimal resolutionDays = accountTotalCaseDaysMap.get(accountId)/accountTotalCaseMap.get(accountId);
            // Updates accountId and Avg_Case_Resolution_Days__c values
        	accountsToUpdate.add(new Account(Id=accountId, Avg_Case_Resolution_Days__c=resolutionDays));
        }
        
		// Updates account object
        update accountsToUpdate;
    }
}
