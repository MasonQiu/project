global class BatchUpdateAccountNameSchJob implements Schedulable{
   global void execute(SchedulableContext sc) {
		database.executebatch(new BatchUpdateAccountName());
	}
}