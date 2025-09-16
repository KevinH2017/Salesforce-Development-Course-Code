({
    doInit: function (component, event, helper) {
        // Creates the columns for the table
        const columns = [
            { label: "Token", fieldName: "token", type: "text" },
            { label: "Contact Status", fieldName: "status", type: "text" },
            { label: "Visit Date", fieldName: "visitDate", type: "date" }
        ];
        component.set("v.columns", columns);
    },

    locationSearchHandler: function (component, event, helper) {
        // Gets information for the location
        helper.fetchLocationInformation(component);
    }
});
