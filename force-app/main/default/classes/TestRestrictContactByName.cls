@isTest
public class TestRestrictContactByName {

    @isTest static void restrictedContactByName(){
                // Test data setup
        // Create an account with an opportunity, and then try to delete it
        Contact ctc = new Contact(FirstName='Test', LastName='INVALIDNAME');
        

        try
		{
            // Perform test
            Test.startTest();
            insert ctc;
            Test.stopTest();
          
        }
		catch(Exception e)
        {
            // Verify  
            Boolean expectedExceptionThrown =  e.getMessage().contains(' is not allowed for DML')? true : false;            
            System.AssertEquals(expectedExceptionThrown, true);            
        } 
    }
}