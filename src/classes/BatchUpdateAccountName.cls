public class BatchUpdateAccountName implements Database.Batchable<sObject> {
    private String query;
    public BatchUpdateAccountName() {
        query = 'select id,Name from Account where Name like \'%test%\' ';
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        Database.QueryLocator retVal = Database.getQueryLocator(query);
        return retVal;
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        for (Account acct : scope) {
            acct.Name =  acct.name.left(15);
            acct.Name = '' + acct.name + system.now();
        }
        update scope;

    }

    public void finish(Database.BatchableContext BC) {
        // send email to me
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'mqiu@xogrp.com','799592179@qq.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('you already update Account Name');
        mail.setHtmlBody('Scheduler already executed in ' + system.now());

        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {mail};
        List<Messaging.SendEmailResult> results = Messaging.sendEmail(messages, false);
        
    }
}