public with sharing class IdeaController {
    @AuraEnabled
    public static Idea__c createIdeaLWC(Idea__c newIdea){

        insert newIdea;
            
		return newIdea;            
    }
}