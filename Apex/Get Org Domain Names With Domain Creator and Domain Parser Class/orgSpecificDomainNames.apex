/*
When changing an organization's domain name, the domains that Salesforce hosts for your org also changes
To protect your code from these changes, the hostnames for these domains can be protected by using the apex class
System.DomainCreator

You can also get information about the domains that Salesforce hosts for your org with the class
System.Domain

Or you can use a URL or hostname to obtain information about the associated domains by using the class
System.DomainParser
*/

// Gets the domain name of my organization
String domainUrl = Url.getOrgDomainUrl().toExternalForm();
System.debug('My Domain Name using Url: ' + domainUrl);

// Gets additional information about the domain name of my organization
System.debug('DomainCreator.getOrgDomainName(): ' + DomainCreator.getOrgDomainName());
System.debug('DomainCreator.getOrgMyDomainHostname(): ' + DomainCreator.getOrgMyDomainHostname());
System.debug('DomainCreator.getLightningHostname(): ' + DomainCreator.getLightningHostname());
System.debug('DomainCreator.getExperienceCloudSitesBuilderHostname(): ' + DomainCreator.getExperienceCloudSitesBuilderHostname());

// Enter your salesforce domain name
System.Domain d = DomainParser.parse('SALESFORCE_DOMAIN_NAME');
System.debug('System.Domain getMyDomainName: ' + d.getMyDomainName());
System.debug('System.Domain getDomainType: ' + d.getDomainType());