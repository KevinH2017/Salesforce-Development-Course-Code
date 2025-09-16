({
    updateStatus: function (component) {
        // Updates the health status of the record
        const recordId = component.get("v.recordId");

        const action = component.get("c.updateHealthStatus");
        action.setParams({
            personId: recordId
        });

        // Define a callback to check if result was successful
        action.setCallback(this, function (response) {
            var state = response.getState();

            if (state === "SUCCESS") {
                // Displays a message below the header if update successfull
                this.showToast("Success", "Person Health Status Updated", "success");
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
