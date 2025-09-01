List<Id> accountIds = new List<Id>();

// Adds all account Ids to the list
for (Account acc: [SELECT Id FROM Account]) {
    accountIds.add(acc.Id);
}

// Updates average case resolution days for each account Id
AccountController.updateAvgCaseResolutionDays(accountIds);