@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {
    @HttpPost
    global static void closeCase(string reason) {
        //parse the context
        RestRequest request = RestContext.request;
        String[] uriParts = request.requestURI.split('/');
        Id opportunityId = uriParts[2];
        // Call the service
		CaseService.closeCases(new Set<ID> { opportunityId }, reason);
    }  
}