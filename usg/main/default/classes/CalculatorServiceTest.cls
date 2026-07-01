@isTest
public class CalculatorServiceTest {
    
    @isTest
    static void testAddNumbers() {
        Integer result = CalculatorService.addNumbers(10, 20);
        System.assertEquals(30, result);
    }
    
    @isTest
    static void testIsEven() {
        System.assertEquals(true, CalculatorService.isEven(4));
        System.assertEquals(false, CalculatorService.isEven(5));
    }
    
    @isTest
    static void testGetGrade() {
        System.assertEquals('A', CalculatorService.getGrade(95));
        System.assertEquals('B', CalculatorService.getGrade(80));
        System.assertEquals('C', CalculatorService.getGrade(60));
        System.assertEquals('Fail', CalculatorService.getGrade(30));
    }
}