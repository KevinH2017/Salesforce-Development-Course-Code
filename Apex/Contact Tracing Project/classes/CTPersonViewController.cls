public with sharing class CTPersonViewController {

    /**
     * Update person's health status
     * @param recordId
     * @return UserInformation
     */
    @AuraEnabled
    public static void updateHealthStatus(String personId){
        Person__c person = new Person__c(Id=personId);
        person.Health_Status__c = 'Red';
        update person;
    }
}
