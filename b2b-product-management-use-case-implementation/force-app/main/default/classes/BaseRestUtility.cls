/**
 * @description       : Helper class to facilitate generic REST calls and integrate them into other Apex code
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-13-2023
 * @last modified by  : Tom Zarr
**/
public class BaseRestUtility {
    /** Central toggle for turning on System.Debug calls to ease debugging efforts. Used in the debugCallSignature and debugReturn methods. */
    public static final Boolean IS_DEBUG_ACTIVE = true;
    /** The version of the API in use */
    public static final String API_VERSION = 'v58.0';
    /**HTTP POST Method */
    public static final String METHOD_POST = 'POST';
    /**HTTP GET Method */
    public static final String METHOD_GET = 'GET';
    /** Header key to set the Content Type for REST + JSON */
    public static final String CONTENT_TYPE_HEADER_KEY = 'Content-Type';
    /** Header value to set the Content Type for REST + JSON */
    public static final String CONTENT_TYPE_HEADER_VALUE = 'application/json;  charset=utf-8';
    /** Lowest possible value for a valid REST call */
    public static final Integer HTTP_STATUS_OK_LOW = 200;
    /** Highest possible value for a valid REST call  */
    public static final Integer HTTP_STATUS_OK_HIGH = 204;
    /** The reservation expiration time in minutes */

    HttpCalloutMock httpCalloutImplementer;

    public BaseRestUtility() {
        this(null);
    }

    public BaseRestUtility(HttpCalloutMock calloutImplementation) {
        // Use the interface for late binding here to support test vs production
        this.httpCalloutImplementer = (Test.isRunningTest() && calloutImplementation != null)
            ? calloutImplementation
            : new RealCallout();
    }

    /** Support for the HttpCalloutMock so controllers can support unit testing with mocks using an on-the-fly provider switch that
     * the tests don't need to track
     */
    public class RealCallout implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest httpRequest) {
            Http http = new Http();
            HttpResponse httpResponse = http.send(httpRequest);
            return httpResponse;
        }
    }

    /** Utility method for generating a UUID on the fly */
    public static String generateUUID() {
        System.debug('generateUUID called');
        Blob b = Crypto.GenerateAESKey(128);
        String h = EncodingUtil.ConvertTohex(b);
        String uuid = h.SubString(0,8)+ '-' + h.SubString(8,12) + '-' + h.SubString(12,16) + '-' + h.SubString(16,20) + '-' + h.substring(20);
        System.debug('generateUUID returning uuid: ' + uuid);
        return uuid;
    }

    /** Helper method for handling generic HTTP Post requests and getting the raw response */
    public String handleHttpPostRequest(String endpoint, String body) {
        if(IS_DEBUG_ACTIVE){
            System.debug('handleHTTPRequest called with endpoint: \'' + endpoint + '\' body: \'' + body + '\'...');
        }

        String response;
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod(METHOD_POST);
        httpRequest.setHeader(CONTENT_TYPE_HEADER_KEY, CONTENT_TYPE_HEADER_VALUE);
        httpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        httpRequest.setEndpoint(endpoint);
        httpRequest.setBody(body);

        try {
            HttpResponse httpResponse = this.httpCalloutImplementer.respond(httpRequest);
            Integer statusCode = httpResponse.getStatusCode();
            if (statusCode >= HTTP_STATUS_OK_LOW && statusCode <= HTTP_STATUS_OK_HIGH) {
                    response = httpResponse.getBody();
            } else {
                    throw new CalloutException(httpResponse.getBody());
            }
        } catch (System.Exception e) {
            String msg = e.getMessage();
            System.debug(msg);
            return msg;
        }

        if(IS_DEBUG_ACTIVE) {
            System.debug('handleHTTPRequest called with endpoint: \'' + endpoint + '\' body: ' + body + ' returning json: \'\r\n' + response + '\'\r\n');
        }

        return response;
    }

    /** Helper method for handling generic HTTP Get requests and getting the raw response */
    public String handleHttpGetRequest(String endpoint) {
        if(IS_DEBUG_ACTIVE)
            System.debug('handleHttpGetRequest called with endpoint: \'' + endpoint + '\'');

        String response;
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod(METHOD_GET);
        httpRequest.setHeader(CONTENT_TYPE_HEADER_KEY, CONTENT_TYPE_HEADER_VALUE);
        String sessionId = UserInfo.getSessionId();
        httpRequest.setHeader('Authorization', 'Bearer ' + sessionId);
        httpRequest.setEndpoint(endpoint);

        try {
            Http http = new Http();
            HttpResponse httpResponse = this.httpCalloutImplementer.respond(httpRequest);
            Integer statusCode = httpResponse.getStatusCode();
            if (statusCode >= HTTP_STATUS_OK_LOW && statusCode <= HTTP_STATUS_OK_HIGH) {
                    response = httpResponse.getBody();
            } else {
                    throw new CalloutException(httpResponse.getBody());
            }
        } catch (System.Exception e) {
            String msg = e.getMessage();
            System.debug(msg);
            return msg;
        }

        if(IS_DEBUG_ACTIVE) {
            System.debug('handleHttpGetRequest called with endpoint: \'' + endpoint + '\' returning json: \'\r\n' + response + '\'\r\n');
        }

        return response;
    }
}