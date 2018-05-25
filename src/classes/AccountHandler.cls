public class AccountHandler {

    public static Account insertNewAccount(String AcctName) {
    	Account acct = new Account();
    	try{
	    	acct.Name = AcctName;
	    	// Database.insert(acct,false);	
	    	insert acct;
	    }catch(DmlException e) {
	    	System.debug('A DML exception has occurred: ' + e.getMessage());
	    	return null;
	    	//DDDDDdddddd
	    }
      return acct;
    }
    // 
}