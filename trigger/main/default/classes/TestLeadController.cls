@isTest // (testFor="ApexClass:LeadController, ApexTrigger:LeadTrigger")
private class TestLeadController
{
    @testSetup
    private static void leadRecords()
    {
        // LEAD RECORD 1
        Lead record1 = new Lead();
        record1.Salutation = 'Mr.';
        record1.FirstName = 'Sriniwas';
        record1.LastName = 'Wagle';
        record1.Company = 'Test Salesforce';
        record1.Status = 'Open - Not Contacted';
        
        Insert record1;
    }
    
    @isTest
    private static void testUseCase1() // Working - Contacted
    {
        Lead leadRecord = [SELECT Id, Status FROM Lead LIMIT 1];
        leadRecord.Status = 'Working - Contacted';
        
        test.startTest();
        Update leadRecord;
        test.stopTest();
        
        String sicCode = [SELECT SICCode__c FROM Lead LIMIT 1].SICCode__c;
        
        System.assertEquals('16W9006', sicCode);
    }
    
    @isTest
    private static void testUseCase2() // Closed - Converted
    {
        Lead leadRecord = [SELECT Id, Status FROM Lead LIMIT 1];
        leadRecord.Status = 'Closed - Converted';
        
        test.startTest();
        Update leadRecord;
        test.stopTest();
        
        String sicCode = [SELECT SICCode__c FROM Lead LIMIT 1].SICCode__c;
        
        System.assertEquals('16C8996', sicCode);
    }
    
    @isTest
    private static void testUseCase3() // Closed - Not Converted
    {
        Lead leadRecord = [SELECT Id, Status FROM Lead LIMIT 1];
        leadRecord.Status = 'Closed - Not Converted';
        
        test.startTest();
        Update leadRecord;
        test.stopTest();
        
        String sicCode = [SELECT SICCode__c FROM Lead LIMIT 1].SICCode__c;
        
        System.assertEquals(null, sicCode);
    }
}