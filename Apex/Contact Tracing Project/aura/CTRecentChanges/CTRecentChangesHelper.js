({
    fetchRecentHealthChanges: function (component) {
        // Gets recent health changes for the selected person or location
        let action = component.get("v.scope") === "person" ? component.get("c.getRecentPersonHealthChanges") : component.get("c.getRecentLocationHealthChanges");

        // Define a callback to check if result was successful
        action.setCallback(this, function (response) {
            const state = response.getState();

            if (state === "SUCCESS") {
                const data = response.getReturnValue();
                component.set("v.data", data);
                component.set("v.initialResponse", data);
            }
        });
        $A.enqueueAction(action);
    },

    searchRecord: function (component, queryTerm) {
        // Gets a record for a person or location based on search terms
        let action = component.get("v.scope") === "person" ? component.get("c.searchPeople") : component.get("c.searchLocation");
        action.setParams({searchTerm: queryTerm});

        // Define a callback to check if result was successful
        action.setCallback(this, function (response) {
            const state = response.getState();

            if (state === "SUCCESS") {
                const data = response.getReturnValue();

                // Checks if record found
                if (data && data.length > 0) {
                    component.set("v.data", data);
                }
                // If record is not found set to false
                component.set("v.issearching", false);
            }
        });
        $A.enqueueAction(action);
    }
});
