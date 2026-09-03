@isTest
public class CasePriorityTest
{
    @testSetup
	public static void TestData()
    {
        Case cs = New Case();
        cs.Origin = 'Web';
        // cs.Priority = 'Medium';
        cs.Subject = 'TestingUseCase1';
        Insert cs;
        
        Case cs2 = New Case();
        cs2.Origin = 'Phone';
        // cs2.Priority = 'High';
        cs2.Subject = 'TestingUseCase2';
        Insert cs2;
    }
    
    @isTest
    public static void TestCase1() // While creation of Case Record if the Origin is Phone then Priority Should be High
    {
        Case cs = New Case();
        cs.Origin = 'Phone';
        cs.Subject = 'TestCase1';
        
        Test.startTest();
        Insert cs;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestCase1' LIMIT 1];
        System.assertEquals('High', csRecord.Priority);
    }
    
    @isTest
    public static void TestCase2() // While creation of Case Record if the Origin is Email then Priority Should be Medium
    {
        Case cs = New Case();
        cs.Origin = 'Email';
        cs.Subject = 'TestCase2';
        
        Test.startTest();
        Insert cs;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestCase2' LIMIT 1];
        System.assertEquals('Medium', csRecord.Priority);
    }
    
    @isTest
    public static void TestCase3() // While creation of Case Record if the Origin is Web then Priority Should be Medium
    {
        Case cs = New Case();
        cs.Origin = 'Web';
        cs.Subject = 'TestCase3';
        
        Test.startTest();
        Insert cs;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestCase3' LIMIT 1];
        System.assertEquals('Medium', csRecord.Priority);
    }
    
    @isTest
    public static void TestCase4() // While updating Case Record if the Origin is Phone then Priority Should be High
    {
        List<Case> csList = [SELECT Id, Origin FROM Case WHERE Origin != 'Phone']; // 1 Record
        
        for (Case record : csList)
        {
            record.Origin = 'Phone';
        }
        
        Test.startTest();
        Update csList;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestingUseCase1' LIMIT 1];
        System.assertEquals('High', csRecord.Priority);
    }
    
    @isTest
    public static void TestCase5() // While updating Case Record if the Origin is Email then Priority Should be Medium
    {
        List<Case> csList = [SELECT Id, Origin FROM Case WHERE Priority != 'Medium']; // 1 Record
        
        for (Case record : csList)
        {
            record.Origin = 'Email';
        }
        
        Test.startTest();
        Update csList;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestingUseCase2' LIMIT 1];
        System.assertEquals('Medium', csRecord.Priority);
    }
    
    @isTest
    public static void TestCase6() // While updating Case Record if the Origin is Web then Priority Should be Medium
    { 
        List<Case> csList = [SELECT Id, Origin FROM Case WHERE Priority != 'Medium']; // 1 Record
        
        for (Case record : csList)
        {
            record.Origin = 'Web';
        }
        
        Test.startTest();
        Update csList;
        Test.stopTest();
        
        Case csRecord = [SELECT Id, Priority FROM Case WHERE Subject = 'TestingUseCase2' LIMIT 1];
        System.assertEquals('Medium', csRecord.Priority);
    }
}