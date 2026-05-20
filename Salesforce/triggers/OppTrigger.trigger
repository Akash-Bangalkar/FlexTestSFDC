trigger OppTrigger on Opportunity (after update)
{
	/*
    if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            OpportunityController.updateDeliveryStatus(trigger.new, trigger.oldMap);
        }
        else if (trigger.isUpdate)
        {
            OpportunityController.updateDeliveryStatus(trigger.new, trigger.oldMap);
            FlexaGroovy.setTickerSymbol();
            // CaseForward.main();
        }
    }
	*/
    List<Opportunity> closedWonOpps = new List<Opportunity>();

    for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

        if (opp.StageName == 'Closed Won' &&
            oldOpp.StageName != 'Closed Won') {
            closedWonOpps.add(opp);
        }
    }

    if (!closedWonOpps.isEmpty()) {
        OpportunityService.handleClosedWonOpportunities(closedWonOpps);
    }
}