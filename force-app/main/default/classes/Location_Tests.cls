/**
 * @description       : Tests for the Location object - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-08-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class Location_Tests {

    @IsTest(SeeAllData=true)
    static void testLocationsNotEmpty() {

        List<Schema.Location> locations = [
            SELECT
                Id,
                Name,
                Description,
                ShouldSyncWithOci,
                ExternalReference,
                IsInventoryLocation,
                IsMobile,
                Latitude,
                Location,
                LocationLevel,
                LocationType,
                LogoId,
                Longitude,
                OpenDate
            FROM
                Location
            WITH
                SECURITY_ENFORCED
        ];

        System.assert(!locations.isEmpty(), 'locations not found. You may need to create one for: ' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '.');
    }

    @IsTest(SeeAllData=true)
    static void testExpectedLocationGroupExistsByNameWithExpectedData() {

        List<Schema.Location> locations = [
            SELECT
                Id,
                Name,
                Description,
                ShouldSyncWithOci,
                ExternalReference,
                IsInventoryLocation,
                IsMobile,
                Latitude,
                Location,
                LocationLevel,
                LocationType,
                LogoId,
                Longitude,
                OpenDate
            FROM
                Location
            WHERE
                Name = :TestSettings.KNOWN_GOOD_LOCATION_NAME
            WITH
                SECURITY_ENFORCED
        ];

        System.assert(locations.size() == 1, 'locations by Name is not size 1 when using LocationGroupName: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locations[0].Name != null, 'Name is null');
        System.assert(locations[0].Name == TestSettings.KNOWN_GOOD_LOCATION_NAME, 'Name is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locations[0].Description != null, 'Description is null');
        System.assert(locations[0].Description == TestSettings.KNOWN_GOOD_LOCATION_NAME, 'Description is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locations[0].ShouldSyncWithOci == true, 'ShouldSyncWithOci is not true for: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locations[0].ExternalReference != null, 'ExternalReference is null');
        System.assert(locations[0].ExternalReference == TestSettings.KNOWN_GOOD_LOCATION_NAME, 'ExternalReference is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
    }
}