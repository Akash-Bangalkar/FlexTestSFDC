trigger LeadTrigger on Lead (before update)
{
	if (trigger.isBefore)
    {
        if (trigger.isUpdate)
        {
            LeadController.assignSICCode(trigger.new, trigger.oldMap);
        }
    }
}