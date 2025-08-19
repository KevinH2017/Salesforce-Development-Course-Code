// Initializes ParametersTest class to variable parametersTest
ParametersTest parametersTest = new ParametersTest();

parametersTest.printMessage('Hello World!');
parametersTest.printMessage('This is my generic message method.');
parametersTest.printMessage('Good Morning');

System.debug(parametersTest.getDay(0));
System.debug(parametersTest.getDay(1));
System.debug(parametersTest.getDay(4));
System.debug(parametersTest.getDay(10));        // Invalid day number

System.debug(parametersTest.getDay('Sun'));
System.debug(parametersTest.getDay('Tue'));
System.debug(parametersTest.getDay('Sat'));
System.debug(parametersTest.getDay('asdf'));    // Invalid day abbreviation 