/**
 * @description       : Account Detail Controller - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class AccountDetailController extends AbstractController {

    /**
     * Aura-exposed method to get the Account entity basics (Id and Name) tied to the context user
     * See: https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_userinfo.htm
     */
    @AuraEnabled
    public static Account getAccountInfo() {
        String signature = debugCallSignature('getAccountInfo');

        Account effectiveAccount;
        User userEntity = [
            SELECT
                AccountId
            FROM
                User
            WHERE
                Id =: UserInfo.getUserId()
            WITH
                SECURITY_ENFORCED
        ];

        /**
         * If the running user while testing does not have an Account tied to it then we fall back to a known good account
         * in the system (or one with very basic entitlements) to facilitate testing with actual data and not pure mocks
         */
        if(Test.IsRunningTest())
        {
            debug('Testing context detected');
            User userEntity2 = [
                    SELECT
                        Id, Name, FirstName, LastName, AccountId
                    FROM
                        User
                    WHERE
                        FirstName = :TestSettings.KNOWN_GOOD_BUYER_CONTACT_FIRST_NAME
                        and LastName = :TestSettings.KNOWN_GOOD_BUYER_CONTACT_LAST_NAME
                    WITH
                        SECURITY_ENFORCED
            ];

            Assert.areEqual(TestSettings.KNOWN_GOOD_BUYER_CONTACT_FIRST_NAME, userEntity2.FirstName, 'User FirstName retrieved does not match known good value.');
            Assert.areEqual(TestSettings.KNOWN_GOOD_BUYER_CONTACT_LAST_NAME, userEntity2.LastName, 'User LastName retrieved does not match known good value.');
            debug('Located known good User for testing');

            effectiveAccount = [
                SELECT
                    Id,
                    Name
                FROM
                    Account
                WHERE
                    Name = :TestSettings.KNOWN_GOOD_ACCOUNT_NAME
                WITH
                    SECURITY_ENFORCED
            ];
            Assert.areEqual(TestSettings.KNOWN_GOOD_ACCOUNT_NAME, effectiveAccount.Name, 'Account Name retrieved does not match known good value.');
        }
        else
        {
            debug('Testing context NOT detected');

            if(userEntity.AccountId == null){
                debug('WARNING: Running user does not have an account. Falling back to test value');
                effectiveAccount = [
                    SELECT
                        Id, Name, OwnerId
                    FROM
                        Account
                    WHERE
                        Name = :TestSettings.KNOWN_GOOD_ACCOUNT_NAME
                    WITH
                        SECURITY_ENFORCED
                ];
            } else {
                debug('Running user has an account: ' + userEntity.AccountId);
                effectiveAccount = [
                    SELECT
                        Id, Name, OwnerId
                    FROM
                        Account
                    WHERE
                        Id = :userEntity.AccountId
                    WITH
                        SECURITY_ENFORCED
                ];
            }
        }

        Assert.isNotNull(effectiveAccount, 'effectiveAccount was null: ' + signature);
        debugReturn(signature, effectiveAccount);
        return effectiveAccount;
    }
}