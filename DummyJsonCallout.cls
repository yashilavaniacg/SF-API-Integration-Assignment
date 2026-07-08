public class DummyJsonCallout {

    public static void getUsers() {

        Http http = new Http();

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://dummyjson.com/users');
        req.setMethod('GET');

        HttpResponse res = http.send(req);

        // Task 1
        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Complete Response: ' + res.getBody());

        // Task 2
        Map<String, Object> responseMap =
            (Map<String, Object>) JSON.deserializeUntyped(res.getBody());

        List<Object> users =
            (List<Object>) responseMap.get('users');

        List<String> lastNames = new List<String>();

        for(Object userObj : users) {

            Map<String,Object> userMap =
                (Map<String,Object>) userObj;

            lastNames.add(
                (String) userMap.get('lastName')
            );
        }

        System.debug('Last Names: ' + lastNames);
    }
}
