/**
 * @description       : Tests for the ProductController class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-08-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class ProductController_Tests {

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByNameViaDatabaseForMachine()
    {
        Test.startTest();

        Product2 product = ProductController.getProductByNameViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MACHINE);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MACHINE, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByIdViaDatabaseForMachine()
    {
        Test.startTest();

        Product2 soqlProduct = [SELECT Id from Product2 where Name = :TestSettings.KNOWN_GOOD_PRODUCT_NAME_MACHINE];
        System.assert(soqlProduct != null, 'soqlProduct is null');

        Product2 product = ProductController.getProductByIdViaDatabase(soqlProduct.Id);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MACHINE, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByNameViaDatabaseForBean()
    {
        Test.startTest();

        Product2 product = ProductController.getProductByNameViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAME_BEAN);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_BEAN, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByIdViaDatabaseForBean()
    {
        Test.startTest();

        Product2 soqlProduct = [SELECT Id from Product2 where Name = :TestSettings.KNOWN_GOOD_PRODUCT_NAME_BEAN];
        System.assert(soqlProduct != null, 'soqlProduct is null');

        Product2 product = ProductController.getProductByIdViaDatabase(soqlProduct.Id);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_BEAN, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByNameViaDatabaseForMug()
    {
        Test.startTest();

        Product2 product = ProductController.getProductByNameViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MUG);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MUG, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductByIdViaDatabaseForMug()
    {
        Test.startTest();

        Product2 soqlProduct = [SELECT Id from Product2 where Name = :TestSettings.KNOWN_GOOD_PRODUCT_NAME_MUG];
        System.assert(soqlProduct != null, 'soqlProduct is null');

        Product2 product = ProductController.getProductByIdViaDatabase(soqlProduct.Id);
        System.assert(product != null, 'product is null');
        System.assert(product.Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAME_MUG, product.Name, 'Mismatch on Names');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByNamesViaDatabaseForMachines()
    {
        Test.startTest();

        List<Product2> products = ProductController.getProductsByNamesViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MACHINES);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MACHINES.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByIdsViaDatabaseForMachines()
    {
        Test.startTest();

        List<Product2> soqlProducts = [SELECT Id from Product2 where Name in :TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MACHINES];
        System.assert(soqlProducts != null, 'soqlProducts is null');
        System.assert(!soqlProducts.isEmpty(), 'soqlProducts is empty');
        List<Id> soqlProductIds = new List<Id>(new Map<Id,SObject>(soqlProducts).keySet());

        List<Product2> products = ProductController.getProductsByIdsViaDatabase(soqlProductIds);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MACHINES.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByNamesViaDatabaseForBeans()
    {
        Test.startTest();

        List<Product2> products = ProductController.getProductsByNamesViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_BEANS);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_BEANS.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByIdsViaDatabaseForBeans()
    {
        Test.startTest();

        List<Product2> soqlProducts = [SELECT Id from Product2 where Name in :TestSettings.KNOWN_GOOD_PRODUCT_NAMES_BEANS];
        System.assert(soqlProducts != null, 'soqlProducts is null');
        System.assert(!soqlProducts.isEmpty(), 'soqlProducts is empty');
        List<Id> soqlProductIds = new List<Id>(new Map<Id,SObject>(soqlProducts).keySet());

        List<Product2> products = ProductController.getProductsByIdsViaDatabase(soqlProductIds);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_BEANS.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByNamesViaDatabaseForMugs()
    {
        Test.startTest();

        List<Product2> products = ProductController.getProductsByNamesViaDatabase(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MUGS);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MUGS.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsByIdsViaDatabaseForMugs()
    {
        Test.startTest();

        List<Product2> soqlProducts = [SELECT Id from Product2 where Name in :TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MUGS];
        System.assert(soqlProducts != null, 'soqlProducts is null');
        System.assert(!soqlProducts.isEmpty(), 'soqlProducts is empty');
        List<Id> soqlProductIds = new List<Id>(new Map<Id,SObject>(soqlProducts).keySet());

        List<Product2> products = ProductController.getProductsByIdsViaDatabase(soqlProductIds);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].Name != null, 'product Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_NAMES_MUGS.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user without issue
     * and even use it in a controller called from LWC, the Product2 entity throws a "System.QueryException: List has no rows for assignment to SObject" error.
     */
    @IsTest(SeeAllData=true)
    public static void testGetProductsBySkusViaApiForMachines()
    {
        Test.startTest();

        List<ProductsRestResponse.Products> products = ProductController.getProductsBySkusViaApi(TestSettings.KNOWN_GOOD_PRODUCT_SKUS_FOR_MACHINES);
        System.assert(products != null, 'products is null');
        System.assertNotEquals(0, products.size(), 'products is empty');
        System.assert(products[0].fields.Name != null, 'product Name is null');
        System.assert(products[0].fields.StockKeepingUnit != null, 'product StockKeepingUnit is null');
        System.assert(products[0].fields.IsActive != null, 'product IsActive is null');
        System.assert(products[0].fields.IsActive == 'true', 'product IsActive is false: ' + products[0].Name());
        System.assertEquals(TestSettings.KNOWN_GOOD_PRODUCT_SKUS_FOR_MACHINES.size(), products.size(), 'Mismatch on expected size');

        Test.stopTest();
    }
}