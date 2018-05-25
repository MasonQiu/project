public with sharing class myControllerExtension {
    public final Opportunity oppy {get;set;}
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public myControllerExtension(ApexPages.StandardController stdController) {
        this.oppy = [select id,name,status__c from Opportunity where id =: stdController.getId()];
        Opportunity testOppy = [select id,name,status__c from Opportunity where id =: oppy.id];
        System.debug(LoggingLevel.INFO, '*** oppy: ' + oppy);
        System.debug(LoggingLevel.INFO, '***testOppy.status: ' + testOppy.status__c);
    }

    public String getGreeting() {
        return 'Hello ' + oppy.name + ' (' + oppy.id + ')';
    }

}