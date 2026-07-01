trigger TopologyTrigger on Topology__c (before insert, before update, before delete) {
	if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            OpportunityController.updateTopologyDescription(trigger.new);
        }
        else if (trigger.isUpdate)
        {
            OpportunityController.updateTopologyDescription(trigger.new);
        }
    }
}