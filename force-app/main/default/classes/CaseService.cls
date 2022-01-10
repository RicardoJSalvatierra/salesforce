public with sharing class CaseService {
   public static void closeCases(Set<Id> caseIds, string closeReason) {
        // Validate parameters
        if(caseIds==null || caseIds.size()==0)
            throw new CaseServiceException('Case not specified.');
        if(closeReason=='' || closeReason==null)
            throw new CaseServiceException('Invalid Reason to apply.');
        // Query Opportunities and Lines (SOQL inlined for this example, see Selector pattern in later module)
        list<Case> cases = [select id from Case where ID in :caseIds];
        List<Case> casesToClose = new List<Case>();
        //Close the cases
       for(Case casestodel : cases){
           if(casestodel.Id!=null && closeReason!=null){
               casestodel.Status = 'closed';
               casestodel.Reason = closeReason;
               casesToClose.add(casestodel);
           }
       }
        // Update the database
        SavePoint sp = Database.setSavePoint();
        try {
			update casesToClose;
        } catch (Exception e) {
            // Rollback
            Database.rollback(sp);
            // Throw exception on to caller
            throw e;
        }       
    }
    public class CaseServiceException extends Exception {} 
}