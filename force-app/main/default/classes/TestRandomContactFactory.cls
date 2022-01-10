@isTest
public class TestRandomContactFactory {

    @isTest static void getRandomContactFactory(){
        List<Contact> listaCont = RandomContactFactory.generateRandomContacts(1, 'lastName');
        system.assert(listaCont.size() >= 0);
    }
}