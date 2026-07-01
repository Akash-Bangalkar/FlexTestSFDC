trigger CaseTrigger on Case (after update, before insert, before update) {
	if (trigger.isAfter)
    {
        if (trigger.isUpdate)
        {
            CaseForward.updateCurrentCase(trigger.new, trigger.oldMap);
        }
    }
    else if (trigger.isBefore)
    {
        if (trigger.isInsert)
        {
            CasePriority.HandleCasePriority(trigger.new, trigger.oldMap);
        }
        else if (trigger.isUpdate)
        {
            CasePriority.HandleCasePriority(trigger.new, trigger.oldMap);
        }
    }
}