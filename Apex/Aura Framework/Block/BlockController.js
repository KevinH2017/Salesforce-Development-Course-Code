({
    blockClickHandler : function(component, event, helper) {
        const open = component.get("v.open");
        if (!open) {
            component.set("v.open", true);
            // Get label value from Block.cmp
            const label = component.get("v.label");
            // Fire the block click event and send the label value to BlockClickEvent.evt
            let compEvent = component.getEvent("onclick");
            compEvent.setParams({value:label});
            compEvent.fire();
        }
    },

    scriptsLoaded : function(component, event, helper) {
        const divElement = component.getElement('.board-block');
        fitText(divElement);
    }
});
