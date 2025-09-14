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
        console.log("Words: " + words);
        // Gets the winning word
        const winWord = helper.getWinWord(words);
        component.set('v.winWord', winWord);
        console.log('Win Word: ' + winWord);
    },
    doRender : function(component, event, helper) {
        console.log('doRender called');
    }
})