/**
 * @description       : WebStore controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class WebStoreController extends AbstractController {

    /**
     * Get the WebStore entity by its name and Network using the webStoreNetwork junction.
    */
    public static WebStore getWebStoreByName(String name) {
        String signature = debugCallSignature('getWebStoreByName', name);
        System.debug(signature);

        WebStore webStore = [
            SELECT
                Id
                ,Name
                ,Description
                ,CheckoutTimeToLive
                ,CheckoutValidAfterDate
                ,Country
                ,CreatedById
                ,CreatedDate
                ,CurrencyIsoCode
                ,DefaultLanguage
                ,DefaultTaxLocaleType
                ,DefaultTaxPolicyId
                ,ExternalReference
                ,GuestBuyerProfileId
                ,GuestCartTimeToLive
                ,IsDeleted
                ,LastModifiedById
                ,LastModifiedDate
                ,LastReferencedDate
                ,LastViewedDate
                ,LocationId
                ,MaxValuesPerFacet
                ,OrderActivationStatus
                ,OrderLifeCycleType
                ,OwnerId
                ,PaginationSize
                ,PricingStrategy
                ,ProductGrouping
                ,SortByPricebookId
                ,StrikethroughPricebookId
                ,SupportedCurrencies
                ,SupportedLanguages
                ,SystemModstamp
                ,Type
            FROM
                WebStore
            WHERE
                Name = :name
            WITH
                SECURITY_ENFORCED
        ];

        Assert.isNotNull(webStore, 'webStore was null: ' + signature);
        debugReturn(signature, webStore);
        return webStore;
    }

    /**
     * Get the WebStore entity by its name and Network using the webStoreNetwork junction.
    */
    public static WebStore getWebStoreByNameAndNetwork(String name, Network network) {
        //TODO: Figure out a dynamic 'params' way to handle these calls that are not the 8 in 10 case
        String signature = debugCallSignature('getWebStoreByNameAndNetwork', name);

        WebStoreNetwork webStoreNetwork = [
                SELECT CreatedById,CreatedDate,Id,IsDeleted,LastModifiedById,
                LastModifiedDate,Name,NetworkId,SystemModstamp,WebStoreId
                FROM WebStoreNetwork
                WHERE NetworkId = :network.Id
                WITH SECURITY_ENFORCED
        ];

        Assert.isNotNull(webStoreNetwork, 'webStoreNetwork was null');

        // Get the WebStore entity which is what we're really interested in
        WebStore webStore = [
            SELECT CheckoutTimeToLive,CheckoutValidAfterDate,Country,CreatedById,CreatedDate,
            CurrencyIsoCode,DefaultLanguage,DefaultTaxLocaleType,DefaultTaxPolicyId,Description,ExternalReference,
            GuestBuyerProfileId,GuestCartTimeToLive,Id,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,
            LastViewedDate,LocationId,MaxValuesPerFacet,Name,OptionsAutoFacetingEnabled,
            OrderActivationStatus,OrderLifeCycleType,OwnerId,PaginationSize,PricingStrategy,ProductGrouping,
            SortByPricebookId,StrikethroughPricebookId,SupportedCurrencies,SupportedLanguages,SystemModstamp,Type
            FROM WebStore
            WHERE Name = :name
        ];

        Assert.isNotNull(webStore, 'webStore was null');

        debugReturn(signature, webStore);
        return webStore;
    }
}