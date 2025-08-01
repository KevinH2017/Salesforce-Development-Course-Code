// Break statements exit any loop instantly

Integer gooseBumpsAfter = 4;
Integer n = 1000;

for (Integer i=0; i<n; i++) {
    System.debug('Listening to the song ' + i + ' times.');
    if (i == gooseBumpsAfter) {
        break;      // Exits loop instantly
    }
}
