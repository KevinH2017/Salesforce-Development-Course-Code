({
    doInit : function(component, event, helper) {
        console.log('doInit called');
        // Builds list of 100 words
        const words = helper.getWords(6);
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