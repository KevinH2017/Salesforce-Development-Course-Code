({
    fetchLocationInformation: function (component, event, helper) {
        // Gets information for the location
        const recordId = component.get("v.recordId");
        const action = component.get("c.getLocationDetails");
        action.setParams({recordId});
        // Define a callback to check if result was successful
        action.setCallback(this, function (response) {
            const state = response.getState();

            if (state === "SUCCESS") {
                const resp = response.getReturnValue();
                // Checks if location found
                if (!resp || !resp.name) {
                    // Location not found
                    component.set("v.locationFound", false);
                    this.showToast("ERROR", "Please enter valid location id", "error");
                } else {
                    // Location found
                    component.set("v.locationFound", true);
                    component.set("v.locationInfo", resp);
                }
            } else {
                // Error if ID cannot be found
                component.set("v.locationFound", false);
                this.showToast("ERROR", "Please enter valid location id", "error");
            }
        });
        $A.enqueueAction(action);
    },

    showToast: function (title, message, type) {
        // Displays a message below the header
        const toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title,
            message,
            type
        });
        toastEvent.fire();
    }
});
