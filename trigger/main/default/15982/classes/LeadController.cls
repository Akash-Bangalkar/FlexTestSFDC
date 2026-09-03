public class LeadController
{
	public static void assignSICCode(List<Lead> leadList, Map<Id, Lead> oldMap)
    {
        for (Lead rec : leadList)
        {
            if (setLeadStatus(rec.Status).equals('Working') && rec.Status != oldMap.get(rec.Id).Status)
            {
                rec.SICCode__c = '16W9006';
            }
            else if (setLeadStatus(rec.Status).equals('Closed') && rec.Status != oldMap.get(rec.Id).Status)
            {
                rec.SICCode__c = '16C8996';
            }
        }
    }
    
    private static String setLeadStatus(String status)
    {
        if (status.equals('Working - Contacted'))
        {
            return 'Working';
        }
        else if (status.equals('Closed - Converted'))
        {
            return 'Closed';
        }
        
        return 'Open';
    }
}