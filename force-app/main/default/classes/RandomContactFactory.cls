public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(integer contNum, string lastName){
		List<Contact> lstCtc = new List<Contact>();
        for(integer i=0; i<contNum; i++){            
            Contact ctc = new Contact(FirstName='Test Name' + i, LastName=lastName);
            lstCtc.add(ctc);
        }
        return lstCtc;
    }
}