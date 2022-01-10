public class ContactAndLeadSearch {
	public static List<List<sObject>> searchContactsAndLeads(String value1){
     	try {
                List<List<sObject>> searchList = [FIND :value1 IN ALL FIELDS 
                                   RETURNING Lead(Name),Contact(FirstName,LastName,Department)];
           
            	return searchList;
        	} catch (DmlException e) {
            	System.debug('A DML exception has occurred: ' +
                        e.getMessage());
                return null;
        	}

    }
}