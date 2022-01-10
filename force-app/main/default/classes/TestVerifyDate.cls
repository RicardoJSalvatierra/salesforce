@isTest
public class TestVerifyDate {
    
    @isTest static Date testCheckDates1(){
        Date date1;
        Date date2;
        date1 = Date.today();
        date2 = Date.today() - 1;
        return VerifyDate.CheckDates(date1, date2);
    }

    @isTest static Date testCheckDates2(){
        Date date1;
        Date date2;
        date1 = Date.today() - 1;
        date2 = Date.today();
        return VerifyDate.CheckDates(date1, date2);
    }
}