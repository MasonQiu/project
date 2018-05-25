@isTest
private class TestVerifyDate {
    static testMethod void testMethod1() {
    		test.startTest();
    		Date date1 = System.today();
    		Date date2 = date1.addDays(31);
        VerifyDate.CheckDates(date1,date2);
        Date date3 = System.today();
    		Date date4 = date3.addDays(2);
        VerifyDate.CheckDates(date3,date4);
        test.stopTest();
    }
}