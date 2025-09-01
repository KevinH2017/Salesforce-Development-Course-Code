public class AnnotationsDemo {

    //This method can be invoked by process builders and flows by using the annotation, @, below
    @InvocableMethod
    public static void justAnotherMethod() {
        System.debug('Can you call me from process builder?');
    }
}
