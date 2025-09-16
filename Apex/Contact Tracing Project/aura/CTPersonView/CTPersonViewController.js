({
    personSelectHandler: function (component, event, helper) {
        // Gets the recordId and status from the event
        const recordId = event.getParam("recordId");
        const status = event.getParam("status");
        component.set("v.recordId", recordId);
        component.set("v.status", status);
    },

    updateStatus: function (component, event, helper) {
        // Updates the health status of the record
        helper.updateStatus(component);
    }
});
