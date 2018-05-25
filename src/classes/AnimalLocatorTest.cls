@isTest
public with sharing class AnimalLocatorTest{
    @isTest 
    	static void testGetCallout() {
    		Account acct = new Account();
    		acct.Name = 'test';
    		insert acct;
    		
    		/*
    		Test a Callout with StaticResourceCalloutMock

    		//Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, mock);

    		 */
        
        /*
        Test a Callout with HttpCalloutMock
        */
    		test.startTest();
       
	      Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
	    
        test.stopTest();


        // Call method to test
        String result = AnimalLocator.getAnimalNameById(2);
        
    }   
}