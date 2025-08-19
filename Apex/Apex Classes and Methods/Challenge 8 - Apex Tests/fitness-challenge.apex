Fitness fitness = new Fitness();

Decimal personBMI = fitness.calculateBMI(75, 1.75);
Decimal personPace = fitness.calculatePace(22, 115);

System.debug('BMI: ' + personBMI + ' kg/m^2');      // ≈24.489 kg/m^2
System.debug('Pace: ' + personPace + ' km/hr');     // ≈11.478 km/hr