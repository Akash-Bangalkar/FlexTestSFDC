@isTest
private class OpportunityControllerTest {
	@TestSetup
    private static void TestData()
    {
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today().addDays(10);
        
        Insert opp;
    }
    
    @isTest
    private static void isPrivateTrue()
    {
        List<Opportunity> oppList = [SELECT Id, IsPrivate FROM Opportunity];
        
        for (Opportunity opp : oppList)
        {
            opp.IsPrivate = true;
        }
        
        Update oppList;
    }
}