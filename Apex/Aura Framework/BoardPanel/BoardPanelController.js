({
    // Aura framework automatically provides the component, event, and helper parameters
    // to the controller methods
    startGame : function(component, event, helper) {
        // Access the aura:id of combobox
        let gameModeComboBox = component.find('gameMode');

        // Gets the value of combobox component
        let selectedValue = gameModeComboBox.get('v.value');

        // Holds selected game mode
        const selectedMode = component.get('v.selectedMode');

        // Update selectedMode attribute
        component.set('v.selectedMode', selectedValue);

        // If selectedMode is not null, call startGame() aura method in Board.cmp
        if (selectedMode) {
            const boardComp = component.find('boardComp');
            // Call aura method
            boardComp.startGame();
        }
    },

    reshuffleBoard : function(component, event, helper) {
        console.log('The reshuffle button is clicked');
    },

    onResultHandler : function(component, event, helper) {
        // If the player wins, disable the reshuffle button, else re-enable it
        const result = event.getParam('result');
        if (result === 'win') {
            component.set('v.reshuffleDisabled', true);
        } else {
            component.set('v.reshuffleDisabled', false);
        }
    }
});
