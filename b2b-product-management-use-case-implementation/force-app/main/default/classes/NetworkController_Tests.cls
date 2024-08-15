/**
 * @description       : Unit Tests for the NetworkController class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-08-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class NetworkController_Tests {

    @IsTest
    static void testGetNetworkByName() {
        Test.startTest();

        Network network = NetworkController.getNetworkByName(TestSettings.KNOWN_GOOD_NETWORK_NAME);
        System.assert(network != null, 'network is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assert(network.Name != null, 'network Name is empty. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assertEquals(TestSettings.KNOWN_GOOD_NETWORK_NAME, network.Name, 'Names are mismatched');
        System.Debug('Network Result => ' +  network.Name + ' with Id ' + network.Id);

        Test.stopTest();
    }

    @IsTest
    static void testgetNetworkById() {
        Test.startTest();

        Network network = NetworkController.getNetworkByName(TestSettings.KNOWN_GOOD_NETWORK_NAME);
        System.assert(network != null, 'network is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assert(network.Name != null, 'network Name is empty. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.Debug('Network Result => ' +  network.Name + ' with Id ' + network.Id);

        Network network2 = NetworkController.getNetworkById(network.Id);
        System.assert(network2 != null, 'network2 is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.assert(network2.Name != null, 'network2 Name is null. Create a known good Network (Experience Site) in the org and check the TestSettings class.');
        System.Debug('Network2 Result => ' +  network2.Name + ' with Id ' + network2.Id);
        System.assertEquals(network.Name, network2.Name, 'Names are mismatched');

        Test.stopTest();
    }
}