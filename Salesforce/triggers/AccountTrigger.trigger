trigger AccountTrigger on Account (before insert, after update, before update)
{
	if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            // ApexUtilSalesforce.checkDuplicateAccByName(trigger.new);
        }
        else if (trigger.isUpdate)
        {
            // ApexTestClassLearning.AccountTickerSymbol(trigger.new, trigger.oldMap);
        }
    }
    else if (trigger.isAfter)
    {
        if (trigger.isUpdate)
        {
            // FlexaGroovy.setContactActive(trigger.new, trigger.oldMap);
        }
    }
}