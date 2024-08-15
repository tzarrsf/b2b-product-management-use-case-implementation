/**
**
 * @description       : Object representation of the REST response given at endpoint /commerce/webstores/webstoreId/products/productId
 * 						Sample code for Partner Learning Camp training material
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public class ProductsRestResponse {

    public class Products implements GenericObject {
        public Object defaultImage {get;set;}
        public Error error {get;set;}
        public Fields fields {get;set;}
        public String id {get;set;}
        public String sku {get;set;}
        public Boolean success {get;set;}

        // GenericObject implementations
        public Id Id(){return this.id;}
        public String Name(){return this.Fields.name;}

        public Products(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'defaultImage') {
                            defaultImage = parser.readValueAs(Object.class);
                        } else if (text == 'error') {
                            error = new Error(parser);
                        } else if (text == 'fields') {
                            fields = new Fields(parser);
                        } else if (text == 'id') {
                            id = parser.getText();
                        } else if (text == 'sku') {
                            sku = parser.getText();
                        } else if (text == 'success') {
                            success = parser.getBooleanValue();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Products consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Fields {
        public String LastModifiedDate {get;set;} 
        public Object DisplayUrl {get;set;} 
        public String IsDeleted {get;set;} 
        public String Description {get;set;} 
        public String ProductCode {get;set;} 
        public String IsActive {get;set;} 
        public Object ExternalId {get;set;} 
        public String LastViewedDate {get;set;} 
        public Object UserRecordAccessId {get;set;} 
        public String LastReferencedDate {get;set;} 
        public String StockKeepingUnit {get;set;} 
        public String CurrencyIsoCode {get;set;} 
        public Object ExternalDataSourceId {get;set;} 
        public String Name {get;set;} 
        public String SystemModstamp {get;set;} 
        public String IsArchived {get;set;} 
        public Object Type {get;set;} 
        public String CreatedById {get;set;} 
        public Object QuantityUnitOfMeasure {get;set;} 
        public String CreatedDate {get;set;} 
        public String Family {get;set;} 
        public String ProductClass {get;set;} 
        public String LastModifiedById {get;set;} 
        public Object TaxPolicyId {get;set;} 

        public Fields(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'LastModifiedDate') {
                            LastModifiedDate = parser.getText();
                        } else if (text == 'DisplayUrl') {
                            DisplayUrl = parser.readValueAs(Object.class);
                        } else if (text == 'IsDeleted') {
                            IsDeleted = parser.getText();
                        } else if (text == 'Description') {
                            Description = parser.getText();
                        } else if (text == 'ProductCode') {
                            ProductCode = parser.getText();
                        } else if (text == 'IsActive') {
                            IsActive = parser.getText();
                        } else if (text == 'ExternalId') {
                            ExternalId = parser.readValueAs(Object.class);
                        } else if (text == 'LastViewedDate') {
                            LastViewedDate = parser.getText();
                        } else if (text == 'UserRecordAccessId') {
                            UserRecordAccessId = parser.readValueAs(Object.class);
                        } else if (text == 'LastReferencedDate') {
                            LastReferencedDate = parser.getText();
                        } else if (text == 'StockKeepingUnit') {
                            StockKeepingUnit = parser.getText();
                        } else if (text == 'CurrencyIsoCode') {
                            CurrencyIsoCode = parser.getText();
                        } else if (text == 'ExternalDataSourceId') {
                            ExternalDataSourceId = parser.readValueAs(Object.class);
                        } else if (text == 'Name') {
                            Name = parser.getText();
                        } else if (text == 'SystemModstamp') {
                            SystemModstamp = parser.getText();
                        } else if (text == 'IsArchived') {
                            IsArchived = parser.getText();
                        } else if (text == 'Type') {
                            Type = parser.readValueAs(Object.class);
                        } else if (text == 'CreatedById') {
                            CreatedById = parser.getText();
                        } else if (text == 'QuantityUnitOfMeasure') {
                            QuantityUnitOfMeasure = parser.readValueAs(Object.class);
                        } else if (text == 'CreatedDate') {
                            CreatedDate = parser.getText();
                        } else if (text == 'Family') {
                            Family = parser.getText();
                        } else if (text == 'ProductClass') {
                            ProductClass = parser.getText();
                        } else if (text == 'LastModifiedById') {
                            LastModifiedById = parser.getText();
                        } else if (text == 'TaxPolicyId') {
                            TaxPolicyId = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Fields consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public List<Products> products {get;set;} 
    public Integer total {get;set;} 

    public ProductsRestResponse(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'products') {
                        products = arrayOfProducts(parser);
                    } else if (text == 'total') {
                        total = parser.getIntegerValue();
                    } else {
                        System.debug(LoggingLevel.WARN, 'ProductsConnectApiRestResponse consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }

    public class Error {

        public Error(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        {
                            System.debug(LoggingLevel.WARN, 'Error consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public class Fields_Z {
        public String LastModifiedDate {get;set;} 
        public Object DisplayUrl {get;set;} 
        public String IsDeleted {get;set;} 
        public String Description {get;set;} 
        public String ProductCode {get;set;} 
        public String IsActive {get;set;} 
        public Object ExternalId {get;set;} 
        public Object LastViewedDate {get;set;} 
        public Object UserRecordAccessId {get;set;} 
        public Object LastReferencedDate {get;set;} 
        public String StockKeepingUnit {get;set;} 
        public String CurrencyIsoCode {get;set;} 
        public Object ExternalDataSourceId {get;set;} 
        public String Name {get;set;} 
        public String SystemModstamp {get;set;} 
        public String IsArchived {get;set;} 
        public Object Type {get;set;} 
        public String CreatedById {get;set;} 
        public Object QuantityUnitOfMeasure {get;set;} 
        public String CreatedDate {get;set;} 
        public String Family {get;set;} 
        public String ProductClass {get;set;} 
        public String LastModifiedById {get;set;} 
        public Object TaxPolicyId {get;set;} 

        public Fields_Z(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'LastModifiedDate') {
                            LastModifiedDate = parser.getText();
                        } else if (text == 'DisplayUrl') {
                            DisplayUrl = parser.readValueAs(Object.class);
                        } else if (text == 'IsDeleted') {
                            IsDeleted = parser.getText();
                        } else if (text == 'Description') {
                            Description = parser.getText();
                        } else if (text == 'ProductCode') {
                            ProductCode = parser.getText();
                        } else if (text == 'IsActive') {
                            IsActive = parser.getText();
                        } else if (text == 'ExternalId') {
                            ExternalId = parser.readValueAs(Object.class);
                        } else if (text == 'LastViewedDate') {
                            LastViewedDate = parser.readValueAs(Object.class);
                        } else if (text == 'UserRecordAccessId') {
                            UserRecordAccessId = parser.readValueAs(Object.class);
                        } else if (text == 'LastReferencedDate') {
                            LastReferencedDate = parser.readValueAs(Object.class);
                        } else if (text == 'StockKeepingUnit') {
                            StockKeepingUnit = parser.getText();
                        } else if (text == 'CurrencyIsoCode') {
                            CurrencyIsoCode = parser.getText();
                        } else if (text == 'ExternalDataSourceId') {
                            ExternalDataSourceId = parser.readValueAs(Object.class);
                        } else if (text == 'Name') {
                            Name = parser.getText();
                        } else if (text == 'SystemModstamp') {
                            SystemModstamp = parser.getText();
                        } else if (text == 'IsArchived') {
                            IsArchived = parser.getText();
                        } else if (text == 'Type') {
                            Type = parser.readValueAs(Object.class);
                        } else if (text == 'CreatedById') {
                            CreatedById = parser.getText();
                        } else if (text == 'QuantityUnitOfMeasure') {
                            QuantityUnitOfMeasure = parser.readValueAs(Object.class);
                        } else if (text == 'CreatedDate') {
                            CreatedDate = parser.getText();
                        } else if (text == 'Family') {
                            Family = parser.getText();
                        } else if (text == 'ProductClass') {
                            ProductClass = parser.getText();
                        } else if (text == 'LastModifiedById') {
                            LastModifiedById = parser.getText();
                        } else if (text == 'TaxPolicyId') {
                            TaxPolicyId = parser.readValueAs(Object.class);
                        } else {
                            System.debug(LoggingLevel.WARN, 'Fields_Z consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }

    public static ProductsRestResponse parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new ProductsRestResponse(parser);
    }

    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }

    private static List<Products> arrayOfProducts(System.JSONParser p) {
        List<Products> res = new List<Products>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Products(p));
        }
        return res;
    }

}