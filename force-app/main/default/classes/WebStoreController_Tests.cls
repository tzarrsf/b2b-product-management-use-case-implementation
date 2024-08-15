/**
 * @description       : Unit Tests for the WebStore Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-18-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class WebStoreController_Tests {

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user
     * without issue, this entity throws a "System.QueryException: List has no rows for assignment to SObject" I don't care to investigate. :-)
     */
    @IsTest(SeeAllData=true)
    static void testGetWebStoreByName() {
        Test.startTest();

        WebStore webstore = WebStoreController.getWebStoreByName(TestSettings.KNOWN_GOOD_WEB_STORE_NAME);
        System.assert(webstore != null, 'webstore is null. Create a known good WebStore (Commerce Store) in the org and check the TestSettings class.');
        System.assert(webstore.Name != null, 'webstore Name is null. Create a known good WebStore (Commerce Store) in the org and check the TestSettings class.');
        System.assertEquals(TestSettings.KNOWN_GOOD_WEB_STORE_NAME, webStore.Name, 'Names are mismatched');

        Test.stopTest();
    }

    /**
     * SeeAllData is required here as we're looking at the database to verify setup. While I can run this from scripts/apex under the same user
     * without issue, this entity throws a "System.QueryException: List has no rows for assignment to SObject" I don't care to investigate. :-)
     */
    @IsTest(SeeAllData=true)
    static void testGetWebStoreByNameAndNetwork() {
        Test.startTest();

        Network network = NetworkController.getNetworkByName(TestSettings.KNOWN_GOOD_NETWORK_NAME);
        System.assert(network != null, 'network is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assert(network.Name != null, 'network Name is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assertEquals(TestSettings.KNOWN_GOOD_NETWORK_NAME, network.Name, 'Names are mismatched');

        WebStore webstore = WebStoreController.getWebStoreByNameAndNetwork(TestSettings.KNOWN_GOOD_NETWORK_NAME, network);
        System.assert(webstore != null, 'webstore is null. Create a known good WebStore (Commerce Store) in the org and check the TestSettings class.');
        System.assert(webstore.Name != null, 'webstore Name is null. Create a known good WebStore (Commerce Store) in the org and check the TestSettings class.');
        System.assertEquals(TestSettings.KNOWN_GOOD_WEB_STORE_NAME, webStore.Name, 'Names are mismatched');

        Test.stopTest();
    }
}