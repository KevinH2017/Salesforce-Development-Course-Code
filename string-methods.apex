// Apex string methods

String str = 'i am a string variable';
System.debug('String 1: ' + str);

// Capitalizes string
System.debug('Capitalized String 1: ' + str.capitalize());

// .contains method
System.debug('Contains ring?: ' + str.contains('ring'));

// Convert to upper case
System.debug('Upper case: ' + str.toUpperCase());

// Convert to lower case
System.debug('Lower case: ' + str.toLowerCase());

// .equals method
System.debug('Is equal to ring: ' + str.equals('ring'));

String str1 = 'Text';
String str2 = 'text';
System.debug('str1 equals str2: ' + str1.equals(str2));
System.debug('str1 equals str2 ignore case: ' + str1.toLowerCase().equals(str2));

// .remove method
System.debug('Remove ring: ' + str.remove('ring'));

// .replace method
System.debug('Replace ring: ' + str.replace('ring', 'rong'));

// .split method
System.debug('Split by space: ' + str.split(' '));

// String escape character
String str3 = 'My team\'s leader is \'Kevin\'. \n We work on apex.';
System.debug(str3);

/*  
    Special backslash characters:
    \b - One backspace character
    \n - new line
    \r - Carriage return
    \t - Tab
    \\ - One backslash character
    \o - One ASCII null character
*/