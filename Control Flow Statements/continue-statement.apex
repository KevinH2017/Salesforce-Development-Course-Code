// Continue statement skips the current iteration of a loop

// List of days
List<String> days = new List<String> {
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
};

// Iterates through all days
Integer listSize = days.size();         // Gets size of the list
for (Integer i=0; i<listSize; i++) {
    System.debug('Hello');
    if (days.get(i) == 'Tuesday') {
        continue;       // Exits loop
    }
    System.debug('It is ' + days.get(i) + '. Eat chicken.');
}