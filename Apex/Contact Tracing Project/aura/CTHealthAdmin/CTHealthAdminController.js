({
    tabSelectHandler: function (component, event, helper) {
        // Get the id of the selected tab
        const selectedTabId = event.getParam("id");
        
        if (selectedTabId === "person") {
            component.set("v.headerTitle", "Person View");
        } else {
            component.set("v.headerTitle", "Location View");
        }
        component.set("v.scope", selectedTabId);

        // Call fetchCount() aura method in CTHealthHeader.cmp
        const healthHeaderComp = component.find("health-header");
        healthHeaderComp.fetchCount();
    }
});
