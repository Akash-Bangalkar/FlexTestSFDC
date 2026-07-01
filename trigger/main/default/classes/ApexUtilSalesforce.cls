public class ApexUtilSalesforce
{
	public static String getRating(String accName)
    {
        String accRating;
        
        for (Account acc : [SELECT Id, Name, Rating FROM Account WHERE Name =: accName LIMIT 1])
        {
            accRating = acc.Rating;
        }
        
        return accRating;
    }
    
    public static void checkDuplicateAccByName(List<Account> accList)
    { 
        String accName;
        
        for (Account acc : accList)
        {
            accName = acc.Name;
        }
        
        List<Account> extAccount = [SELECT Id, Name FROM Account WHERE Name = :accName];
        
        if (extAccount.size() > 0)
        {
            for (Account acc : accList)
            {
                acc.Name.addError('DUPLICATE ACCOUNT NAME');
            }
        }
    }
}