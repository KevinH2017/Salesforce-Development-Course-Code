public with sharing class CaseTriggerHandler {

    // public static variables do not keep old values between methods
    public static Set<Id> parentCaseIdsToUpdate;
    
    public static void afterInsertHandler(List<Case> cases) {
        parentCaseIdsToUpdate = new Set<Id>();
        for (Case c : cases) {
            // Update Resolution_Days__c if it exists
            if (c.Resolution_Days__c != null) {
                parentCaseIdsToUpdate.add(c.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
    }    

    public static void afterUpdateHandler(List<Case> cases, Map<Id, Case> oldCasesMap) {
        for (Case c : cases) {
            Case oldCase = oldCasesMap.get(c.Id);
            // Update Resolution_Days__c if it has changed from previous value
            if (c.Resolution_Days__c != oldCase.Resolution_Days__c) {
                if (c.Resolution_Days__c != null) {
                	parentCaseIdsToUpdate.add(c.Parent_Case__c);
                }
            }

            // Adds the old case to the set if the parent case has changed
            if (c.Parent_Case__c != oldCase.Parent_Case__c) {
                parentCaseIdsToUpdate.add(c.Parent_Case__c);
                parentCaseIdsToUpdate.add(oldCase.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
    }    

    public static void afterDeleteHandler(List<Case> cases) {
        for (Case c : cases) {
            if (c.Resolution_Days__c != null) {
                parentCaseIdsToUpdate.add(c.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
    }    

    public static void afterUndeleteHandler(List<Case> cases) {
        for (Case c : cases) {
            if (c.Resolution_Days__c != null) {
                parentCaseIdsToUpdate.add(c.Parent_Case__c);
            }
        }
        CaseTriggerHelper.updateTotalResolutionDaysOnParentCases(parentCaseIdsToUpdate);
    }
}