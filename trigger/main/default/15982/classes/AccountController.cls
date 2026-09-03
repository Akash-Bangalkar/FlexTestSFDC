public class AccountController {
	public static void CustomFieldCheck(List<Account> accList)
    {
        for (Account acc : accList)
        {
            acc.CustomerPriority__c = 'High';
        }
    }
}