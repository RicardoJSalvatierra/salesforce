@isTest
global class ParkServiceMock implements WebServiceMock {    
       global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_a = 
            new ParkService.byCountryResponse();
               
        List<String> countries = new List<String>();
        countries.add('Japan');
        countries.add('United States');
        countries.add('Germany');
        system.debug(countries);
        response_a.return_x = countries;
        // end
        response.put('response_a', response_a); 
   }
}