@isTest
private class ApexTestClassLearningTest
{
    @isTest
	private static void additionTest()
    {
        Test.startTest();
        // actual result
        integer result = ApexTestClassLearning.addition(2, 10);
        Test.stopTest();
        
        // expected result
        integer res = 2 + 10;
        
        System.assertEquals(res, result);
    }
    
    @testSetup
    private static void AccountRecords()
    {
        Account acc = new Account();
        acc.Name = 'ApexTestClassLearning Account';
        
        Insert acc;
    }
    
    @isTest
    private static void AccountTickerSymbolTestCase1() // Hot
    {
        Account accRecord = [SELECT Id, Rating FROM Account LIMIT 1];
        accRecord.Rating = 'Hot';
        
        Test.startTest();
        Update accRecord;
        Test.stopTest();
        
        // expected and actual
        String expTS = 'H';
        String actualTS = [SELECT TickerSymbol FROM Account LIMIT 1].TickerSymbol;
        
        System.assertEquals(expTS, actualTS);
    }
    
    @isTest
    private static void AccountTickerSymbolTestCase2() // Cold
    {
        Account accRecord = [SELECT Id, Rating FROM Account LIMIT 1];
        accRecord.Rating = 'Cold';
        
        Test.startTest();
        Update accRecord;
        Test.stopTest();
        
        // expected and actual
        String expTS = 'C';
        String actualTS = [SELECT TickerSymbol FROM Account LIMIT 1].TickerSymbol;
        
        System.assertEquals(expTS, actualTS);
    }
    
    @isTest
    private static void AccountTickerSymbolTestCase3() // Warm
    {
        Account accRecord = [SELECT Id, Rating FROM Account LIMIT 1];
        accRecord.Rating = 'Warm';
        
        Test.startTest();
        Update accRecord;
        Test.stopTest();
        
        // expected and actual
        String expTS = 'W';
        String actualTS = [SELECT TickerSymbol FROM Account LIMIT 1].TickerSymbol;
        
        System.assertEquals(expTS, actualTS);
    }
}