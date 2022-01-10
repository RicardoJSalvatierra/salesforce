@IsTest
public class UnitOfWorkTest {
    @isTest static void challengeComplete(){
        // Create a Unit Of Work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
        // Do some work
        for(Integer i=0;i<100;i++){
            Account acc = new Account();
            acc.Name = 'AccountOfWork' + i;
            uow.registerNew(acc);
            
            for(Integer j=0;j<5;j++){
                Contact con = new Contact();
                con.FirstName = 'Lucas' + j;
                con.LastName = 'Gonzalez';
                con.Email = 'mail@mail.com';
                uow.registerNew(con, Contact.AccountId, acc);
                Note n = new Note();
                n.Title = 'Titulo' + j;
                n.Body = 'Nota' + j;
                uow.registerNew(n,Note.ParentId,acc);
            }
			
        }
        uow.commitWork();
        // Asserts
        System.assertEquals(100,[Select Id from Account].size());
		System.assertEquals(500,[Select Id from Contact].size());
		System.assertEquals(500,[Select Id from Note].size());
    }
}