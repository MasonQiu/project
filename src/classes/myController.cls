public with sharing class myController {

    private final Account account;

    public myController() {
    	System.debug(LoggingLevel.INFO, '*** myController: ');
      account = [select id, name, site, NumberOfEmployees, Industry from Account 
                 where id = :ApexPages.currentPage().getParameters().get('id')];
    }

    public Account getAccount() {
    	System.debug(LoggingLevel.INFO, '*** myController.getAccount: ');
          return account;
    }

    public PageReference save() {
    	System.debug(LoggingLevel.INFO, '*** myController.save: ');
    	System.debug(LoggingLevel.INFO, '*** account: ' + account);
          update account;
          return null;
    }

    public PageReference cancel() {
    			System.debug(LoggingLevel.INFO, '*** myController.cancel: ');
          return null;
    }


  	@RemoteAction
		public static String callByJavascript(String acctName) {

    			System.debug(LoggingLevel.INFO, '*** callByJavascript: ');

    			return acctName+'_update by Javascript';
		}
}