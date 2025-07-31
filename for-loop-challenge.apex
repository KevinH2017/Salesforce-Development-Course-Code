// The pattern challenge
// Create the below pattern:
// *
// * *
// * * *
// * * * *
// * * * * *

Integer n;
for (n = 0; n < 5; n++) {
    String pattern = '* ';      // Starting stars for each row
    // Adds a star for each following row
    for (Integer i = 0; i < n; i++) {
        pattern = pattern + '* ';
    }
    System.debug(pattern);
}