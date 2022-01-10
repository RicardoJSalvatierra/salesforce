public with sharing class CreateIdeaRecordsApexControllerLwc {
    @AuraEnabled
    public static void createIdea(
        String ideaName

    ) {
        try {
            Idea__c newIdea = new Idea__c(
                Name = IdeaName
            );
            insert newIdea;

        } catch (Exception e) {
            throw new MyException(e.getMessage());
        }
    }

}