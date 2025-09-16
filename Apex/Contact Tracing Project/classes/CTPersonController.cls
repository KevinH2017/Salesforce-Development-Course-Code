public with sharing class CTPersonController {

    /**
     * Generate unique token for a person
     * @param mobileNo
     * @return String
     */
    public static String getToken(String mobileNo) {
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        // Return hash as base64 encoded string
        return EncodingUtil.base64Encode(hash);
    }

    /**
     * Queries for last 100 health changes in descending order, nulls last
     * @return List<Person__c>
     */
    public static List<Person__c> getRecentHealthChanges() {
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c 
                ORDER BY Status_Update_Date__c DESC NULLS LAST 
                LIMIT 100];
    }

    /**
     * Search a person by name, mobile or token in descending order, nulls last
     * @param searchTerm
     * @return List<Person__c>
     */
    public static List<Person__c> searchPeople(String searchTerm) {
        searchTerm = searchTerm + '%';
        return [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
            FROM Person__c 
            WHERE Name LIKE :searchTerm 
                OR Mobile__c LIKE :searchTerm 
                OR Token__c LIKE :searchTerm 
            ORDER BY Status_Update_Date__c DESC NULLS LAST];
    }

    /**
     * Get a person by Id
     * @param personId
     * @return Person__c
     */
    public static Person__c getPersonById(String personId) {
        List<Person__c> people = [SELECT Id, Name, Health_Status__c, Mobile__c, Status_Update_Date__c, Token__c 
                FROM Person__c 
                WHERE Id =:personId];

        // Return people if found, else return null
        if(people != null && people.size() > 0){
            return people[0];
        }
        return null;
    }

    /**
     * Get all cohabitants for a person for the last 10 days
     * @param personId
     * @return Set<Id>
     */
    public static Set<Id> getCohabitants(Set<Id> personIds, Set<Id> alreadyProcessed) {
        // Creates a list of Green and Yellow health statuses
        List<String> healthStatuses = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                    WHERE (Person_1__c IN :personIds 
                                                        OR Person_2__c IN :personIds) 
                                                        AND Contact_Type__c = 'Cohabitant'
                                                        AND (Person_1__r.Health_Status__c IN :healthStatuses 
                                                            OR Person_2__r.Health_Status__c IN : healthStatuses)];

        Set<Id> cohabitants = new Set<Id>();
        // Iterate through the list of people traces and add the person ids to the set of cohabitants
        // if they are not already processed
        for (People_Tracing__c pt : peopleTraces){
            if (!alreadyProcessed.contains(pt.Person_1__c)) {
                cohabitants.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if (!personIds.contains(pt.Person_2__c)) {
                cohabitants.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }
        return cohabitants;
    }

    /**
     * Get all neighbours for a person for the last 10 days
     * @param personId
     * @return Set<Id>
     */
    public static Set<Id> getNeighbours(Set<Id> personIds, Set<Id> alreadyProcessed) {
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                    WHERE (Person_1__c IN :personIds 
                                                        OR Person_2__c IN :personIds) 
                                                        AND Contact_Type__c = 'Neighbour'
                                                        AND (Person_1__r.Health_Status__c = 'Green' 
                                                            OR Person_2__r.Health_Status__c = 'Green')];

        Set<Id> neighbours = new Set<Id>();
        // Iterate through the list of people traces and add the person ids to the set of neighbours
        // if they are not already processed
        for (People_Tracing__c pt : peopleTraces){
            if (!alreadyProcessed.contains(pt.Person_1__c)) {
                neighbours.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if (!alreadyProcessed.contains(pt.Person_2__c)) {
                neighbours.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }
        return neighbours;
    }

    /**
     * Get all primary contacts for a person for the last 10 days
     * @param personId
     * @return Set<Id>
     */
    public static Set<Id> getPrimaryContacts(Set<Id> personIds, Set<Id> alreadyProcessed) {
        // Creates a list of Green and Yellow health statuses
        List<String> healthStatuses = new List<String>{'Green', 'Yellow'};
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                    WHERE (Person_1__c IN :personIds   
                                                        OR Person_2__c IN :personIds) 
                                                        AND Contact_Type__c = 'Other'
                                                        AND Contact_Date__c = LAST_N_DAYS:10
                                                        AND (Person_1__r.Health_Status__c IN :healthStatuses 
                                                            OR Person_2__r.Health_Status__c IN :healthStatuses)];

        Set<Id> primaryContacts = new Set<Id>();
        // Iterate through the list of people traces and add the person ids to the set of primary contacts
        // if they are not already processed
        for (People_Tracing__c pt : peopleTraces){
            if (!alreadyProcessed.contains(pt.Person_1__c)) {
                primaryContacts.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if (!alreadyProcessed.contains(pt.Person_2__c)) {
                primaryContacts.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }
        return primaryContacts;
    }

    /**
     * Get all secondary contacts for a person for the last 10 days
     * @param personId
     * @return Set<Id>
     */
    public static Set<Id> getSecondaryContacts(Set<Id> primaryContactsIds, Set<Id> alreadyProcessed) {
        List<People_Tracing__c> peopleTraces = [SELECT Id, Person_1__c, Person_2__c FROM People_Tracing__c 
                                                    WHERE (Person_1__c IN :primaryContactsIds 
                                                        OR Person_2__c IN :primaryContactsIds) 
                                                        AND Contact_Type__c = 'Other'
                                                        AND Contact_Date__c = LAST_N_DAYS:10
                                                        AND (Person_1__r.Health_Status__c = 'Green' 
                                                            OR Person_2__r.Health_Status__c = 'Green')];

        Set<Id> secondaryContacts = new Set<Id>();
        // Iterate through the list of people traces and add the person ids to the set of secondary contacts
        // if they are not already processed
        for (People_Tracing__c pt : peopleTraces) {
            if (!alreadyProcessed.contains(pt.Person_1__c)) {
                secondaryContacts.add(pt.Person_1__c);
                alreadyProcessed.add(pt.Person_1__c);
            }
            if (!alreadyProcessed.contains(pt.Person_2__c)) {
                secondaryContacts.add(pt.Person_2__c);
                alreadyProcessed.add(pt.Person_2__c);
            }
        }
        return secondaryContacts;
    }

    /**
     * Get the count of each health status
     * @return Map<String, Integer>
     */
    public static Map<String, Integer> getHealthStatusCount(){
        AggregateResult[] healthCountMap = [SELECT Health_Status__c, Count(Id) total FROM Person__c GROUP BY Health_Status__c];

        // Returns health status count as map if found, else return null
        if (healthCountMap != null && healthCountMap.size() > 0) {
            Map<String, Integer> result = new Map<String, Integer>();
            // Iterate through the list of aggregate results and add the health status and count to the map
            for (AggregateResult ar : healthCountMap) {
                result.put(String.valueOf(ar.get('Health_Status__c')), Integer.valueOf(ar.get('total')));
            }
            return result;
        }
        return null;
    }

}
