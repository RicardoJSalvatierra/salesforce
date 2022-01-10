public class Accounts extends fflib_SObjectDomain {
    public Accounts(List<Account> SObjectList){
        super(SObjectList);
    }
    
    public class Constructor implements fflib_SObjectDomain.IConstructable{
        public fflib_SObjectDomain construct(List<SObject> sObjectList){
            return new Accounts(sObjectList);
        }
    }
    
    public override void handleBeforeInsert()
    {
        onApplyDefaults();
    }
    
    public override void onBeforeUpdate(Map<Id,sObject> existingRecords){
        String rock = 'Domain classes rock!';
        Set<Id> Ids = existingRecords.keySet();

        //List<Account> accountList = [SELECT Id, Description, AnnualRevenue
        //                             FROM Account
        //                             WHERE Id IN :Ids];

        List<Account> updatedAccounts = new List<Account>();

        for (Account acct : (List<Account>) Records) {
                acct.AnnualRevenue = rock.getLevenshteinDistance(acct.Description);
                updatedAccounts.add(acct);
        }

        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(new Schema.SObjectType[] { Account.SObjectType });
        uow.registerDirty(updatedAccounts);

    }

    public override void onApplyDefaults() {  
        for (Account acct : (List<Account>) Records) {
                acct.Description = 'Domain classes rock!';
        }
    }

    


}