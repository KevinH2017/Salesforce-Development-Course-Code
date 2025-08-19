// if-else loops run the statements that return true once checked, else it goes to the next block
Boolean isItSunny = true;
Boolean isItRaining = true;
Boolean areYouWorking = false;

if (isItRaining == true) {
    System.debug('Bring an umbrella.');
} else {
    System.debug('Leave your umbrella.');
}

isItRaining = false;
if (!isItSunny) {       // Checks if it is not true
    System.debug('Do not go to the party.');
} else if (isItRaining) {
    System.debug('Do not go to the party.');
} else if (areYouWorking) {
    System.debug('Do not go to the party.');
} else {
    System.debug('Yay! It is party time!');
}

