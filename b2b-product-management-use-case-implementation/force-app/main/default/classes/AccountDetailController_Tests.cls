/**
 * @description       : Unit Tests for the AccountDetail Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-08-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class AccountDetailController_Tests {

    /**
     * SeeAllData is required here to:
     * 1. Access the database to verify setup (read-only of course)
     * 2. Locate a known good Account to use as an Effective Account Id. This applies under test from the controller class logic so you can run all
     * of the tests under a User like Sys Admin who is not actually tied to a real Account or Contact in the system.
     * Without this you may end up with "System.QueryException: List has no rows for assignment to SObject"
     */
    @IsTest(SeeAllData=true)
    static void testGetAccountInfo() {
        Test.startTest();

        Account account = AccountDetailController.getAccountInfo();
        System.assert(account != null, 'account is null');
        System.assert(account.Name != null, 'account.Name is null');
        System.assertEquals(TestSettings.KNOWN_GOOD_ACCOUNT_NAME, account.Name, 'Mismatch on Name');

        Test.stopTest();
    }
}