@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        System.debug('request');
        System.debug(request);
        // grab the caseId from the end of the URL
        String[] accountId = request.requestURI.split('/');
        System.debug('accountId');
        System.debug(accountId[4]);
        //if(accountId == 'contacts')
        //    accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')-19).substring(1,19);
            
        Account[] result =  [SELECT Name, Id,(SELECT ID, Name FROM Contacts)
                        	FROM Account
                        	WHERE Id = :accountId[4]];
        return result[0];
    }
    @HttpPost
    global static ID createAccount(String Name) {
        Account thisAccount = new Account(Name = Name);
        insert thisAccount;
        return thisAccount.Id;
    }   
}