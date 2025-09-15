({
    doInit : function(component, event, helper) {
        console.log('doInit called');
        // Gets the game mode
        const gameMode = component.get('v.mode');
        let column = 0;
        // Sets the number of columns based on game mode
        if (gameMode && gameMode === 'hard') {
            column = 6;
        } else if (gameMode === 'medium') {
            column = 4;
        } else {
            column = 3;
        }
        // Size of each block
        let blockSize = 12/column;
        component.set('v.blockSize', blockSize);
        
        // Builds list of 100 words
        const words = helper.getWords(column*column);
        component.set('v.words', words);

        // Gets the winning word
        const winWord = helper.getWinWord(words);
        component.set('v.winWord', winWord);

        // Resets the board
        helper.resetBoard(component);
    },

    doRender : function(component, event, helper) {
        console.log('doRender called');
    },

    blockClickHandler : function(component, event, helper) {
        // Click counter
        let clickCount = component.get('v.clickCount') + 1;

        // Get event value from BlockClickEvent.evt
        const value = event.getParam('value');

        // Checks if the user's picked word is the winning word
        if (value === component.get('v.winWord')) {
            // User wins when winning word is picked
            component.set('v.result', 'YOU WIN!');
            console.log('YOU WIN!');
            helper.disableBoard(component);
            helper.fireResultEvent('win');
        } else if (clickCount === 3) {
            // User loses when all clicks are used up
            component.set('v.result', 'YOU LOSE!');
            console.log('YOU LOSE!');
            helper.disableBoard(component);
            helper.fireResultEvent('lose');
        }
        // Tracks the number of clicks
        component.set('v.clickCount', clickCount);
    },

    reshuffleBoard : function(component, event, helper) {
        // Reshuffles the board and randomizes words
        const words = component.get('v.words');
        const randomizeWords = helper.randomizeArray(words);
        component.set('v.words', randomizeWords);
        // Resets board for new game
        helper.resetBoard(component);
    }
})