// The Safe Navirgation operator (?.) allows to safely access properties or methods of objects that might be null

// Example 1: Car with a valid Engine
Car carWithEngine = new Car();
carWithEngine.model = 'Land Rover Discovery';
carWithEngine.engine = new Car.Engine();
carWithEngine.engine.horsepower = 300;
carWithEngine.engine.make = 2016;

System.debug('Car Model: ' + carWithEngine?.model);
System.debug('Car Engine HP: ' + carWithEngine?.engine?.horsepower);

// Example 2: Car without an Engine (engine is null)
Car carWithoutEngine = new Car();
carWithoutEngine.model = 'Land Rover Defender';
System.debug('Car Model: ' + carWithoutEngine?.model);
System.debug('Car Engine HP: ' + carWithoutEngine?.engine?.horsepower);

// Example 3: Null Car
Car nullCar = null;
System.debug('Car Model: ' + nullCar?.model);
System.debug('Car Engine HP: ' + nullCar?.engine?.horsepower);
