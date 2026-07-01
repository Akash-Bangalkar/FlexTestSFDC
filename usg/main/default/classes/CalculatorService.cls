public class CalculatorService {
    
    // Method to add two numbers
    // Test Comment 26-06
    public static Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }
    
    // Method to check if a number is even
    public static Boolean isEven(Integer num) {
        return (math.mod(num, 2) == 0);
    }
    
    // Method with conditional logic
    public static String getGrade(Integer marks) {
        if (marks >= 90) {
            return 'A';
        } else if (marks >= 75) {
            return 'B';
        } else if (marks >= 50) {
            return 'C';
        } else {
            return 'Fail';
        }
    }
}