@isTest
public class OpportunityServiceTest
{
    @testSetup
    static void setupData() {
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(10),
            AccountId = acc.Id
        );
        insert opp;
    }

    @isTest
    static void testClosedWonCreatesCaseAndUpdatesAccount() {

        Account acc = [SELECT Id FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id, StageName FROM Opportunity LIMIT 1];

        opp.StageName = 'Closed Won';

        Test.startTest();
        update opp;
        Test.stopTest();

        // Verify Account update
        Account updatedAcc = [
            SELECT Industry
            FROM Account
            WHERE Id = :acc.Id
        ];
        System.assertEquals('Technology', updatedAcc.Industry);

        // Verify Case creation
        List<Case> cases = [
            SELECT Id, Subject, AccountId
            FROM Case
            WHERE AccountId = :acc.Id
        ];

        System.assertEquals(1, cases.size());
        System.assert(cases[0].Subject.contains('Onboarding'));
    }

    @isTest
    static void testNoActionWhenNotClosedWon() {

        Account acc = [SELECT Id FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];

        opp.StageName = 'Qualification';

        Test.startTest();
        update opp;
        Test.stopTest();

        Account updatedAcc = [
            SELECT Industry
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals(null, updatedAcc.Industry);

        List<Case> cases = [
            SELECT Id FROM Case WHERE AccountId = :acc.Id
        ];

        System.assertEquals(0, cases.size());
    }
}