public class ContactSearch {
	public static Contact[] searchForContacts(String value1, String value2){
     	try {
				Contact[] cts = [SELECT Account.ID, Account.Name FROM Contact 
                				WHERE LastName=:value1 AND MailingPostalCode=:value2];
            
            	return cts;
        	} catch (DmlException e) {
            	System.debug('A DML exception has occurred: ' +
                        e.getMessage());
                return null;
        	}

    }
}