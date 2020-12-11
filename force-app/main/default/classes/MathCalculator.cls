public class MathCalculator {
    
    public static void blah(){
        system.debug('stuff');
    }
    private static Integer add(Integer a, Integer b){
        return a + b;
    }
    
    private static Integer multiply(Integer a, Integer b){
        return a*b;
    }
    
    public static void printOutput(Integer a, Integer b, String math){
        
        if(math == 'add'){
            system.debug(add(a, b));
        }
        else if(math == 'multiply'){
            system.debug(multiply(a, b));
        }
  
    }
}