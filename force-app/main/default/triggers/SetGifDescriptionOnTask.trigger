trigger SetGifDescriptionOnTask on Task (after insert) {
    for(Task myTask : Trigger.new){
        if (myTask.Type == 'Success Gift'){
			GetGif.getThegif(myTask.id);
        }
        
    } 
}