@isTest
public class AccountRevenueUpdaterTest {

    // Test method to validate the updateAccountRevenue functionality
    @isTest
    static void testUpdateAccountRevenue() {
        // Step 1: Create test Account
        Account testAccount = new Account(Name = 'Test Account');
        testAccount.AnnualRevenue = 0;
        insert testAccount;

        // Step 2: Create test Opportunities related to the Account
        Opportunity opp1 = new Opportunity(
            Name = 'Opportunity 1',
            AccountId = testAccount.Id,
            StageName = 'Closed Won',
            Amount = 5000,
            CloseDate = Date.today()
        );
        Opportunity opp2 = new Opportunity(
            Name = 'Opportunity 2',
            AccountId = testAccount.Id,
            StageName = 'Closed Won',
            Amount = 3000,
            CloseDate = Date.today()
        );
        Opportunity opp3 = new Opportunity(
            Name = 'Opportunity 3',
            AccountId = testAccount.Id,
            StageName = 'Closed Won',
            Amount = 2000,
            CloseDate = Date.today()
        );

        insert new List<Opportunity>{opp1, opp2, opp3};

        // Step 3: Verify initial AnnualRevenue (should be 0)
        testAccount = [SELECT Id, AnnualRevenue FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(0, testAccount.AnnualRevenue, 'Initial AnnualRevenue should be 0');

        // Step 4: Invoke the updateAccountRevenue method to update the AnnualRevenue
        Test.startTest();
        AccountRevenueUpdater.updateAccountRevenue(testAccount.Id);  // Correct method call with AccountId
        Test.stopTest();

        // Step 5: Verify the AnnualRevenue after the update (should be 5000 + 3000 + 2000 = 10000)
        testAccount = [SELECT Id, AnnualRevenue FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(10000, testAccount.AnnualRevenue, 'The AnnualRevenue should be updated to the sum of the Opportunity amounts');
    }

    // Additional test methods can go here, if needed.
}