@isTest
private class ParkLocatorTest {
    @isTest static void TestCallOut(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        String country = 'United States';
        
        List<String> result = ParkLocator.Country(country);
        system.debug('results:');
        system.debug(result);
        
        List<String> countries = new List<String>();
        countries.add('Japan');
        countries.add('United States');
        countries.add('Germany');
        
        System.assertEquals(countries, result);
    }
}