({
    createRecord: function (component, event, helper) {
        // Create a new record
        const createRecordEvent = $A.get("e.force:createRecord");
        const scope = component.get("v.scope");
        createRecordEvent.setParams({
            entityApiName: scope === "person" ? "Person__c" : "Location__c"
        });
        // Fire the event
        createRecordEvent.fire();
    },

    doInit: function (component, event, helper) {
        // Get count of each status
        helper.fetchStatusCount(component);
    }
});
