package service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class BillingService {

    public long calculateTotal(String checkInStr, String checkOutStr, String roomType) {
        LocalDate in = LocalDate.parse(checkInStr);
        LocalDate out = LocalDate.parse(checkOutStr);

        long days = ChronoUnit.DAYS.between(in, out);
        if (days == 0) days = 1; 

        int rate = 0;
        switch (roomType) {
            case "Standard": rate = 5000; break;
            case "Deluxe": rate = 8000; break;
            default: rate = 12000; 
        }

        return days * rate;
    }
    
    public long getDays(String checkInStr, String checkOutStr) {
        LocalDate in = LocalDate.parse(checkInStr);
        LocalDate out = LocalDate.parse(checkOutStr);
        long days = ChronoUnit.DAYS.between(in, out);
        return (days == 0) ? 1 : days;
    }
    
    public int getRate(String roomType) {
        switch (roomType) {
            case "Standard": return 5000;
            case "Deluxe": return 8000;
            default: return 12000;
        }
    }
}