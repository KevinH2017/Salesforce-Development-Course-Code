/*
Safe Navigation Operator (?.) allows you to safely access properties or methods of objects that might be null

If any part of the object chain is null, the operator returns null instead of throwing a NullPointerException

Example:

Integer horsepower = car?.engine?.horsepower;
if (car != null && car.engine != null) {
    horsepower = car.engine.horsepower;
} else {
    horsepower = null;
}
*/

// Example 1: Car with a valid Engine
Car carWithEngine = new Car();
carWithEngine.model = 'Land Rover Discovery';
carWithEngine.engine = new Car.Engine();
carWithEngine.engine.horsepower = 300;
carWithEngine.engine.make = 2016;

System.debug('Car Model: ' + carWithEngine?.model);
System.debug('Car Engine HP: ' + carWithEngine?.engine?.horsepower);

// Example 2: Engine is null
Car carWithoutEngine = new Car();
carWithoutEngine.model = 'Land Rover Defender';
System.debug('Car Model: ' + carWithoutEngine?.model);
System.debug('Car Engine HP: ' + carWithoutEngine?.engine?.horsepower);

// Example 3: Car is null
Car nullCar = null;
System.debug('Car Model: ' + carWithoutEngine?.model);
System.debug('Car Engine HP: ' + carWithoutEngine?.engine?.horsepower);
