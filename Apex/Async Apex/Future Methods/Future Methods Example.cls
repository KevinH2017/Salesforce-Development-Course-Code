/*
 Runs in its own thread / transaction
 Executes when system resources are available

 Requirements:
 - Must be static
 - Must have void return type
 - Parameters must be primitive data types, collection of primitive data types
*/
global class MyClass {
    @future
    public static void myFutureMethod() {
        // Perform operations
    }
}
