@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            '/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test record Account', thisAccount.Name);
    }
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account accountTest = new Account(Name='Test record Account');
        insert accountTest;
        return accountTest.Id;
    }
    @isTest static void testCreateAccount() {
        // Call the method to test
        ID thisAccountId = AccountManager.createAccount('Ferocious chipmunk');
        // Verify results
        System.assert(thisAccountId != null);
        Account thisAccount = [SELECT Name FROM Account WHERE Id=:thisAccountId];
        System.assert(thisAccount != null);
        System.assertEquals(thisAccount.Name, 'Ferocious chipmunk');
    }
}