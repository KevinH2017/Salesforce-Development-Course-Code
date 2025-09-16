({
    fetchResult : function(component) {
        const action = component.get("c.getResults");
        // Sets callback function to get results
        action.setCallback(this, function(response) {
            const state = response.getState();
            if (state === "SUCCESS") {
                const resp = response.getReturnValue();
                component.set("v.data", resp);
            }
        });
        // Sends apex function to server
        $A.enqueueAction(action);
    }
})