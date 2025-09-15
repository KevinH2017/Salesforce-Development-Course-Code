({
    getWords : function(count) {
        // If more than 100 words, return nothing
        if (count > 100) return;
        // Build an array
        let wordsArray = [
            "expansion",
            "grandfather",
            "nappy",
            "oranges",
            "beds",
            "quack",
            "achiever",
            "yell",
            "hospital",
            "winter",
            "understood",
            "squalid",
            "merciful",
            "reaction",
            "wipe",
            "fearless",
            "tiresome",
            "introduce",
            "planes",
            "drum",
            "muddle",
            "capable",
            "canvas",
            "route",
            "enchanted",
            "quirky",
            "switch",
            "apparatus",
            "loss",
            "agreement",
            "substance",
            "back",
            "oafish",
            "expand",
            "aromatic",
            "quarrelsome",
            "free",
            "useful",
            "raspy",
            "drown",
            "ring",
            "lush",
            "numberless",
            "embarrass",
            "shrill",
            "rice",
            "ice",
            "crow",
            "pumped",
            "sparkle",
            "instruct",
            "girl",
            "glass",
            "frog",
            "murky",
            "impolite",
            "crabby",
            "pin",
            "grade",
            "upbeat",
            "linen",
            "flaky",
            "side",
            "unknown",
            "cactus",
            "round",
            "busy",
            "grab",
            "crush",
            "faithful",
            "mother",
            "clean",
            "unhealthy",
            "event",
            "absent",
            "thoughtless",
            "icy",
            "prefer",
            "charge",
            "confuse",
            "clam",
            "dress",
            "snake",
            "evasive",
            "unit",
            "flow",
            "annoying",
            "gusty",
            "possessive",
            "rhetorical",
            "rule",
            "frantic",
            "farm",
            "poor",
            "possess",
            "men",
            "pleasant",
            "zoom",
            "sidewalk",
            "reply"];

            // Randomize the words
            wordsArray = this.randomizeArray(wordsArray);

            // Returns requested number of words from the array
            return wordsArray.slice(0, count);
    },

    randomizeArray : function(arr) {
        // Randomizes the order of an array
        const randomArr = arr;
        for (let i=randomArr.length-1; i>0; i--) {
            const j = Math.floor(Math.random() * i);
            const temp = randomArr[i];
            randomArr[i] = randomArr[j];
            randomArr[j] = temp;
        }
        return randomArr;
    },

    getWinWord : function(arr) {
        // Randomly selects a word from the array as the winning word
        const randomIndex = Math.floor(Math.random() * arr.length);
        return arr[randomIndex];
    },

    disableBoard : function(component) {
        component.set('v.boardDisabled', true);
    },

    enableBoard : function(component) {
        component.set('v.boardDisabled', false);
    },

    resetBoard : function(component) {
        // Re-enables board for new game
        this.enableBoard(component);

        // Reset click counter
        component.set('v.clickCount', 0);
        
        // Reset result
        component.set('v.result', '');
    },

    fireResultEvent : function(component, resultValue) {
        // Fires the result event and sends the result value to ResultEvent.evt
        const appEvent = $A.get('e.c:ResultApplicationEvent');
        appEvent.setParams({result:resultValue});
        appEvent.fire();
    }

})