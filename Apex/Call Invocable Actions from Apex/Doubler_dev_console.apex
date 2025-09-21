List<Doubler.Request> requests = new List<Doubler.Request>();

Doubler.Request req = new Doubler.Request();
req.input = 5.0;

requests.add(req);

List<Doubler.Response> responses = Doubler.doubler(requests);

System.debug('Output: ' + responses[0].output);