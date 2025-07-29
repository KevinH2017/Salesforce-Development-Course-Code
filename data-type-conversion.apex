// Storing student grades as strings
String physicsGrade = '72';
String chemistryGrade = '64';
String mathGrade = '87';

// Converts string to integers
String total = String.valueOf(Integer.valueOf(physicsGrade) +
                            Integer.valueOf(chemistryGrade) +
                            Integer.valueOf(mathGrade)
                        );
System.debug('Total: ' + total);