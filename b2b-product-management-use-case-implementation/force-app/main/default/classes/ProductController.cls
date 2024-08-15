/**
 * @description       : Product Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-07-2023
 * @last modified on  : 09-07-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class ProductController extends AbstractController {

    public class MockCalloutForGetProductsBySkusViaApi implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest httpRequest)
        {
            HttpResponse httpResponse = new HttpResponse();
            httpResponse.setHeader('Content-Type', 'application/json');
            String json = '{'+
            '  \"products\" : [ {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-28T16:59:05Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"Introducing the Prosumer Elite Coffee Machine, the epitome of luxury and precision in coffee brewing. Engineered to cater to the most discerning coffee enthusiasts, this high-end masterpiece combines cutting-edge technology with exquisite craftsmanship to deliver an unparalleled coffee experience.\\n\\nThe Prosumer Elite is designed to elevate your home brewing to professional levels. Equipped with a state-of-the-art dual boiler system and advanced temperature control, it ensures optimal extraction and perfect milk frothing, allowing you to create barista-quality beverages with ease. Whether you crave a rich espresso shot, a velvety cappuccino, or a silky latte, the Prosumer Elite is your gateway to crafting coffee perfection.\\n\\nUncompromising on quality, this coffee machine boasts a sleek and elegant stainless steel body, showcasing its premium aesthetics. The intuitive touch-screen interface provides effortless control over a range of customizable settings, allowing you to tailor your coffee to your precise taste preferences. From adjusting the brew strength to fine-tuning the water temperature and pre-infusion duration, every aspect of your coffee can be meticulously tailored to perfection.\\n\\nThe Prosumer Elite prioritizes convenience without sacrificing performance. Its spacious water reservoir and large bean hopper ensure extended brewing sessions without frequent refills. The integrated grinder features precision burrs that grind your coffee beans to perfection, unlocking their full flavor potential. With the ability to store multiple user profiles, the Prosumer Elite effortlessly adapts to the unique preferences of each coffee lover in your household.\\n\\nSafety and durability are paramount, which is why the Prosumer Elite is built to withstand the test of time. The machine incorporates top-quality components and a robust construction that guarantees years of reliable performance. Additionally, a range of smart features, such as automatic cleaning cycles and descaling reminders, ensure hassle-free maintenance and longevity.\\n\\nExperience the ultimate in coffee brewing with the Prosumer Elite Coffee Machine. Designed for those who demand nothing less than perfection, it is a testament to precision, craftsmanship, and the pursuit of coffee excellence. Elevate your coffee rituals and indulge in a sensory journey like no other with the Prosumer Elite.\",'+
            '      \"ProductCode\" : \"PROSE\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-07-28T22:38:14Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-07-28T22:38:14Z\",'+
            '      \"StockKeepingUnit\" : \"PROSE\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"Prosumer Elite\",'+
            '      \"SystemModstamp\" : \"2023-07-29T01:36:26Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfqf\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-28T00:04:33Z\",'+
            '      \"Family\" : null,'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfqf\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000U73YkIAJ\",'+
            '    \"sku\" : \"PROSE\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The ultimate in coffee making luxury. Create up to three gourmet coffees at the same time. Granular control of the froth and foaminess. Can create a coffee in under 60 minutes\",'+
            '      \"ProductCode\" : \"B-C-COFMAC-001\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:23:31Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:23:31Z\",'+
            '      \"StockKeepingUnit\" : \"B-C-COFMAC-001\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"Bella Chrome Coffee Machine (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Commercial\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQiksIAD\",'+
            '    \"sku\" : \"B-C-COFMAC-001\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The future of espressos is now. The fully connected, intelligent EspresSmart Espresso Machine not only provides the most consistent pours of any of our machines, but it tell you when it needs filter replacements, repairs and cleaning.\",'+
            '      \"ProductCode\" : \"ESP-IOT-1\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:22:58Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:22:58Z\",'+
            '      \"StockKeepingUnit\" : \"ESP-IOT-1\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"EspresSmart Espresso Machine (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Industrial\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQikuIAD\",'+
            '    \"sku\" : \"ESP-IOT-1\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The Capricorn I group espresso machine is the perfect addition to your restaurant, coffee shop, or cafe! Not only does this machine give you the opportunity to add one-of-a kind hot beverages to your menu, but its stainless steel dual boiler system and automatic functionality ensure fast, efficient service for your customers. A user-friendly option for any high-volume establishment, this espresso machine is sure to take your customer&#39;s morning fix to the next level.\",'+
            '      \"ProductCode\" : \"ID-PEM\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:22:44Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:22:44Z\",'+
            '      \"StockKeepingUnit\" : \"ID-PEM\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"Capricorn I Group Espresso Machine (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Personal\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQikrIAD\",'+
            '    \"sku\" : \"ID-PEM\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The Elite espresso machine is the perfect addition to your restaurant, coffee shop, or cafe! Not only does this machine give you the opportunity to add one-of-a kind hot beverages to your menu, but its stainless steel dual boiler system and automatic functionality ensure fast, efficient service for your customers. A user-friendly option for any high-volume establishment, this espresso machine is sure to take your customer&#39;s morning fix to the next level.\",'+
            '      \"ProductCode\" : \"PS-EL\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:22:16Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:22:16Z\",'+
            '      \"StockKeepingUnit\" : \"PS-EL\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"The Elite (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Commercial\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQikpIAD\",'+
            '    \"sku\" : \"PS-EL\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The Infuser delivers optimal espresso flavor in every cup. It pre-infuses ground coffee with low, steady water pressure before extraction, gently expanding the grinds before stepping up to high pressure. The result is a more even extraction, which produces balanced espresso flavor.\",'+
            '      \"ProductCode\" : \"PS-INF\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:22:29Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:22:29Z\",'+
            '      \"StockKeepingUnit\" : \"PS-INF\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"The Infuser (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Commercial\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQikwIAD\",'+
            '    \"sku\" : \"PS-INF\",'+
            '    \"success\" : true'+
            '  }, {'+
            '    \"defaultImage\" : null,'+
            '    \"error\" : { },'+
            '    \"fields\" : {'+
            '      \"LastModifiedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"DisplayUrl\" : null,'+
            '      \"IsDeleted\" : \"false\",'+
            '      \"Description\" : \"The Testa Rossa Milk Espresso &amp; Coffee machine: Deliciousness delivered with ease, cup after cup. With our innovative illy iperEspresso capsule system, creating an excellent cup of espresso or classic coffee is perfectly simple. Our specially designed capsules deliver extraordinary taste with professional artistry - all in a single touch, from a single machine. With a hot water dispenser for soothing tea, and new integrated milk frother for beautiful lattes and smooth cappuccinos, every cup becomes an at-home indulgence. Enjoy all six beverage options with the convenience of one machine: Espresso Coffee Cappuccino Latte macchiato Steamed milk Hot water for teas and herbal infusions\",'+
            '      \"ProductCode\" : \"TR-COFMAC-001\",'+
            '      \"IsActive\" : \"true\",'+
            '      \"ExternalId\" : null,'+
            '      \"LastViewedDate\" : \"2023-08-18T20:22:00Z\",'+
            '      \"UserRecordAccessId\" : null,'+
            '      \"LastReferencedDate\" : \"2023-08-18T20:22:00Z\",'+
            '      \"StockKeepingUnit\" : \"TR-COFMAC-001\",'+
            '      \"CurrencyIsoCode\" : \"USD\",'+
            '      \"ExternalDataSourceId\" : null,'+
            '      \"Name\" : \"Testa Rossa Coffee Machine (Sample)\",'+
            '      \"SystemModstamp\" : \"2023-07-21T18:55:29Z\",'+
            '      \"IsArchived\" : \"false\",'+
            '      \"Type\" : null,'+
            '      \"CreatedById\" : \"005Hn00000HAfkc\",'+
            '      \"QuantityUnitOfMeasure\" : null,'+
            '      \"CreatedDate\" : \"2023-07-21T18:55:29Z\",'+
            '      \"Family\" : \"Industrial\",'+
            '      \"ProductClass\" : \"Simple\",'+
            '      \"LastModifiedById\" : \"005Hn00000HAfkc\",'+
            '      \"TaxPolicyId\" : null'+
            '    },'+
            '    \"id\" : \"01tHn00000UQikqIAD\",'+
            '    \"sku\" : \"TR-COFMAC-001\",'+
            '    \"success\" : true'+
            '  } ],'+
            '  \"total\" : 7'+
            '}';
            httpResponse.setBody(json);
            httpResponse.setStatusCode(200);
            return httpResponse;
        }
    }

    public static Product2 getProductByNameViaDatabase(String name) {
        String signature = debugCallSignature('getProductByNameViaDatabase', name);
        List<Product2> products = getProductsByNamesViaDatabase(new String[]{name});
        return products[0];
    }

    public static List<Product2> getProductsByNamesViaDatabase(List<String> names)
    {
        String signature = debugCallSignature('getProductsNamesViaDatabase', names);

        List<Product2> products = [
            SELECT
                Id
                ,Name
                ,Description
                ,CreatedById
                ,CreatedDate
                ,CurrencyIsoCode
                ,DisplayUrl
                ,ExternalDataSourceId
                ,ExternalId
                ,Family
                ,IsActive
                ,IsArchived
                ,IsDeleted
                ,LastModifiedById
                ,LastModifiedDate
                ,LastReferencedDate
                ,LastViewedDate
                ,ProductClass
                ,ProductCode
                ,QuantityUnitOfMeasure
                ,StockKeepingUnit
                ,SystemModstamp
                ,TaxPolicyId
                ,Type
            FROM
                Product2
            WHERE
                Name in :names
            WITH
                SECURITY_ENFORCED
        ];

        Assert.isNotNull(products, 'products was null: ' + signature);
        debugReturn(signature, products);
        return products;
    }

    public static Product2 getProductByIdViaDatabase(Id id)
    {
        String signature = debugCallSignature('getProductByIdViaDatabase', id);
        List<Product2> products = getProductsByIdsViaDatabase(new Id[]{id});
        return products[0];
    }

    public static List<Product2> getProductsByIdsViaDatabase(List<Id> ids)
    {
        String signature = debugCallSignature('getProductsByIdsViaDatabase', ids);

        List<Product2> products = [
            SELECT
                Id
                ,Name
                ,Description
                ,CreatedById
                ,CreatedDate
                ,CurrencyIsoCode
                ,DisplayUrl
                ,ExternalDataSourceId
                ,ExternalId
                ,Family
                ,IsActive
                ,IsArchived
                ,IsDeleted
                ,LastModifiedById
                ,LastModifiedDate
                ,LastReferencedDate
                ,LastViewedDate
                ,ProductClass
                ,ProductCode
                ,QuantityUnitOfMeasure
                ,StockKeepingUnit
                ,SystemModstamp
                ,TaxPolicyId
                ,Type
            FROM
                Product2
            WHERE
                Id in :ids
            WITH
                SECURITY_ENFORCED
        ];

        Assert.isNotNull(products, 'products was null: ' + signature);
        debugReturn(signature, products);
        return products;
    }

    public static ProductsRestResponse.Products getProductBySkuViaApi(String sku)
    {
        String signature = debugCallSignature('getProductBySkuViaApi', sku);
        List<ProductsRestResponse.Products> products = getProductsBySkusViaApi(new String[]{sku});
        return products[0];
    }

    /**
     * Get an object-oriented representation of product data from the on-platform REST API call to this endpoint:
     * /services/data/vxx/commerce/webstores/webStoresId/products - See docs:
     * https://developer.salesforce.com/docs/atlas.en-us.chatterapi.meta/chatterapi/connect_resources_commerce_webstore_product.htm
     */
    public static List<ProductsRestResponse.Products> getProductsBySkusViaApi(List<String> skus)
    {
        String signature = debugCallSignature('getProductsBySkusViaApi', skus);
        WebStore webStore = WebStoreController.getWebStoreByName(AbstractController.WEB_STORE_NAME);
        Account account = AccountDetailController.getAccountInfo();
        ProductsRestResponse restResponse;
        // JSON representation serialized to an object (not Product2)
        List<ProductsRestResponse.Products> products = new List<ProductsRestResponse.Products>();

        BaseRestUtility baseRestUtility = (Test.isRunningTest()) ? new BaseRestUtility(new MockCalloutForGetProductsBySkusViaApi()) : new BaseRestUtility();
        String uri = AbstractController.BASE_URI + '/services/data/v' + AbstractController.API_VERSION_FOR_REST +
        '/commerce/webstores/' + webStore.Id +
        '/products?' +
        'skus=' + String.join(skus, ',') +
        '&effectiveAccountId=' + account.Id +
        '&excludeMedia=true' +
        '&excludePrices=true';
        String json = baseRestUtility.handleHttpGetRequest(uri);
        restResponse = ProductsRestResponse.parse(json);
        Assert.isNotNull(restResponse, 'null restResponse!');
        Assert.isNotNull(restResponse.products, 'null products!');
        Assert.isTrue(restResponse.products.size() > 0, 'No products!');

        for(ProductsRestResponse.Products product : restResponse.products) {
            if(skus.contains(product.Fields.StockKeepingUnit)) {
                products.add(product);
            }
        }

        debugReturn(signature, products);
        return products;
    }

    /**
     * Get the products for the given ProductCategory favoring an empty collection over null if none are found.
     */
    public static List<Product2> getProductsByCategory(ProductCategory productCategory) {

        String signature = debugCallSignature('getProductsByCategory', productCategory);
        List<Product2> products = new List<Product2>();

        // Get the ProductCategoryProduct junction for the productCategory
        List<ProductCategoryProduct> productCategoryProducts = [
            SELECT
                CatalogId,CreatedById,CreatedDate,CurrencyIsoCode,Id,IsDeleted,IsPrimaryCategory,LastModifiedById,
                LastModifiedDate,Name,ProductCategoryId,ProductId,ProductToCategory,SystemModstamp
            FROM
                ProductCategoryProduct
            WHERE
                ProductCategoryId = :productCategory.Id
            WITH
                SECURITY_ENFORCED
        ];

        if(productCategoryProducts.size() > 0) {
            List<Id> productIds = new List<Id>();

            for(ProductCategoryProduct pcp : productCategoryProducts) {
                productIds.add(pcp.ProductId);
            }

            // Get the Products (Product2s) related to the WebStoreCatalog junction
            products = [
                SELECT
                    CreatedById,CreatedDate,CurrencyIsoCode,Description,DisplayUrl,ExternalDataSourceId,ExternalId,Family,
                    Id,IsActive,IsArchived,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastViewedDate,Name,
                    ProductClass,ProductCode,QuantityUnitOfMeasure,StockKeepingUnit,SystemModstamp,TaxPolicyId,Type
                FROM
                    Product2
                WHERE
                    Id in :productIds
                WITH
                    SECURITY_ENFORCED
            ];
        }

        debugReturn(signature, products);
        return products;
    }
}