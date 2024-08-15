/**
 * @description       : Object representation for the endpoint at: /commerce/webstores/webstoreId/pricing/products/productId
 * 						Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public class PriceAdjScheduleRestResponse {
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

	public class PricingLineItemResults implements GenericObject {
		public Error error {get;set;} 
		public String listPrice {get;set;} 
		public String pricebookEntryId {get;set;} 
		public String productId {get;set;} 
		public Boolean success {get;set;} 
		public String unitPrice {get;set;} 

		// GenericObject implementations
        public Id Id(){return this.pricebookEntryId;}
        public String Name(){return this.unitPrice;}

		public PricingLineItemResults(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'error') {
							error = new Error(parser);
						} else if (text == 'listPrice') {
							listPrice = parser.getText();
						} else if (text == 'pricebookEntryId') {
							pricebookEntryId = parser.getText();
						} else if (text == 'productId') {
							productId = parser.getText();
						} else if (text == 'success') {
							success = parser.getBooleanValue();
						} else if (text == 'unitPrice') {
							unitPrice = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'PricingLineItemResults consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}

	public String currencyIsoCode {get;set;} 
	public Error error {get;set;} 
	public List<PricingLineItemResults> pricingLineItemResults {get;set;} 
	public Boolean success {get;set;} 

	public PriceAdjScheduleRestResponse(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'currencyIsoCode') {
						currencyIsoCode = parser.getText();
					} else if (text == 'error') {
						error = new Error(parser);
					} else if (text == 'pricingLineItemResults') {
						pricingLineItemResults = arrayOfPricingLineItemResults(parser);
					} else if (text == 'success') {
						success = parser.getBooleanValue();
					} else {
						System.debug(LoggingLevel.WARN, 'PriceAdjustmentScheduleConnectAp consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}

	public static PriceAdjScheduleRestResponse parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new PriceAdjScheduleRestResponse(parser);
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

    private static List<PricingLineItemResults> arrayOfPricingLineItemResults(System.JSONParser p) {
        List<PricingLineItemResults> res = new List<PricingLineItemResults>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new PricingLineItemResults(p));
        }
        return res;
    }
}