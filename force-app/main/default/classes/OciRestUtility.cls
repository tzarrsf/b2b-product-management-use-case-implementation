/**
 * @description       : Helper class to facilitate Omnichannel Inventory REST calls and integrate them into other Apex code
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-13-2023
 * @last modified by  : Tom Zarr
**/

public class OciRestUtility {

    public static final Integer RESERVATION_EXPIRATION_IN_MINUTES = 120;

    public class MockCalloutForGetAvailability implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest httpRequest)
        {
            System.Debug('respond from MockCalloutForGetAvailability');
            HttpResponse httpResponse = new HttpResponse();
            httpResponse.setHeader('Content-Type', 'application/json');
            //String json = '{"errors":[],"locationGroups":[{"inventoryRecords":[{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-LEO"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-CANCER"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-CAPRICORN"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-ARIES"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-SCORPIO"}],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}{"errors":[],"locationGroups":[{"inventoryRecords":[{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-PITCH"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-OBSIDIAN"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-ONYX"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-SAMPLER"},{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-RAVEN"}],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}{"errors":[],"locationGroups":[{"inventoryRecords":[{"availableToFulfill":9.0,"availableToOrder":19.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":9.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"ID-PEM"},{"availableToFulfill":7.0,"availableToOrder":17.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":7.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PS-EL"},{"availableToFulfill":6.0,"availableToOrder":16.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":6.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"ESP-IOT-1"}],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}{"errors":[],"locationGroups":[{"inventoryRecords":[{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MRC-1"},{"availableToFulfill":8.0,"availableToOrder":18.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":8.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"CR-DEC"},{"availableToFulfill":7.0,"availableToOrder":17.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":7.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"DRW-1"}],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}{"errors":[],"locationGroups":[{"inventoryRecords":[{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PROSE"},{"availableToFulfill":6.0,"availableToOrder":16.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":6.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"TR-COFMAC-001"},{"availableToFulfill":8.0,"availableToOrder":18.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":8.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PS-INF"},{"availableToFulfill":10.0,"availableToOrder":20.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":10.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"B-C-COFMAC-001"}],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}';
            String header = '{"errors":[],"locationGroups":[{"inventoryRecords":[';
            String footer = '],"locationGroupIdentifier":"LocationGroup01"}],"locations":[],"success":true}';
            String[] recordsJson = new String[]
            {
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-LEO"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-CANCER"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-CAPRICORN"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-ARIES"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-MUG-SCORPIO"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-PITCH"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-OBSIDIAN"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-ONYX"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-SAMPLER"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MID-RST-RAVEN"}',
                '{"availableToFulfill":9.0,"availableToOrder":19.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":9.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"ID-PEM"}',
                '{"availableToFulfill":7.0,"availableToOrder":17.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":7.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PS-EL"}',
                '{"availableToFulfill":6.0,"availableToOrder":16.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":6.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"ESP-IOT-1"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"MRC-1"}',
                '{"availableToFulfill":8.0,"availableToOrder":18.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":8.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"CR-DEC"}',
                '{"availableToFulfill":7.0,"availableToOrder":17.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":7.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"DRW-1"}',
                '{"availableToFulfill":0.0,"availableToOrder":0.0,"futures":[],"onHand":0.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PROSE"}',
                '{"availableToFulfill":6.0,"availableToOrder":16.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":6.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"TR-COFMAC-001"}',
                '{"availableToFulfill":8.0,"availableToOrder":18.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":8.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"PS-INF"}',
                '{"availableToFulfill":10.0,"availableToOrder":20.0,"effectiveDate":"2023-07-01T21:05:22.790Z","futures":[{"expectedDate":"2023-08-18T07:00:00.000Z","quantity":10.0}],"onHand":10.0,"reserved":0.0,"safetyStockCount":0.0,"stockKeepingUnit":"B-C-COFMAC-001"}'
            };
            String json = header + String.join(recordsJson, ', ') + footer;
            httpResponse.setBody(json);
            httpResponse.setStatusCode(200);
            return httpResponse;
        }
    }

    public class MockCalloutForCreateReservation implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest httpRequest)
        {
            HttpResponse httpResponse = new HttpResponse();
            httpResponse.setHeader('Content-Type', 'application/json');
            String json = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
            httpResponse.setBody(json);
            httpResponse.setStatusCode(200);
            return httpResponse;
        }
    }

    /** Helper method for resolving Omnichannel Inventory REST endpoints  */
    private static String resolveOmnichannelInventoryEndPoint(String requestType) {
        System.debug('resolveOmnichannelInventoryEndPoint called with requestType: \'' + requestType + '\'...');
        String endPointBase = 'callout:OCI_NamedCredential';
        String endPoint = endPointBase;
        switch on requestType {
            when 'getAvailability' {
                endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/availability/availability-records/actions/get-availability';
            }
            /**
            TODO: These can be implemented and tested later if your solution requires them see the Postman collection for more:
            https://github.com/tzarrsf/omnichannel-inventory-postman-setup-with-example-files

            when 'uploadInventory' {
            	endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/availability-records/uploads';
            }
            when 'createReservation'{
            	endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/reservation/actions/reservations';
            }
            when 'releaseReservation'{
            	endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/reservation/actions/releases';
            }
            when 'fulfillReservation'{
            	endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/reservation/actions/fulfillments';
            }
            when 'transferReservation'{
            	endPoint = endPoint + '/services/data/' + AbstractRestUtility.API_VERSION + '/commerce/oci/reservation/actions/transfers';
            }
            */
            when else {
                endPoint = 'Unsupported requestType called in method resolveEndPoint';
                System.debug(endPoint);
            }
        }
        System.debug('resolveOmnichannelInventoryEndPoint called with requestType: \'' + requestType + '\' returning: \'' + endPoint + '\'');
        return endPoint;
    }

    /** Helper specific to the OCI Requests */
    public static List<Boolean> validateParameters(String[] locationGroupIdentifiers, String[] locationIdentifiers, String[] stockKeepingUnits) {
        System.debug('validateParameters called');
        List<Boolean> paramsAreEmpty = new List<Boolean>{false, false, false};
        paramsAreEmpty[0] = locationGroupIdentifiers == null || locationGroupIdentifiers.isEmpty();
        paramsAreEmpty[1] = locationIdentifiers == null || locationIdentifiers.isEmpty();
        paramsAreEmpty[2] = stockKeepingUnits == null || stockKeepingUnits.isEmpty();
        System.debug(paramsAreEmpty);
        if(!paramsAreEmpty[0] && !paramsAreEmpty[1]){
            throw new HandledException('Unable to use both locationGroupIdentifiers and '+
                                       'locationIdentifiers as parameters for inventory availability check');
        }
        if(paramsAreEmpty[0] && paramsAreEmpty[1]){
            throw new HandledException('At least one locationGroupIdentifier or locationIdentifier is '+
                                       'required to perform an inventory availability check');
        }
        if(paramsAreEmpty[2]){
            throw new HandledException('At least one SKU is required to perform an inventory availability check');
        }
        return paramsAreEmpty;
    }

    /**
     * Get the OCI availability levels based on locationGroupIdentifiers, locationIdentifiers and stockKeepingUnits. If an item is not available
     * a reservation cannot be made against it.
     */
    @AuraEnabled(cacheable=false)
    public static String getAvailability(String[] locationGroupIdentifiers, String[] locationIdentifiers, String[] stockKeepingUnits){
        System.debug('getAvailability called');
        String endPoint = resolveOmnichannelInventoryEndPoint('getAvailability');

        List<Boolean> paramsAreEmpty = validateParameters(locationGroupIdentifiers, locationIdentifiers, stockKeepingUnits);

        String httpRequestBody;
        if(paramsAreEmpty[1]) {
        	httpRequestBody='{"locationGroupIdentifiers": '+ JSON.serialize(locationGroupIdentifiers) +
                                ', "stockKeepingUnits": '+ JSON.serialize(stockKeepingUnits) + ', "useCache": "false"}';
        } else {
        	httpRequestBody='{"locationIdentifiers": ' + JSON.serialize(locationIdentifiers) +
                                ', "stockKeepingUnits": ' + JSON.serialize(stockKeepingUnits) + ', "useCache": "false"}';
        }
        System.debug('Sending httpRequestBody: \"' + httpRequestBody + '\' to  handleHTTPRequest method');

        // Capture any errors and log them as it can be a challenge to get the environment configured to support happy path execution
        String handleHTTPRequestResult;
        try{
            BaseRestUtility baseRestUtility = (Test.isRunningTest()) ? new BaseRestUtility(new MockCalloutForGetAvailability()) : new BaseRestUtility();
            handleHTTPRequestResult = baseRestUtility.handleHttpPostRequest(endPoint, httpRequestBody);
        }catch(Exception ex) {
            System.debug(ex);
            throw ex;
        }
        System.debug('handleHTTPRequestResult: ' + handleHTTPRequestResult);
        return handleHTTPRequestResult;
    }

    /**
     * Create an OCI Reservation
     */
    @AuraEnabled
    public static String createReservation(String locationIdentifier, Double quantity, String stockKeepingUnit) {
        System.debug('createReservation called with locationIdentifier: ' + locationIdentifier + ' quantity: ' + quantity + ' stockKeepingUnit: ' + stockKeepingUnit);

        String endPoint = resolveOmnichannelInventoryEndPoint('createReservation');

        String httpRequestBody = '{'+
                                    '"actionRequestId": "' + BaseRestUtility.generateUUID()+'",'+
            						'"expirationSeconds": "' + RESERVATION_EXPIRATION_IN_MINUTES * 60 + '",' +
                                    '"createRecords": [{"locationIdentifier": "' + locationIdentifier +
                                    '","quantity": "' + quantity + '", "stockKeepingUnit": "' + stockKeepingUnit + '"}]'+
                                    '}';

        // Capture any errors and log them as this can be a challenge to get the environment configured accurately so this block executes
        String handleHTTPRequestResult;
        try{
            BaseRestUtility baseRestUtility = (Test.isRunningTest()) ? new BaseRestUtility(new MockCalloutForCreateReservation()) : new BaseRestUtility();
            handleHTTPRequestResult = baseRestUtility.handleHttpPostRequest(endPoint, httpRequestBody);
        }catch(Exception ex) {
            System.debug(ex);
            throw ex;
        }

        return handleHTTPRequestResult;
    }
}