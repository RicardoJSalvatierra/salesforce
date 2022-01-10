@isTest
private class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        // Create the mock response based on a static resource
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        string result = Animallocator.getAnimalNameById(1);
        // Verify mock response is not null
        System.assertNotEquals(null,result,'The callout returned a null response.');

        System.assertEquals('chicken', result,'The result matches.');          
    }
}