//This mothed overwrite standard approval button
global without sharing class OpportunityApprovalMatrix{

	webservice static void ApprovalMatrixMatch(Id OpportunityId){

		System.debug(LoggingLevel.INFO, '*** OpportunityId: ' + OpportunityId);

		List<Opportunity> updatedOpptyList = new List<Opportunity>();
		Set<String> countrySet = new Set<String>();
		List<Id> OpptyIds = new List<Id>();
		//get opportunity to submit to approval
		List<Opportunity> opptyList = [SELECT Id,Name,country__c,status__c,Approver1__c,Approver2__c FROM Opportunity where Id =: OpportunityId];

		//in approval porcee can assign to approval1 and approval2 to approval
		for(Opportunity opptyRec :opptyList){
			opptyRec.Approver1__c = null;
			opptyRec.Approver2__c = null;
			countrySet.add(opptyRec.Country__c);
		}
		
		List<Approval_Matrix__c> approvalMatrixList = [SELECT country__c,Approver1__c,Approver2__c from Approval_Matrix__c where Country__c IN :countrySet];

		//Different users can be approved by different Country 
		for(Opportunity opptyRec :opptyList){
			for(Approval_Matrix__c approvalMatrix : approvalMatrixList ){
				if(opptyRec.country__c == approvalMatrix.country__c){
					opptyRec.Approver1__c = approvalMatrix.Approver1__c;
					opptyRec.Approver2__c = approvalMatrix.Approver2__c;
					opptyRec.status__c = 'Open';
					updatedOpptyList.add(opptyRec);
					OpptyIds.add(opptyRec.Id);
				}
			}
		}
		update updatedOpptyList;

		list<Approval.ProcessSubmitRequest> submitOpptyList = new list<Approval.ProcessSubmitRequest>();

		for(Id oppId: OpptyIds){
			Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
			req.setComments('Submitting request for approval.');
			req.setObjectId(oppId);
			submitOpptyList.add(req);
		}
		System.debug(LoggingLevel.INFO, '*** submitOpptyList: ' + submitOpptyList);
		// submit to approval process
		Approval.process(submitOpptyList);
	}
}