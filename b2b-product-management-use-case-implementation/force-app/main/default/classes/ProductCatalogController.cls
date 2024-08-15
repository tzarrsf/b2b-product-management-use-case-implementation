/**
 * @description       : Product Catalog Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class ProductCatalogController extends AbstractController {
    /**
     * Get the ProductCatalog entity for the WebStore
    */
    public static ProductCatalog getCatalogByWebStore(WebStore webStore) {
        String signature = debugCallSignature('getCatalogByWebStore', webStore);

        // Get the WebStoreCatalog junction for the Webstore
        WebStoreCatalog webstoreCatalog = [
            SELECT CreatedById,CreatedDate,CurrencyIsoCode,Id,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,
            LastViewedDate,Name,ProductCatalogId,SalesStoreId,SystemModstamp
            FROM WebStoreCatalog
            WHERE SalesStoreId = :webStore.Id
        ];

        Assert.isNotNull(webstoreCatalog, 'webStore was null calling getCatalogByWebStore(' + objectToString(webStore) +')');

        // Get the ProductCatalog related to the WebStoreCatalog junction
        ProductCatalog productCatalog = [
            SELECT CreatedById,CreatedDate,CurrencyIsoCode,Id,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,
            LastViewedDate,Name,NumberOfCategories,OwnerId,SystemModstamp
            FROM ProductCatalog
            WHERE Id = :webstoreCatalog.ProductCatalogId
        ];

        Assert.isNotNull(productCatalog, 'productCatalog was null calling getCatalogByWebStore(' + objectToString(webStore) +')');

        debugReturn(signature, productCatalog);
        return productCatalog;
    }
}