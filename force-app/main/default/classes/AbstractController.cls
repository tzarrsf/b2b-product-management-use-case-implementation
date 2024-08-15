/**
 * @description       : Template for other sObject controllers which provides some basic functionality for sample code in the Partner Learning Camp.
 *                      There isn't any real OOP / inheritance magic going on since the deriving controllers are static to facilitate using them in
 *                      Lightning Web Components, but it keeps a singular definition around for handy utilty methods if you extend from this class.
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 03-13-2024
 * @last modified by  : Tom Zarr
**/
public abstract class AbstractController {

    /** Central toggle for turning on System.Debug calls to ease debugging efforts. Used in the debugCallSignature and debugReturn methods. */
    public static final Boolean IS_DEBUG_ACTIVE = true;

    /** The API version for REST calls */
    public static final String API_VERSION_FOR_REST = '58.0';

    /** Base URI for on-platform REST calls */
    public static final String ORG_BASE_URI = URL.getOrgDomainUrl().toExternalForm();

    /** The Web Store (Commerce Store) Name such as 'B2B LWR Enhanced Store from TSO' viewable on the Store's record page in the
     * Commerce app - may or may not be the same as NETWORK_NAME depending on how the store is set up.
    */
    public static final String WEB_STORE_NAME = 'B2B LWR Enhanced Store from TSO';

    /** The Experience Site Name such as 'B2B LWR Enhanced Store from TSO' viewable in Setup > All Sites - May or may not be the
    * same as WEB_STORE_NAME depending on how the Store was set up.
    */
    public static final String NETWORK_NAME = 'B2B LWR Enhanced Store from TSO';

    /** The Price Book Name used to match Pricebook2.Name like 'B2B LWR Enhanced Store from TSO Price Book' - viewable from the
    * Pricing tile of the Store's record page in the Commerce app.
    */
    public static final String STORE_PRICEBOOK = 'B2B LWR Enhanced Store from TSO Price Book';

    /**
     * The Pricebook names for the Store - Only the Strikethrough one should have a Price Schedule associated but both are included
     * for reference in case they're needed.
     */
    public static final String [] PRICE_BOOK_NAMES = new String[] {
        STORE_PRICEBOOK,
        'B2B LWR Enhanced Store from TSO Strikethrough Price Book'
    };

    public static void debug(String msg) {
        if(IS_DEBUG_ACTIVE)
            return;
        System.debug(msg);
    }

    /**
     * Utility method for logging method invocation details when no args are passed
     */
    public static String debugCallSignature(String methodName) {
        String msg = runningAs() + ' calling ' + methodName;
        debug(msg);
        return msg;
    }

    /**
     * Utility method for logging method invocation details when a collection of type String is passed
     */
    public static String debugCallSignature(String methodName, List<String> stringListArg) {
        String msg = runningAs() + ' calling ' + methodName + ' with list size: ' + stringListArg.size() + ' and first: \'' + firstElement(stringListArg) +  + '\'' + ' last: \'' + lastElement(stringListArg);
        debug(msg);
        return msg;
    }

    /**
     * Utility method for logging method invocation details when a single String is passed
     */
    public static String debugCallSignature(String methodName, String stringArg) {
        String msg = runningAs() + ' calling ' + methodName + ' with: \'' + stringArg + '\'';
        debug(msg);
        return msg;
    }

    /**
     * Utility method for logging method invocation details when a collection of type sObject is passed
     */
    public static String debugCallSignature(String methodName, List<SObject> sObjectListArg) {
        String msg = runningAs() + ' calling ' + methodName + ' with list size: ' + sObjectListArg.size() + ' first: \'' + firstElement(sObjectListArg) +  '\'' + ' last: \'' + lastElement(sObjectListArg);
        debug(msg);
        return msg;
    }

    /**
     * Utility method for logging method invocation details when a single sObject is passed
     */
    public static String debugCallSignature(String methodName, SObject sObjectArg) {
        String msg = runningAs() + ' calling ' + methodName + ' with: \'' + objectToString(sObjectArg) + '\'';
        debug(msg);
        return msg;
    }

    /**
     * Utility method for logging return details for a call when the return type is a collection of type string
     */
    public static void debugReturn(String signature, List<String> stringListArg) {
        debug(signature + ' returning list size: ' + stringListArg.size() + ' first: \'' + firstElement(stringListArg) + '\'' + ' last: \'' + lastElement(stringListArg));
    }

    /**
     * Utility method for logging return details for a call when the return type is a single string
     */
    public static void debugReturn(String signature, String stringArg) {
        debug(signature + ' returning: \' ' + stringArg + '\'');
    }

    /**
     * Utility method for logging return details for a call when the return type is a collection of type string
     */
    public static void debugReturn(String signature, List<SObject> stringListArg) {
        debug(signature + ' returning list size: ' + stringListArg.size() + ' first: \'' + firstElement(stringListArg) + '\'' + ' last: \'' + lastElement(stringListArg));
    }

    /**
     * Utility method for logging return details for a call when the return type is a collection of type string
     */
    public static void debugReturn(String signature, List<GenericObject> genericObjectList) {
        debug(signature + ' returning list size: ' + genericObjectList.size() + ' first: \'' + firstElement(genericObjectList) + '\'' + ' last: \'' + lastElement(genericObjectList));
    }

    /**
     * Utility method for logging return details for a call when the return type is a single sObject
     */
    public static void debugReturn(String signature, SObject sObjectArg) {
        debug(signature + ' returning: \'' + sObjectArg + '\'');
    }

    /**
     * Utility method to get the Id and Name from an sObject
     */
    public static String objectToString(SObject theSObject) {
        return theSObject.Id + ' - ' + theSObject.get('Name') + '';
    }

    /**
     * Utility method to get the Id and Name via fields from an Object with Fields such as from a REST response
     */
    public static String objectToString(GenericObject genericObject) {
        return genericObject.Id() + ' - ' + genericObject.Name() + '';
    }

    /**
     * Utility method to get the Id and Name for the first element of a List
     */
    public static String firstElement(List<SObject> theSObjectList) {
        if(theSObjectList.isEmpty())
            return null;
        return objectToString(theSObjectList[0]);
    }

    /**
     * Utility method to get the Id and Name for the first element of a GenericObject such as from a REST response
     */
    public static String firstElement(List<GenericObject> genericObjectList) {
        if(genericObjectList.isEmpty())
            return null;
        return objectToString(genericObjectList[0]);
    }

    /**
     * Utility method to get the first element in a List of Strings
     */
    public static String firstElement(List<String> stringList) {
        if(stringList.isEmpty())
            return null;
        return stringList[0];
    }

    /**
     * Utility method to get the Id and Name for the last element of a List
     */
    public static String lastElement(List<SObject> theSObjectList) {
        if(theSObjectList.isEmpty())
            return null;
        return objectToString(theSObjectList[theSObjectList.size() - 1]);
    }

    /**
     * Utility method to get the Id and Name for the last element of a List of a GenericObject such as from a REST response
     */
    public static String lastElement(List<GenericObject> genericObjectList) {
        if(genericObjectList.isEmpty())
            return null;
        return objectToString(genericObjectList[genericObjectList.size() - 1]);
    }

    /**
     * Utility method to get the last element in a List of Strings
     */
    public static String lastElement(List<String> stringList) {
        if(stringList.isEmpty())
            return null;
        return stringList[stringList.size() - 1];
    }

    /**
     * Utility method to stamp who is calling the method
     */
    public static String runningAs() {
        return UserInfo.getName() + ' (' + UserInfo.getUserName() + ')';
    }
}