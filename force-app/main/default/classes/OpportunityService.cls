public with sharing class OpportunityService
{
    public static void handleClosedWonOpportunities(List<Opportunity> oppList) {
        List<Account> accountsToUpdate = new List<Account>();
        List<Case> casesToInsert = new List<Case>();

        Set<Id> accountIds = new Set<Id>();

        for (Opportunity opp : oppList) {
            if (opp.StageName == 'Closed Won' && opp.AccountId != null) {
                accountIds.add(opp.AccountId);

                // Create onboarding case
                Case cs = new Case();
                cs.Subject = 'Onboarding for Opportunity: ' + opp.Name;
                cs.Status = 'New';
                cs.Priority = 'High';
                cs.AccountId = opp.AccountId;
                casesToInsert.add(cs);
            }
        }

        if (!accountIds.isEmpty()) {
            for (Account acc : [
                SELECT Id, Industry
                FROM Account
                WHERE Id IN :accountIds
            ]) {
                acc.Industry = 'Technology';
                accountsToUpdate.add(acc);
            }
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }

        if (!casesToInsert.isEmpty()) {
            insert casesToInsert;
        }
    }
}