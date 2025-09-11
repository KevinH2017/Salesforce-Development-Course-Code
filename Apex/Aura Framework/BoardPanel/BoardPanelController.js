({
    // Aura framework automatically provides the component, event, and helper parameters
    // to the controller methods
    startGame : function(component, event, helper) {
        // Access the aura:id of combobox
        let gameModeComboBox = component.find('gameMode');

        // Gets the value of combobox component
        let selectedValue = gameModeComboBox.get('v.value');

        console.log('The start new game is clicked. The game mode is ' + selectedValue);
        alert('The start new game is clicked. The game mode is ' + selectedValue);
    },

    reshuffleBoard : function(component, event, helper) {
        // Access the aura:id of reshuffle button
        let reshuffle = component.find('reshuffle');

        // Gets the value of reshuffle component
        let selectedValue = reshuffle.get('v.value');
        
        console.log('The reshuffle button is clicked');
    }
});
