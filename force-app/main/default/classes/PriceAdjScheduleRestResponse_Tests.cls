/**
 * @description       : Tests for the object representation for the endpoint at: /commerce/webstores/webstoreId/pricing/products/productId
 * 						Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class PriceAdjScheduleRestResponse_Tests {
    // This test method should give 100% coverage
	@IsTest
    static void testParse() {
		String json = '{\"currencyIsoCode\":\"USD\",\"error\":{},\"pricingLineItemResults\":[{\"error\":{},\"listPrice\":\"429.99\",\"pricebookEntryId\":\"01uHn00000gTOciIAG\",\"productId\":\"01tHn00000UQikwIAD\",\"success\":true,\"unitPrice\":\"429.99\"}],\"success\":true}';
		PriceAdjScheduleRestResponse r = PriceAdjScheduleRestResponse.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		PriceAdjScheduleRestResponse.Error objError = new PriceAdjScheduleRestResponse.Error(System.JSON.createParser(json));
		System.assert(objError != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		PriceAdjScheduleRestResponse.PricingLineItemResults objPricingLineItemResults = new PriceAdjScheduleRestResponse.PricingLineItemResults(System.JSON.createParser(json));
		System.assert(objPricingLineItemResults != null);
		System.assert(objPricingLineItemResults.error == null);
		System.assert(objPricingLineItemResults.listPrice == null);
		System.assert(objPricingLineItemResults.pricebookEntryId == null);
		System.assert(objPricingLineItemResults.productId == null);
		System.assert(objPricingLineItemResults.success == null);
		System.assert(objPricingLineItemResults.unitPrice == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		PriceAdjScheduleRestResponse objPriceAdjustmentScheduleConnectAp = new PriceAdjScheduleRestResponse(System.JSON.createParser(json));
		System.assert(objPriceAdjustmentScheduleConnectAp != null);
		System.assert(objPriceAdjustmentScheduleConnectAp.currencyIsoCode == null);
		System.assert(objPriceAdjustmentScheduleConnectAp.error == null);
		System.assert(objPriceAdjustmentScheduleConnectAp.pricingLineItemResults == null);
		System.assert(objPriceAdjustmentScheduleConnectAp.success == null);
	}
}