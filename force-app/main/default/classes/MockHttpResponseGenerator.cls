@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
     global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://calendarific.com/api/v2/holidays?country=CA&year=2021&api_key=5e81b82c09cde593f7e914f00303f5cf968139a7', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(createJsonString());
        res.setStatusCode(200);
        return res;
    }
    
      public string createJsonString(){
      String str =   '{'+
                    '"meta": {'+
                        '"code": 200'+
                    '},'+
                    '"response": {'+
                        '"holidays": [{'+
                            '"name": "New Year",'+
                            '"description": "New Year",'+
                            '"country": {'+
                                '"id": "ca",'+
                                '"name": "Canada"'+
                            '},'+
                            '"date": {'+
                                '"iso": "2021-12-31",'+
                                '"datetime": {'+
                                    '"year": 2021,'+
                                    '"month": 12,'+
                                    '"day": 31'+
                                '}'+
                            '},'+
                            '"type": ["Observance"],'+
                            '"locations": "All",'+
                            '"states": "All"'+
                        '}]'+
                    '}'+
                '}';
        return str;
    
    }
}
