public class OpportunityController {
	public static void updateDeliveryStatus(List<Opportunity> oppList, Map<Id, Opportunity> oldMap)
    {
        for (Opportunity opp : oppList)
        {
            if (opp.IsPrivate && oldMap == null)
            {
                opp.DeliveryInstallationStatus__c = 'Completed';
            }
            else if (opp.IsPrivate & opp.IsPrivate != oldMap.get(opp.Id).isPrivate)
            {
                opp.DeliveryInstallationStatus__c = 'Completed';
            }
            else if (opp.IsPrivate == false && oldMap == null)
            {
                opp.DeliveryInstallationStatus__c = 'Yet to begin';
            }
            else if (opp.IsPrivate == false & opp.IsPrivate != oldMap.get(opp.Id).isPrivate)
            {
                opp.DeliveryInstallationStatus__c = 'Yet to begin';
            }
        }
    }
    
    public static void updateTopologyDescription(List<Topology__c> topoList)
    {
        for (Topology__c topo : topoList)
        {
            if (topo.Opportunity__c == null)
            {
                topo.Description__c = 'NO OPPORTUNITY SELECTED';
            }
            else if (topo.Opportunity__c != null)
            {
                topo.Description__c = 'OPPORTUNITY IS SELECTED.';
            }
        }
    }
    
    public static void AccountStatusNumber(List<AccountStatus__c> accStatus)
    {
        
    }
}