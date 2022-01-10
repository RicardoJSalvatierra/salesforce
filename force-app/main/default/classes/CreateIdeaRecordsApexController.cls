public class CreateIdeaRecordsApexController {

    
    public String ideaName { get; set; }
    public String ideaComment { get; set; }

    public CreateIdeaRecordsApexController() {
        this.ideaName = 'Idea Test';
        this.ideaComment = 'Idea Comment Test';
    }

    public void createIdea() {

        Idea__c newIdea = new Idea__c(
            Name = ideaName,
            Description__c = 'Description test'
        );
        insert newIdea;
    }
    
    @AuraEnabled
    public static Idea__c createIdeaLWC(Idea__c newIdea){

        insert newIdea;
            
		return newIdea;
            
    }
}