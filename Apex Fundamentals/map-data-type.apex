// Maps hold key-value pairs of two data types

Map<Integer, String> class2025 = new Map<Integer, String>();

// Adds a new number/name pair to the map
class2025.put(1, 'Kevin');
System.debug(class2025);

class2025.put(2, 'Henry');
class2025.put(3, 'Nico');
class2025.put(4, 'Joe');

System.debug(class2025);

class2025.put(5,'Bill');
System.debug(class2025);

// Updates / overwrites the value of a key that already exists
class2025.put(5, 'Charlie');
System.debug(class2025);

// Get a value with a key
System.debug(class2025.get(4));

// Remove an item from map
class2025.remove(3);
System.debug(class2025);

// Get all keys
System.debug(class2025.keySet());

// Get all values
System.debug(class2025.values());

// Checks if the map has the key
System.debug(class2025.containsKey(1));
System.debug(class2025.containsKey(3));