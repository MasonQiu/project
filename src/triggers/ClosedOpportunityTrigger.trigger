trigger ClosedOpportunityTrigger on Opportunity(after insert,after update) {
	private List<Task>  taskList = new List<Task>();
    if(trigger.isInsert || trigger.isUpdate){
    	for(Opportunity oppy : trigger.new){
    		if(oppy.StageName == 'Closed Won'){
    			 Task newTask = new Task();
    			 newTask.Subject = 'Follow Up Test Task';
    			 newTask.WhatId = oppy.Id;
    			 taskList.add(newTask);
    		}
    	}
    	if(!taskList.isEmpty()){
    		insert taskList;
    	}
    	
    }
}