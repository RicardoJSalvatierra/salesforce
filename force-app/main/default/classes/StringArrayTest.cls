public class StringArrayTest {

    public static List<string> generateStringArray(integer value){
        List<string> test = new List<string>{};
        
        for(Integer i=0;i<value;i++) {
            // Write value to the debug log
            
            test.add('Test ' + i);
            
            System.debug(test[i]);
        }
        
        return test;
    }
    
}