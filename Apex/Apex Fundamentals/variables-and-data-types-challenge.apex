// Posts for apex category
List<String> apexPosts = new List<String> {'Demystifying Apex Collections', 'Datatypes and variables in Apex'};

// Posts for lightning category
List<String> lightningPosts = new List<String> {'Events in Aura framework', 'Developing reusable components'};

// Map can store categories and post lists
Map<String,List<String>> allPosts = new Map<String, List<String>>();

// Insert apex posts
allPosts.put('Apex', apexPosts);

// Insert lightning posts
allPosts.put('Lightning', lightningPosts);

// Prints all posts with categories
System.debug(allPosts);