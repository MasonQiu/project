trigger LeadTrigger on Lead (before insert, before update, after insert, after update) {
	

// 	// System.debug(LoggingLevel.INFO, 'isRunTrigger ' + InitializeUtility.isRunTrigger);


//     if(trigger.isBefore){

//     	// System.debug(LoggingLevel.INFO, '*** test_order__c: ' + trigger.new[0].test_order__c);
        
//         if(trigger.isInsert){
//             System.debug(LoggingLevel.INFO, '*** Before Insert: ');
//             // System.debug(LoggingLevel.INFO, '*** Formula_for_Trigger__c0: ' + trigger.new[0].Formula_for_Trigger__c);
//             for (lead currentlead : trigger.new) {
//                 // System.debug(LoggingLevel.INFO, '*** currentleadID: ' + currentlead.Id);

//                 if(String.isEmpty(currentlead.Update_by_Trigger__c)){
//                     currentlead.Update_by_Trigger__c = 'update by trigger';
//                 }else if(currentlead.Update_by_Trigger__c == 'update by workflow'){
//                     currentlead.Update_by_Trigger__c = 'update by trigger after workflow';
//                 }else if(currentlead.Update_by_Trigger__c == 'update by process'){
//                     currentlead.Update_by_Trigger__c = 'update by trigger after process';
//                 }



//                 System.debug(LoggingLevel.INFO, '***Formula_for_Trigger__c: ' + currentlead.Formula_for_Trigger__c);
//                 // else if(currentlead.test_order__c == 'update by process' ){
//                 //  currentlead.test_order__c = 'update by trigger2';
//                 // } 
//             }
//             // System.debug(LoggingLevel.INFO, '*** Formula_for_Trigger__c1: ' + trigger.new[0].Formula_for_Trigger__c);
//         }

//     	if(trigger.isUpdate){
//             System.debug(LoggingLevel.INFO, '*** Before Update: ');

//     		// System.debug(LoggingLevel.INFO, '*** new Title: ' + trigger.new[0].Title);
//     		// System.debug(LoggingLevel.INFO, '*** old Title: ' + trigger.old[0].Title);
//     		// System.debug(LoggingLevel.INFO, '*** new Phone: ' + trigger.new[0].Phone);
//     		// System.debug(LoggingLevel.INFO, '*** old Phone: ' + trigger.old[0].Phone);
//     		// System.debug(LoggingLevel.INFO, '*** new test_order__c: ' + trigger.new[0].test_order__c);
//     		// System.debug(LoggingLevel.INFO, '*** old test_order__c: ' + trigger.old[0].test_order__c);
//       //       System.debug(LoggingLevel.INFO, '*** Formula_for_Trigger__c3: ' + trigger.new[0].Formula_for_Trigger__c);
//     	}
        
//     }

//     if(trigger.isAfter){
        
//         if(trigger.isInsert){
//             System.debug(LoggingLevel.INFO, '*** After Insert: ');
//             for (lead currentlead : trigger.new) {
//                 if(String.isEmpty(currentlead.test_order__c)){
//                     currentlead.test_order__c = 'update by trigger';



                    
//                 }
//             }
//         }

//         if(trigger.isUpdate){
//             System.debug(LoggingLevel.INFO, '*** After Update: ');
//         }
       
//     }

//    // InitializeUtility.isRunTrigger = false;
//    // System.debug(LoggingLevel.INFO, 'isRunTrigger2' + InitializeUtility.isRunTrigger);
    
}