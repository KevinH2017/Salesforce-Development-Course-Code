// Iterates over all elements of a list or a set

// List of days
List<String> days = new List<String> {
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
};

// Iterates through all days
for (String day : days) {
    if (day == 'Tuesday') {
        continue;       // Exits loop
    }
    System.debug('It is ' + day + '. Eat chicken.');
}