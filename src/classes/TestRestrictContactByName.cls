@isTest
private class TestRestrictContactByName {
    static testMethod void testMethod1() {
        
        test.startTest();
        try{
        	Contact cont = new Contact();
    			cont.FirstName = 'qiu';
    			cont.LastName = 'INVALIDNAME';
    			insert cont;
        }catch(Exception ex){
        	System.debug(LoggingLevel.INFO, '*** ex: ' + ex);
        }
    		
        test.stopTest();
    }
}