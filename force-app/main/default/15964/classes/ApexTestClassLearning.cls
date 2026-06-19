public class ApexTestClassLearning
{
	public static integer addition(integer x, integer y)
    {
        return x + y;
    }
    
    public static void AccountTickerSymbol(List<Account> accList, Map<Id, Account> oldMap)
    {
        // IF RATING IS HOT - H
        for (Account rec : accList)
        {
            if (rec.Rating.equals('Hot') && rec.Rating != oldMap.get(rec.Id).Rating)
            {
                rec.TickerSymbol = 'H';
            }
            else if (rec.Rating.equals('Warm') && rec.Rating != oldMap.get(rec.Id).Rating)
            {
                rec.TickerSymbol = 'W';
            }
            else if (rec.Rating.equals('Cold') && rec.Rating != oldMap.get(rec.Id).Rating)
            {
                rec.TickerSymbol = 'C';
            }
        }
    }
    
    public static void displayRandomAccount()
    {
        List<Account> accList = [SELECT Id, Name FROM Account];
        
        // Integer randomNumber = (Integer)(Math.random() * accList.size());
        // Generate a random index between 0 and accList.size() - 1;
    	Integer randomNumber = Math.mod(Math.abs(Crypto.getRandomInteger()), accList.size());
        
        System.debug(randomNumber);
    }
}