public class AccountHandler {

    public static Account insertNewAccount(string accName){
     	try {
                Account acct = new Account(Name=accName);
            	system.debug(accName);
                
                insert acct;
            
            	return acct;
        	} catch (DmlException e) {
            	System.debug('A DML exception has occurred: ' +
                        e.getMessage());
                system.debug(accName);
                return null;
        	}

    }
}