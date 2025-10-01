public with sharing class CaseTriggerHelper {

    // public static variables do not keep old values between methods
    public static List<Case> parentCasesToUpdate;

    public static void updateTotalResolutionDaysOnParentCases(Set<Id> parentCaseIdsToUpdate) {
        parentCasesToUpdate = new List<Case>();
        // Only execute if there are parent cases to update
        if (parentCaseIdsToUpdate.size() > 0) {
            parentCasesToUpdate = new List<Case>();
            // Queries sum of Resolution_Days__c for all child cases, grouped by Parent_Case__c
            AggregateResult[] casesWithResolutionDays = [
                SELECT Parent_Case__c,
                    SUM(Resolution_Days__c)totalDays 
                FROM Case 
                GROUP BY Parent_Case__c];

            // Loops through sum of all cases and add parent cases to the list
            for (AggregateResult ar : casesWithResolutionDays)  {
                Id parentId = (Id)ar.get('Parent_Case__c');
                Decimal totalDays = (Decimal)ar.get('totalDays');
                parentCasesToUpdate.add(new Case(Id=parentId,
                    Total_Resolution_Days__c=totalDays));
            }

            // Updates parent cases if there are any
            if (parentCasesToUpdate.size() > 0) {
                update parentCasesToUpdate;
            }
        }
    }
    public static void updateTotalResolutionDaysOnParentCasesUsingInnerQuery(Set<Id> parentCaseIdsToUpdate) {
        parentCasesToUpdate = new List<Case>();

        // Inner query to get Resolution_Days__c for all child cases
        // Outer query to get parent cases
        List<Case> allCases = [
            SELECT Id, Total_Resolution_Days__c, 
                (SELECT Id, Resolution_Days__c 
                FROM Cases__r) 
            FROM Case
            WHERE Id = :parentCaseIdsToUpdate];

        // Loops through parent cases and child cases to calculate total days
        for (Case parentCase : allCases) {
            Decimal totalDays = 0;

            for (Case childCase : parentCase.Cases__r) {
                totalDays += childCase.Resolution_Days__c;
            }
            // Adds parent case to the list
            parentCasesToUpdate.add(new Case(
                Id=parentCase.Id,
                Total_Resolution_Days__c=totalDays));
        }
        // Updates parent cases if there are any
        if (parentCasesToUpdate.size() > 0) {
            update parentCasesToUpdate;
        }
    }
}