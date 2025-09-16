public with sharing class CTHealthHeaderController {
    
    @AuraEnabled
    public static Map<String, Integer> getPersonHealthStatuscount() {
        // Get the health status count for the person object
        return CTPersonController.getHealthStatusCount();
    }

    @AuraEnabled
    public static Map<String, Integer> getLocationHealthStatuscount() {
        // Get the health status count for the location object
        return CTLocationController.getHealthStatusCount();
    }
}
