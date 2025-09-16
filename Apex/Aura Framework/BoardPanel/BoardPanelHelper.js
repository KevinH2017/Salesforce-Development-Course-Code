({
    addResultRecord : function(component, gameResult) {
        // Create apex method call to addResult
        const action = component.get('c.addResult');
        const modeValue = component.get('v.selectedMode').toUpperCase();
        // Sets parameters result and mode for BoardPanelController.cls
        action.setParams({
            result : gameResult.toUpperCase(),
            mode : modeValue
        });
        // Define a callback to check if result was successful
        action.setCallback(this, function(response) {
            const state = response.getState();
            if (state !== 'SUCCESS') {
                console.error('Error in saving record!');
            }
        });

        // Call apex method
        $A.enqueueAction(action);
    },
    
    showToast : function(titleValue, messageValue, typeValue) {
        // Displays a message below the header
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : titleValue,
            message : messageValue,
            type : typeValue
        });
        toastEvent.fire();
    }
})
