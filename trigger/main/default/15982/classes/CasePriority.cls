public class CasePriority
{
	public static void HandleCasePriority(List<Case> csList, Map<Id, Case> oldMap)
    {
		for (Case cs : csList)
        {
            if (oldMap == null || cs.Origin != oldMap.get(cs.Id).Origin) // Record Creation + Update
            {
                if (cs.Origin == 'Phone')
                {
                    cs.Priority = 'High';
                }
                else if (cs.Origin == 'Email' || cs.Origin == 'Web')
                {
                    cs.Priority = 'Medium';
                }
            }
        }
    }
}