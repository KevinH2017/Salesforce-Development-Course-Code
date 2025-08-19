// Sets hold multiple unordered values of the same data type, but no duplicates, data type must be declared with the variable

Set<Integer> rollNumbers = new Set<Integer> {123, 456, 789};
System.debug(rollNumbers);

rollNumbers.add(111);
rollNumbers.add(222);
rollNumbers.add(333);

System.debug(rollNumbers);

// Does not allow duplicate values
rollNumbers.add(333);
System.debug(rollNumbers);

// Check if set has an item
System.debug(rollNumbers.contains(123));
System.debug(rollNumbers.contains(444));

// Delete an item
rollNumbers.remove(333);
System.debug(rollNumbers);

// Get size of set
System.debug(rollNumbers.size());

// Check if a set is empty
System.debug(rollNumbers.isEmpty());

// Removes all items
rollNumbers.clear();
System.debug(rollNumbers.isEmpty());