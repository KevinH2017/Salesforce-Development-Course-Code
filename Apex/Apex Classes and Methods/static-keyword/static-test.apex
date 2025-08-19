// Gets Covid19 class from .cls file in the same folder
Covid19 jaipur = new Covid19();

System.debug('Recoverd in jaipur : '+ jaipur.recoveredInArea);
//System.debug('Recoverd in country : '+ Covid19.recoveredInCountry);
Covid19.printTreated();

jaipur.treatPatient();

System.debug('Recoverd in jaipur : '+ jaipur.recoveredInArea);
//System.debug('Recoverd in country : '+ Covid19.recoveredInCountry);
Covid19.printTreated();

Covid19 hyd = new Covid19();
hyd.treatPatient();

System.debug('Recoverd in hyd : '+ hyd.recoveredInArea);
//System.debug('Recoverd in country : '+ Covid19.recoveredInCountry);
Covid19.printTreated();
