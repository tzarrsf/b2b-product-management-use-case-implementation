/**
 * @description       : PriceAdjustmentSchedule Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-22-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class PriceAdjustmentScheduleController extends AbstractController {

    public class MockCalloutForGetPriceAdjSchedulesByProductViaApi implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest httpRequest)
        {
            String json = '{\"currencyIsoCode\":\"USD\",\"error\":{},\"pricingLineItemResults\":[{\"error\":{},\"listPrice\":\"429.99\",\"pricebookEntryId\":\"01uHn00000gTOciIAG\",\"productId\":\"01tHn00000UQikwIAD\",\"success\":true,\"unitPrice\":\"429.99\"}],\"success\":true}';
            HttpResponse httpResponse = new HttpResponse();
            httpResponse.setHeader('Content-Type', 'application/json');
            httpResponse.setBody(json);
            httpResponse.setStatusCode(200);
            return httpResponse;
        }
    }

    /**
     * Get any Price adjustment Schedules in play by the product Id
     */
    public static List<PriceAdjustmentSchedule> getPriceAdjSchedulesByProductViaDatabase(Id productId) {
        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        String signature = debugCallSignature('getPriceAdjSchedulesByProductViaDatabase', productId);

        WebStore webStore = [
            SELECT
                Id, Name
            FROM
                WebStore
            WHERE
                Name = :AbstractController.NETWORK_NAME
            WITH
                SECURITY_ENFORCED
        ];

        // Get the products by Id
        List<Product2> products = [
            SELECT
                Id,
                Name
            FROM
                Product2
            WHERE
                Id = :productId
            WITH
                SECURITY_ENFORCED
        ];

        //Get the PriceBook by its Name
        List<Pricebook2> pricebooks = [
            SELECT
                CreatedById, CreatedDate, CurrencyIsoCode, Description, Id, IsActive, IsArchived, IsDeleted,IsStandard,
                LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Name,SystemModstamp,ValidFrom,ValidTo
            FROM
                Pricebook2
            WHERE
                Name in :AbstractController.PRICE_BOOK_NAMES
                and IsActive = True
            WITH
                SECURITY_ENFORCED
        ];

        // Get PricebookEntrys for the Products
        List<PricebookEntry> pbes = [
            SELECT
                ActivePriceAdjustmentQuantity, CreatedById, CreatedDate, CurrencyIsoCode, Id,
                IsActive, IsArchived, IsDeleted, LastModifiedById, LastModifiedDate, Name, Pricebook2Id,
                Product2Id, ProductCode, ProductSellingModelId, SystemModstamp, UnitPrice, UseStandardPrice
            FROM
                PricebookEntry
            WHERE
                Product2Id in :products
                and Pricebook2Id in: pricebooks
                and IsActive = True
            WITH
                SECURITY_ENFORCED
        ];

        // Get the PricebookEntryAdjustments for the PricebookEntrys
        List<PricebookEntryAdjustment> pbeas = [
            SELECT
                CreatedById, CreatedDate, Id, IsDeleted, LastModifiedById, LastModifiedDate, Name, PriceAdjustmentScheduleId,
                PricebookEntryId,SystemModstamp
            FROM
                PricebookEntryAdjustment
            WHERE
                PricebookEntryId in :pbes
            WITH
                SECURITY_ENFORCED
        ];

        // Get the priceAdjustmentSchedules - oddly there's no way to filter this across any of these:
        // PricebookEntryAdjustments, PricebookEntrys and Products
        List<PriceAdjustmentSchedule> priceAdjustmentSchedules = [
            SELECT
                AdjustmentMethod, CreatedById, CreatedDate, CurrencyIsoCode, Description, Id, IsActive, IsDeleted,
                LastModifiedById, LastModifiedDate, LastReferencedDate, LastViewedDate,
                Name, OwnerId, ScheduleType, SystemModstamp
            FROM
                PriceAdjustmentSchedule
            WHERE
                IsActive = True
            WITH
                SECURITY_ENFORCED
        ];

        // Get the PriceAdjustmentTier  across the priceAdjustmentSchedules, PricebookEntryAdjustments, PricebookEntrys and Products
        List<PriceAdjustmentTier> priceAdjustmentTier = [
            SELECT
                CreatedById, CreatedDate, Id, IsDeleted, LastModifiedById, LastModifiedDate,
                LowerBound, Name, PriceAdjustmentScheduleId, SystemModstamp, TierType, TierValue, UpperBound
            FROM
                PriceAdjustmentTier
            WHERE
                PriceAdjustmentScheduleId in :priceAdjustmentSchedules
            WITH
                SECURITY_ENFORCED
        ];

        debugReturn(signature, priceAdjustmentSchedules);
        return priceAdjustmentSchedules;
    }

    /**
     * Get any Price adjustment Schedules in play by the product Id
     */
    @AuraEnabled
    public static List<PriceAdjScheduleRestResponse.PricingLineItemResults> getPriceAdjSchedulesByProductViaApi(Id productId) {

        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        String signature = debugCallSignature('getPriceAdjSchedulesByProductViaApi', productId);
        Account account = AccountDetailController.getAccountInfo();

        WebStore webStore = [
            SELECT
                Id, Name
            FROM
                WebStore
            WHERE
                Name = :AbstractController.NETWORK_NAME
            WITH
                SECURITY_ENFORCED
        ];

        // Make a clean result variable to favor return of empty array over null
        List<PriceAdjScheduleRestResponse.PricingLineItemResults> result = new List<PriceAdjScheduleRestResponse.PricingLineItemResults>();

        // Get the products by Id
        List<Product2> products = [
            SELECT
                Id, Name
            FROM
                Product2
            WHERE
                Id = :productId
            WITH
                SECURITY_ENFORCED
        ];

        // Get PriceBooks by Name
        List<Pricebook2> pricebooks = [
            SELECT
                CreatedById, CreatedDate, CurrencyIsoCode, Description, Id, IsActive, IsArchived, IsDeleted,
                IsStandard,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Name,SystemModstamp,ValidFrom,ValidTo
            FROM
                Pricebook2
            WHERE
                Name in :AbstractController.PRICE_BOOK_NAMES
                and IsActive = True
            WITH
                SECURITY_ENFORCED
        ];

        // Get PricebookEntrys for the Products
        List<PricebookEntry> pbes = [
            SELECT
                ActivePriceAdjustmentQuantity, CreatedById, CreatedDate, CurrencyIsoCode, Id,
                IsActive, IsArchived, IsDeleted, LastModifiedById, LastModifiedDate, Name, Pricebook2Id, Product2Id, ProductCode,
                ProductSellingModelId, SystemModstamp, UnitPrice, UseStandardPrice
            FROM
                PricebookEntry
            WHERE
                Product2Id in :products
                and Pricebook2Id in: pricebooks
                and IsActive = True
            WITH
                SECURITY_ENFORCED
        ];

        PriceAdjScheduleRestResponse restResponse;

        BaseRestUtility baseRestUtility = (Test.isRunningTest()) ? new BaseRestUtility(new MockCalloutForGetPriceAdjSchedulesByProductViaApi()) : new BaseRestUtility();
        String uri = AbstractController.BASE_URI + '/services/data/v' + AbstractController.API_VERSION_FOR_REST +
        '/commerce/webstores/' + webStore.Id +
        '/pricing/products?' +
        'effectiveAccountId=' + account.Id +
        '&productIds=' + productId;
        String json = baseRestUtility.handleHttpGetRequest(uri);
        restResponse = PriceAdjScheduleRestResponse.parse(json);
        Assert.isNotNull(restResponse, 'null restResponse!');
        Assert.isNotNull(restResponse.pricingLineItemResults, 'null pricingLineItemResults!');
        Assert.isTrue(restResponse.pricingLineItemResults.size() > 0, 'No pricingLineItemResults!');
        result = restResponse.pricingLineItemResults;

        debugReturn(signature, result);
        return result;
    }
}