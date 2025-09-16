({
    fetchStatusCount: function (component) {
        // Create an action to call the apex method
        const scope = component.get("v.scope");

        // Gets the status count for the selected scope, person or location
        let action = scope === "person" ? component.get("c.getPersonHealthStatuscount") : component.get("c.getLocationHealthStatuscount");

        action.setCallback(this, function (response) {
            const state = response.getState();
            
            if (state === "SUCCESS") {
                component.set("v.count", response.getReturnValue());
            }
        });

        // Call the action
        $A.enqueueAction(action);
    }
});
