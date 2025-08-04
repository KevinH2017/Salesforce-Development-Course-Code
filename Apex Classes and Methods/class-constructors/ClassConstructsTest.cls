public class ClassConstructsTest {
    public String msg;
    public Integer myNum = 0;
    public static Integer myStaticNum = 0;
    // Initialization block
    {
        myNum = 5;
        myStaticNum = 5;
    }

    // Blank constructor that runs when class is called
    public ClassConstructsTest() {
        System.debug('Constructor Called.');
    }

    public ClassConstructsTest(String msg) {
        // Calls blank constructor
        this();
        // this keyword refers to the global variable
        this.msg = msg;
    }

    public void printMsg() {
        System.debug('Message: ' + msg);
        System.debug('Integer: ' + myNum + ' Static Integer: ' + myStaticNum);
    }
}