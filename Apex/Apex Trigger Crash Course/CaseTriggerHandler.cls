public with sharing class CaseTriggerHandler {

    // public static variables do not keep old values between methods
    public static Set<Id> parentCaseIdToUpdate;

    public static void afterInsertHandler(List<Case> cases) {
        parentCaseIdToUpdate = new List<Case>();
        for (Case case : cases) {
            // Update Resolution_Days__c if it exists
            if (case.Resolution_Days__c != null) {
                parentCaseIdToUpdate.add(case.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdToUpdate);
    }    

    public static void afterUpdateHandler(List<Case> cases, Map<Id, Case> oldCasesMap) {
        for (Case case : cases) {
            Case oldCase = oldCasesMap.get(case.Id);
            // Update Resolution_Days__c if it has changed from previous value
            if (case.Resolution_Days__c != null && case.Resolution_Days__c != oldCase) {
                parentCaseIdToUpdate.add(case.Parent_Case__c);
            }

            // Adds the old case to the set if the parent case has changed
            if (case.Parent_Case__c != oldCase.Parent_Case__c) {
                parentCaseIdToUpdate.add(case.Parent_Case__c);
                parentCaseIdToUpdate.add(oldCase.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdToUpdate);
    }    

    public static void afterDeleteHandler(List<Case> cases) {
        for (Case case : cases) {
            if (case.Resolution_Days__c != null) {
                parentCaseIdToUpdate.add(case.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdToUpdate);
    }    

    public static void afterUndeleteHandler(List<Case> cases) {
        for (Case case : cases) {
            if (case.Resolution_Days__c != null) {
                parentCaseIdToUpdate.add(case.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdToUpdate);
    }
}