trigger AccountAddressTrigger on Account(before insert,before update) {
    if(trigger.isInsert || trigger.isUpdate){
    	for(Account acct : trigger.new){
    		if(acct.Match_Billing_Address__c && string.isNotBlank(acct.BillingPostalCode)){
    			 acct.ShippingPostalCode = acct.BillingPostalCode;
    		}
    	}
    	
    }
}