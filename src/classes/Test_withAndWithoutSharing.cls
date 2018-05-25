global without sharing class Test_withAndWithoutSharing {

	// system adm not Visible FLS with status__c 
	// Result : status__c still update succeed call by custom button
    webservice static String getOppyStatus() {
    	Opportunity testOppy = [SELECT Name, StageName, CloseDate, status__c, Approver1__c 
    								FROM Opportunity where id = '0067F00000CVSHf'];
    	System.debug(LoggingLevel.INFO, '*** testOppy: ' + testOppy);
    	System.debug(LoggingLevel.INFO, '*** testOppy.status__c: ' + testOppy.status__c);
    	testOppy.status__c = 'Submitted';
    	update testOppy;

    	return String.valueOf(testOppy.status__c);
    }
}