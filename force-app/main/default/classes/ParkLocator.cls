public class ParkLocator {
    public static List<String> Country(String ctry){
        ParkService.ParksImplPort parksByCountry = new ParkService.ParksImplPort();
        //List<String> parks = parksByCountry.byCountry(ctry);
        //system.debug('parks:');
        //system.debug(parks);
        
        return parksByCountry.byCountry(ctry);
    }
}