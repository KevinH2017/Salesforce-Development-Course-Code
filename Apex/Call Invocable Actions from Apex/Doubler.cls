public class Doubler {

    // Request wrapper class for input
    public class Request {
        @InvocableVariable(required=true)
        public Double input;
    }

    // Response wrapper class for output
    public class Response {
        @InvocableVariable
        public Double output;
    }

    // Invocable method that doubles the input
    @InvocableMethod(label='Doubler' description='Doubles the input value')
    public static List<Response> doubler(List<Request> requests) {
        List<Response> responses = new List<Response>();
        for (Request req : requests) {
            Response res = new Response();
            res.output = req.input * 2;
            responses.add(res);
        }
        return responses;
    }
}
