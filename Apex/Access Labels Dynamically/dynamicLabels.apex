/*
Access Labels in Apex Dynamically

Using the System.Label.get(nameSpace, label, language) method to get a custom label, optionally specifying a language

This method allows dynamic resolution of label names at run time, including overriding the user's current language
if a translate exists for the requested language

Previously, retrieving labels required compile-time knowledge of the label's API name

Salesforce supports five-character locale codes for languages. For example, en_AU

But the Consumer Goods Cloud Offline Mobile app supports only two-character language codes

We’ve mapped some of the five-character locale codes to two-character language codes and 
you can use the two-character language code to identify the locale file to be uploaded from Static Resources


Languages supported by the Consumer Goods Cloud Offline Mobile app:

    Language: 	            Code:

    Portuguese (Brazil) 	br
    German 	                de
    English 	            en
    Spanish 	            es
    French 	                fr
    English (UK) 	        gb
    Italian 	            it
    Japanese 	            ja
    Spanish (Mexico) 	    mx
    Norwegian 	            no

Languages supported by the Consumer Goods Cloud Offline Mobile app that are currently in Beta:

    Danish 	                da
    Finnish 	            fi
    Hungarian 	            hu
    Indonesian 	            in
    Korean 	                ko
    Dutch 	                nl
    Portuguese (European) 	pt
    Russian 	            ru
    Swedish 	            sv
    Thai 	                th
    Chinese (Traditional) 	tw
    Vietnamese 	            vi
    Chinese (Simplified) 	zh

Documentation: https://help.salesforce.com/s/articleView?id=ind.cg_concept_admin_supported_languages.htm&type=5
*/

// Example:
String greetingEn = System.Label.get(null, 'greeting', '');        // Default language is English
System.debug('English Value: ' + greetingEn);

String greetingFr = System.Label.get(null, 'greeting', 'fr');
System.debug('French Value: ' + greetingFr);

String greetingJa = System.Label.get(null,'greeting','ja');
System.debug('Japanese Value: ' + greetingJa);

String greetingDe = System.Label.get(null,'greeting','de');
System.debug('German Value: ' + greetingDe);

String summer23En = System.label.get(null, 'Summer23', 'en');
System.debug('English Summer23: ' + summer23En);

String summer23Fr = System.label.get(null, 'Summer23', 'fr');
System.debug('French Summer23: ' + summer23Fr);
