({
    userSearchHandler: function (component, event, helper) {
        // Gets information for that user
        helper.fetchUserInformation(component);
    },

    doInit: function (component, event, helper) {
        // Creates the columns for the table
        const columns = [
            { label: "Token", fieldName: "token", type: "text" },
            { label: "Contact Status", fieldName: "status", type: "text" },
            { label: "Contact Date", fieldName: "contactDate", type: "date" }
        ];
        component.set("v.columns", columns);
    }
});
