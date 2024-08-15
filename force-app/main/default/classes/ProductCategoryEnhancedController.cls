/**
 * @description       : Product Category Enhanced Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-13-2023
 * @last modified by  : Tom Zarr
**/
public without sharing class ProductCategoryEnhancedController extends AbstractController {

    /** The Location Group Identifier configured in Order Management + Omnichannel Inventory.
     * A Location group sits over one or more locations for sourcing inventory. */
    public static final String LOCATION_GROUP_IDENTIFIER = 'LocationGroup01';

    /** The Electronic Media Groups of interest such as the product detail or list images */
    public static final List<String> ELECTRONIC_MEDIA_GROUPS = new List<String>{'productDetailImage', 'productListImage'};

    /** The type for the CMS asset such as image, news, etc. */
    private static final String CONTENT_TYPE = 'cms_image';

    /** Default language  */
    private static final String DEFAULT_LANGUAGE = 'en_US';

    /** Default page size needed for the ConnectApi.ManagedContent.getAllManagedContent call */
    private static final Integer DEFAULT_PAGE_SIZE = 50;

    public class MockCalloutForGetProductsBySkusWithMediaViaApi implements HttpCalloutMock {
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

    /**
     * Get the product categories for the given ProductCatalog
     */
    public static List<ProductCategory> getProductCategoriesByCatalog(ProductCatalog productCatalog) {
        String signature = debugCallSignature('getProductCategoriesByCatalog', productCatalog);

        // Get the product categories for the ProductCatalog
        List<ProductCategory> productCategories = [
            SELECT CatalogId,CreatedById,CreatedDate,CurrencyIsoCode,Description,Id,IsDeleted,IsNavigational,LastModifiedById,
            LastModifiedDate,LastReferencedDate,LastViewedDate,Name,NumberOfProducts,ParentCategoryId,SortOrder,SystemModstamp
            FROM ProductCategory
            WHERE CatalogId = :productCatalog.Id
        ];

        Assert.isTrue(productCategories.size() > 0, 'productCategories.size() had no elements calling getProductCategoriesByCatalog(' + objectToString(productCatalog) +')');
        debugReturn(signature, productCategories);
        return productCategories;
    }


    @AuraEnabled
    public static List<ProductsRestResponse.Products> getProductsByCategoryIdViaApi(Id categoryId, Boolean includeImages) {

        String signature = debugCallSignature('getProductsByCategoryIdViaApi', categoryId);
        WebStore webStore = WebStoreController.getWebStoreByName(AbstractController.WEB_STORE_NAME);
        Account account = AccountDetailController.getAccountInfo();

        // Fetch the products in a given Category by the categoryId and build a unique list of product Ids
        List<ProductCategoryProduct> pcps = [SELECT ProductId FROM ProductCategoryProduct WHERE ProductCategoryId = :categoryId];
        System.debug('pcps.size(): ' + pcps.size());

        List<Id> productIds = new List<Id>((new Map<Id,SObject>(pcps)).keySet());

        // When there are no products in a category there's nothing else to do
        if(productIds.isEmpty()) {
            return null;
        }

        List<Product2> products = ProductController.getProductsByIdsViaDatabase(new List<Id>(productIds));
        ProductsRestResponse restResponse;
        List<ProductsRestResponse.Products> restProducts = new List<ProductsRestResponse.Products>();
        BaseRestUtility baseRestUtility = (Test.isRunningTest()) ? new BaseRestUtility(new MockCalloutForGetProductsBySkusWithMediaViaApi()) : new BaseRestUtility();

        String uri = AbstractController.BASE_URI + '/services/data/v' + AbstractController.API_VERSION_FOR_REST +
        '/commerce/webstores/' + webStore.Id +
        '/products?' +
        'ids=' + String.join(productIds, ',') +
        '&effectiveAccountId=' + account.Id +
        (includeImages ? '&excludeMedia=false' : '&excludeMedia=true') +
        '&excludePrimary​ProductCategory=false' +
        '&excludeFields=false' +
        '&excludePrices=false';
        String json = baseRestUtility.handleHttpGetRequest(uri);
        //System.debug('uri: ' + uri);
        //System.debug('json: ' + json);

        restResponse = ProductsRestResponse.parse(json);
        Assert.isNotNull(restResponse, 'null restResponse!');
        Assert.isNotNull(restResponse.products, 'null products!');
        Assert.isTrue(restResponse.products.size() > 0, 'No products!');

        // This product loop is against the JSON representation serialized to an object (not the Product2 sObject)
        for(ProductsRestResponse.Products product : restResponse.products) {
            if(productIds.contains(product.id)) {
                restProducts.add(product);
            }
        }

        debugReturn(signature, restProducts);
        return restProducts;
    }

    @AuraEnabled
    public static List<Map<String, Object>> getProductsByCategoryIdViaDatabase(Id categoryId, Boolean includeImages) {

        String signature = debugCallSignature('getProductsByCategoryIdViaDatabase', categoryId);

        ProductCategory productCategory = [
            SELECT Id, Name
            FROM ProductCategory
            WHERE Id = :categoryId
            WITH SECURITY_ENFORCED
        ];

        // Fetch the products in a given Category by the categoryId and build a unique list of their Ids to get details + price
        List<ProductCategoryProduct> pcps = [
            SELECT ProductId
            FROM ProductCategoryProduct
            WHERE ProductCategoryId = :categoryId
            WITH SECURITY_ENFORCED
        ];

        Map<Id, ProductCategoryProduct> pcpMap = new Map<Id,ProductCategoryProduct>(pcps);
        Set<Id> productIdSet = new Set<Id>();

        for(Id id : pcpMap.keySet()) {
            productIdSet.Add(pcpMap.get(id).ProductId);
        }

        // List<Id> productIds = new List<Id>((new Map<Id,SObject>(pcps)).keySet());
        List<Id> productIds = new List<Id>(productIdSet);

        // When there are no products in a category there's nothing else to do
        if(productIds.isEmpty()) {
            return null;
        }

        List<Product2> products = [
            SELECT Id, Name, StockKeepingUnit
            FROM Product2
            WHERE Id IN :productIds
        ];

        Map<Id, Decimal> productIdToPriceMap = new Map<Id, Decimal>();
        List<PricebookEntry> pbes = [
            SELECT Id, UnitPrice, Product2Id
            FROM PricebookEntry
            WHERE Pricebook2.Name = :AbstractController.STORE_PRICEBOOK AND Product2Id IN :productIds
            WITH SECURITY_ENFORCED
        ];

        for(PricebookEntry pbe : pbes) {
            productIdToPriceMap.put(pbe.Product2Id, pbe.UnitPrice);
        }

        // Determine the inventory levels for each product by leveraging the SKU and cycling through the locations
        //System.debug('Determining the inventory levels for each product by leveraging the SKU and cycling through the locations...');
        String locationGroupIdentifier = LOCATION_GROUP_IDENTIFIER;
        Map<String, Id> skuToProductIdMap = new Map<String, Id>();
        List<String> skus = new List<String>();

        for(Product2 p: products) {
            //System.debug('p.Name: ' + p.Name + ' p.StockKeepingUnit: ' + p.StockKeepingUnit);
            skuToProductIdMap.put(p.StockKeepingUnit, p.Id);
            skus.add(p.StockKeepingUnit);
        }

        List<String> locationGroupIdentifiers = new List<String>();
        locationGroupIdentifiers.add(locationGroupIdentifier);
        Map<Id, Decimal> productIdToQtyMap = getAndParseInventory(locationGroupIdentifiers, skus, skuToProductIdMap);

        // Finalize a clean product response suitable for binding with or without images
        List<Map<String, Object>> response = new List<Map<String, Object>>();
        //System.debug('Finalizing a clean product response suitable for binding without images...');

        for(Product2 p : products) {
            Map<String, Object> productResponse = new Map<String, Object>();
            productResponse.put('id', p.id);
            productResponse.put('name', p.name);
            productResponse.put('sku', p.StockKeepingUnit);
            productResponse.put('price', productIdToPriceMap.get(p.id));
            productResponse.put('availableToOrder', productIdToQtyMap.get(p.id));
            response.add(productResponse);
        }

        //TODO: Fix this
        //debugReturn(signature, response);
        return response;
    }

    private static ProductMedia getProductMedias(Id electronicMediaGroupId, Id electronicMediaId, List<Product2> products) {
        return [Select Id, Name from ProductMedia where
        electronicMediaGroupId = :electronicMediaGroupId
        and electronicMediaId = :electronicMediaId 
        and productId in :products];
        /*
        return new ProductMedia(
            ElectronicMediaGroupId = electronicMediaGroupId,
            ElectronicMediaId = electronicMediaId,
            ProductId = productId
        );
        */
    }

    private static List<ConnectApi.ManagedContentVersion> getMediaContentForTheProducts(List<ConnectApi.ManagedContentVersion> contentVersionMedias, List<Product2> products) {
        List<ConnectApi.ManagedContentVersion> mediaContentsForTheProduct = new List<ConnectApi.ManagedContentVersion>();

        for(ConnectApi.ManagedContentVersion mediaContent : contentVersionMedias) {
            for(Product2 product : products) {
                if(mediaContent.title.contains(product.ProductCode)) {
                    mediaContentsForTheProduct.add(mediaContent);
                }
            }
        }

        return mediaContentsForTheProduct;
    }

    private static List<ElectronicMediaGroup> getElectronicMediaGroupsForProducts() {
        return [SELECT Id, DeveloperName 
                FROM ElectronicMediaGroup 
                WHERE DeveloperName 
                IN :ELECTRONIC_MEDIA_GROUPS
                ORDER BY DeveloperName ASC];
    }

    /**
     * Supports the AddToCart operation directly from the Product Category Page
     */
    @AuraEnabled
    public static String addToCart(Id effectiveAccountId, Id productId, Double price, Integer quantity) {

        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        String signature = 'addToCart called with effectiveAccountId: \'' + effectiveAccountId + '\' productId: \'' + productId + '\' price: \'' + price + '\' quantity: \'' + quantity;
        debug(signature);

        // Get the list of Active carts matching the Store name
        System.debug('Getting the list of Active carts matching the Store name...');
        List<WebCart> carts = [SELECT Id, AccountId, Status FROM WebCart 
                               WHERE AccountId = :effectiveAccountId AND Status = 'Active' AND WebStore.Name = :AbstractController.NETWORK_NAME];

        // Bail out if we can't single out a cart - dead programs tell no lies
        if(carts.size() != 1) {
            System.debug('Bailing out since we can\'t single out a cart...');
            Database.delete(carts, false);
            return 'A single cart could not be located using effectiveAccountId: ' + effectiveAccountId + '. Amount of carts found: ' + carts.size();
        }

        // We have a single cart so scaffold out the cartItem and add it (insert it with reference to the Cart's Id)
        WebCart cart = carts[0];
        CartDeliveryGroup cartDeliveryGroup = [SELECT Id FROM CartDeliveryGroup WHERE CartId = :cart.id LIMIT 1];
        Product2 product = [SELECT Id, Name, StockKeepingUnit FROM Product2 WHERE Id = :productId];
        Decimal total = price * quantity;
        CartItem cartItem = new CartItem();
        cartItem.CartId = cart.id;
        cartItem.Product2Id = productId;
        cartItem.Sku = product.StockKeepingUnit;
        cartItem.SalesPrice = price;
        cartItem.UnitAdjustedPrice = price;
        cartItem.Quantity = quantity;
        cartItem.TotalPrice = total;
        cartItem.TotalLineAmount = total;
        cartItem.Type = 'Product';
        cartItem.Name = product.Name;
        cartItem.CartDeliveryGroupId = cartDeliveryGroup.Id;
        cartItem.ListPrice = 0;
        cartItem.AdjustmentAmount = 0;
        cartItem.TotalAdjustmentAmount = 0;
        cartItem.TotalListPrice = 0;
        cartItem.TotalPriceAfterAllAdjustments = total;
        cartItem.TotalPromoAdjustmentAmount = 0;
        cartItem.UnitAdjustmentAmount = 0;

        insert cartItem;

        debugReturn(signature, cartItem);
        return 'success';
    }

    /**
     * Supports the cart clearing operation from the Product Category page similar to how it can be done in other places like the Cart page
     */
    @AuraEnabled
    public static String clearCart(String effectiveAccountId) {
        String signature = debugCallSignature('clearCart', effectiveAccountId);

        Map<Id, CartItem> cartItems = new Map<Id, CartItem>([SELECT Id FROM CartItem WHERE Cart.Status = 'Active' AND Cart.AccountId = :effectiveAccountId]);
        List<Database.DeleteResult> dr = Database.delete(new List<Id>(cartItems.keySet()), false);
        String result = '';
        for(Database.DeleteResult d : dr){
            if(!d.isSuccess()){
                for(Database.Error err : d.getErrors()) {
                    result = result + err.getStatusCode() + ': ' + err.getMessage() + '|';
                }
            }
        }

        debugReturn(signature, result);
        return result;
    }

    /***
     * Helper function to simplify aggregation of inventory levels for a SKU (product's Stock Keeping Unit)
     * across available locations.
     */
    private static Map<Id, Decimal> getAndParseInventory(List<String> locationGroupIdentifiers, List<String> skus, Map<String, Id> skuToProductIdMap) {
        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        String signature = debugCallSignature('getAndParseInventory', locationGroupIdentifiers);
        System.debug('getAndParseInventory called with ' + 
        'locationGroupIdentifiers: ' + String.join(locationGroupIdentifiers, ', ') + '\n' + 
        'skus: ' + String.join(skus, ', ')  + '\n' + 
        'skuToProductIdMap size: ' + skuToProductIdMap.size());

        Map<Id, Decimal> result = new Map<Id, Decimal>();
        String inventory = OciRestUtility.getAvailability(locationGroupIdentifiers, null, skus);
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(inventory);
        List<Object> a = (List<Object>) m.get('locationGroups');
        Map<String, Object> b = (Map<String, Object>)a[0];
        List<Object> c = (List<Object>) b.get('inventoryRecords');

        for(Object x : c) {
            Map<String, Object> d = (Map<String, Object>)x;
            String skuValue = (String)d.get('stockKeepingUnit');
            Decimal availableToOrderValue = (Decimal)d.get('availableToOrder');

            /**
             * NOTE: If there's a product without inventory levels uploaded to OCI you will get a null here instead of zero
             * which could cause needless test failures or even serialization issues so we swap a zero in place of the null.
             * It's likely a better solution to to have the product's IsActive field determine overall product profile availability
             * and have OCI stick to what it does best: "SOrry, but we don't have any to sell you right now."
             */
            if(availableToOrderValue == null) {
                availableToOrderValue = 0.00;
            }

            result.put(skuToProductIdMap.get(skuValue), availableToOrderValue);
        }

        System.debug('getAndParseInventory called with ' +
        'locationGroupIdentifiers: \'' + String.join(locationGroupIdentifiers, ', ') + '\'\n' +
        'skus: \'' + String.join(skus, ', ')  + '\'\n' +
        'skuToProductIdMap size: \'' + skuToProductIdMap.size() + '\'\n' +
        'returning \'' + result + '\''
        );

        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        //debugReturn(signature, result);
        //debugReturn(signature, JSON.serialize(result));
        return result;
    }
}