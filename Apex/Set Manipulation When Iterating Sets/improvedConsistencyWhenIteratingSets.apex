/*
Improved Consistency When Iterating Sets

When modifying elements of a set while iterating through it in a for or foreach() loop throws an exception
The exception: System.FinalException: Cannot modify a collection while it is being iterated
*/

// Example:
Set<String> set_string = new Set<String>{'a','b','c'};

for (String str : set_string) {
    System.debug(str);
    // Removes the string from the set
    set_string.remove(str);

    // Checks if the set contains the string
    // Exception is thrown if the string cannot be found
    System.debug(set_string.contains(str));
}

System.debug(set_string);