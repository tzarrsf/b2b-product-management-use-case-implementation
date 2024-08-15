/**
 * @description       : Unit Tests for the PriceAdjustmentSchedule Controller - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-22-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
private class PriceAdjustmentScheduleController_Tests {

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the product entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    static void testGetPriceAdjSchedulesByProductViaDatabase() {
        Test.startTest();

        Product2 product = ProductController.getProductByNameViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAME_WITH_PRICE_SCHEDULE);
        List<PriceAdjustmentSchedule> priceAdjustmentSchedules = PriceAdjustmentScheduleController.getPriceAdjSchedulesByProductViaDatabase(product.Id);
        System.assert(priceAdjustmentSchedules.size() > 0);

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the product entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    static void testGetPriceAdjSchedulesByProductViaApi() {
        Test.startTest();

        Product2 product = ProductController.getProductByNameViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAME_WITH_PRICE_SCHEDULE);
        List<PriceAdjScheduleRestResponse.PricingLineItemResults> priceAdjustmentSchedules = PriceAdjustmentScheduleController.getPriceAdjSchedulesByProductViaApi(product.Id);
        System.assert(priceAdjustmentSchedules.size() > 0);

        Test.stopTest();
    }
}