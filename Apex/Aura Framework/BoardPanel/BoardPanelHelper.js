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
    }
});
