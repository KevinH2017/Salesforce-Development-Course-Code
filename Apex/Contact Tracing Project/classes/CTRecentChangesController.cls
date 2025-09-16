public with sharing class CTRecentChangesController {

    // Get list of recent changes for people
    @AuraEnabled
    public static List<Person__c> getRecentPersonHealthChanges() {
        return CTPersonController.getRecentHealthChanges();
    }

    // Get list of recent changes for locations
    @AuraEnabled
    public static List<Location__c> getRecentLocationHealthChanges() {
        return CTLocationController.getRecentStatusChanges();
    }

    // Search for people based on searchTerm
    @AuraEnabled
    public static List<Person__c> searchPeople(String searchTerm) {
        return CTPersonController.searchPeople(searchTerm);
    }

    // Search for locations based on searchTerm
    @AuraEnabled
    public static List<Location__c> searchLocation(String searchTerm) {
        return CTLocationController.searchLocations(searchTerm);
    }
}
