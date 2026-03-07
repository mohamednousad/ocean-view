package service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class BillingServiceTest {

    private final BillingService billingService = new BillingService();

    @Test
    void testCalculateTotalStandard() {
        long total = billingService.calculateTotal("2026-03-10", "2026-03-12", "Standard");
        assertEquals(10000, total);
    }

    @Test
    void testCalculateTotalDeluxe() {
        long total = billingService.calculateTotal("2026-03-10", "2026-03-12", "Deluxe");
        assertEquals(16000, total);
    }

    @Test
    void testCalculateTotalSuite() {
        long total = billingService.calculateTotal("2026-03-10", "2026-03-12", "Suite");
        assertEquals(24000, total);
    }

    @Test
    void testCalculateTotalSameDay() {
        long total = billingService.calculateTotal("2026-03-10", "2026-03-10", "Standard");
        assertEquals(5000, total);
    }

    @Test
    void testGetDaysMultiple() {
        long days = billingService.getDays("2026-03-10", "2026-03-15");
        assertEquals(5, days);
    }

    @Test
    void testGetDaysSameDay() {
        long days = billingService.getDays("2026-03-10", "2026-03-10");
        assertEquals(1, days);
    }

    @Test
    void testGetRateStandard() {
        assertEquals(5000, billingService.getRate("Standard"));
    }

    @Test
    void testGetRateDeluxe() {
        assertEquals(8000, billingService.getRate("Deluxe"));
    }

    @Test
    void testGetRateSuite() {
        assertEquals(12000, billingService.getRate("Suite"));
    }
}