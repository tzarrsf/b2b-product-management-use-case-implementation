/**
 * @description       : Unit Tests for the ProductCategory Enhanced Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-13-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class ProductCategoryEnhancedController_Tests {

    /**
     * The name of the Network (Experience Cloud Site)
     */
    //public static final String NETWORK_NAME = 'B2B LWR Enhanced Store from TSO';

    @IsTest(SeeAllData=true)
    static void testGetProductsByCategoryIdViaDatabase()
    {
        Test.startTest();

        Network network = NetworkController.getNetworkByName(TestSettings.KNOWN_GOOD_NETWORK_NAME);
        WebStore webStore = WebStoreController.getWebStoreByNameAndNetwork(TestSettings.KNOWN_GOOD_NETWORK_NAME, network);
        ProductCatalog productCatalog = ProductCatalogController.getCatalogByWebStore(webstore);
        List<ProductCategory> productCategories = ProductCategoryEnhancedController.getProductCategoriesByCatalog(productCatalog);

        for(ProductCategory productCategory : productCategories) {
            List<Map<String, Object>> productsWithInventoryCheck = ProductCategoryEnhancedController.getProductsByCategoryIdViaDatabase(productCategory.Id, true);

            // Filter out the categories without products
            if(productsWithInventoryCheck == null || productsWithInventoryCheck.isEmpty()) {
                continue;
            }

            for(Map<String, Object> productWithInventoryCheck : productsWithInventoryCheck) {
                System.Assert(productWithInventoryCheck.get('id') != null, 'id is null');
                System.Assert(productWithInventoryCheck.get('name') != null, 'name is null for id: ' + productWithInventoryCheck.get('id'));
                System.Assert(productWithInventoryCheck.get('sku') != null, 'sku is null or name: ' + productWithInventoryCheck.get('name'));
                System.Assert(productWithInventoryCheck.get('price') != null, 'price is null for sku: ' + productWithInventoryCheck.get('sku'));
                System.Assert(productWithInventoryCheck.get('availableToOrder') != null, 'availableToOrder is null for sku: ' +
                    productWithInventoryCheck.get('sku'));
            }
        }

        Test.stopTest();
    }

    @IsTest(SeeAllData=true)
    static void testGetProductsByCategoryIdViaApi()
    {
        Test.startTest();

        Network network = NetworkController.getNetworkByName(TestSettings.KNOWN_GOOD_NETWORK_NAME);
        WebStore webStore = WebStoreController.getWebStoreByNameAndNetwork(TestSettings.KNOWN_GOOD_NETWORK_NAME, network);
        ProductCatalog productCatalog = ProductCatalogController.getCatalogByWebStore(webstore);
        List<ProductCategory> productCategories = ProductCategoryEnhancedController.getProductCategoriesByCatalog(productCatalog);

        for(ProductCategory productCategory : productCategories) {
            List<ProductsRestResponse.Products> productsCheck = ProductCategoryEnhancedController.getProductsByCategoryIdViaApi(productCategory.Id, true);

            // Filter out the categories without products
            if(productsCheck == null || productsCheck.isEmpty()) {
                continue;
            }

            // TODO: Check that the product data is intact

            Assert.isNotNull(productsCheck, 'productsCheck is null for productCategory.Name: ' + productCategory.Name + ' (' + productCategory.Id + ')');
            Assert.isFalse(productsCheck.size() == 0, 'productsCheck is empty for productCategory.Name: ' + productCategory.Name + ' (' + productCategory.Id + ')');
        }

        Test.stopTest();
    }
}