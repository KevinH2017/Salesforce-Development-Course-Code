({
    fetchUserInformation: function (component) {
        // Gets information for the user
        const recordId = component.get("v.recordId");
        const action = component.get("c.getPersonDetails");
        action.setParams({recordId});
        
        // Define a callback to check if result was successful
        action.setCallback(this, function (response) {
            const state = response.getState();
        
            if (state === "SUCCESS") {
                const resp = response.getReturnValue();
                // Checks if user found
                if (!resp || !resp.name) {
                    // User not found
                    component.set("v.userFound", false);
                    this.showToast("ERROR", "Please enter valid user id", "error");
                } else {
                    // User found
                    component.set("v.userFound", true);
                    component.set("v.userInfo", resp);
                }
            } else {
                // Error if ID cannot be found
                component.set("v.userFound", false);
                this.showToast("ERROR", "Please enter valid user id", "error");
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
