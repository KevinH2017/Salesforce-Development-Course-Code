// Lists hold multiple ordered values of the same data type, data type must be declared with the variable

List<Integer> rollNumbers = new List<Integer> {123, 456, 789};
System.debug(rollNumbers);

rollNumbers.add(111);
rollNumbers.add(222);
rollNumbers.add(333);

// Item at index 1
Integer rollNum = rollNumbers.get(1);
System.debug(rollNum);
System.debug(rollNumbers.get(1));

// Add item at index 4
rollNumbers.add(4, 9999);
System.debug(rollNumbers);

// Get size of the list
System.debug(rollNumbers.size());

// Remove the item at index 3
rollNumbers.remove(3);
System.debug(rollNumbers);
System.debug(rollNumbers.size());

// Update the item at index 1
rollNumbers.set(1, 444);
System.debug(rollNumbers);

// Clears the list
rollNumbers.clear();
System.debug(rollNumbers);
System.debug(rollNumbers.size());

// Below will throw an error; List index out of bounds: 1
// rollNumbers.set(1, 555);
// System.debug(rollNumbers);