// Initializes HelloWorld class to variable firstClass
HelloWorld firstClass = new HelloWorld();

firstClass.printGreeting();
firstClass.printPublicGreeting();

// Directly accessing private variables throws error; Variable is not visible: HelloWorld.greeting
// System.debug(firstClass.greeting);

// Directly accessing public variables works
System.debug('Public string variable: ' + firstClass.publicGreeting);