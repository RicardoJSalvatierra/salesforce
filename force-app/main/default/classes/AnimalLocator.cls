public class AnimalLocator {
    public static string getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        system.debug(id);
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        string anmal;
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug(response.getBody());
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            system.debug(results);
            // Cast the values in the 'animals' key as a list
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('Received the following animals:');
            //for (Object animal: animals) {
                System.debug(animals.get('name'));
                anmal = animals.get('name').ToString();
            //}
        }
        return anmal;
    }
}