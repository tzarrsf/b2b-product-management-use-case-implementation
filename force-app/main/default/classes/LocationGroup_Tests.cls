/**
 * @description       : Tests for the LocationGroup object - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 09-08-2023
 * @last modified by  : Tom Zarr
**/
@IsTest
public class LocationGroup_Tests {

    @IsTest(SeeAllData=true)
    static void testLocationGroupsNotEmpty() {

        List<LocationGroup> locationGroups = [
            SELECT
                Id,
                Description,
                ExternalReference,
                IsEnabled,
                LocationGroupName
            FROM
                LocationGroup
            WITH
                SECURITY_ENFORCED
        ];

        System.assert(!locationGroups.isEmpty(), 'locationGroups not found. You may need to create one for: ' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '.');
    }

    @IsTest(SeeAllData=true)
    static void testExpectedLocationGroupExistsWithExpectedData() {

        List<LocationGroup> locationGroups = [
            SELECT
                Id,
                Description,
                ExternalReference,
                IsEnabled,
                LocationGroupName
            FROM
                LocationGroup
            WHERE
                LocationGroupName = :TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME
            WITH
                SECURITY_ENFORCED
        ];

        System.assert(locationGroups.size() == 1, 'locationGroups by Name is not size 1 when using LocationGroupName: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
        System.assert(locationGroups[0].Description != null, 'Description is null');
        System.assert(locationGroups[0].Description == TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME, 'LocationGroupName is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
        System.assert(locationGroups[0].ExternalReference != null, 'ExternalReference is null');
        System.assert(locationGroups[0].ExternalReference == TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME, 'ExternalReference is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
        System.assert(locationGroups[0].IsEnabled != null, 'IsEnabled is null');
        System.assert(locationGroups[0].IsEnabled == true, 'IsEnabled is not true');
        System.assert(locationGroups[0].LocationGroupName != null, 'LocationGroupName is null');
        System.assert(locationGroups[0].LocationGroupName == TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME, 'LocationGroupName is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
    }

    @IsTest(SeeAllData=true)
    static void testLocationGroupContainsExpectedLocation() {

        List<LocationGroup> locationGroups = [
            SELECT
                Id,
                Description,
                ExternalReference,
                IsEnabled,
                LocationGroupName
            FROM
                LocationGroup
            WHERE
                LocationGroupName = :TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME
            WITH
                SECURITY_ENFORCED
        ];

        System.assert(locationGroups.size() == 1, 'locationGroups by Name is not size 1 when using LocationGroupName: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');

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

        List<LocationGroupAssignment> locationGroupAssignments = [
            SELECT
                Id,
                LocationExternalReference,
                LocationGroupAssignment,
                LocationGroupExternalReference,
                LocationGroupId,
                LocationGroupName,
                LocationId,
                LocationName
            FROM
                LocationGroupAssignment
            WHERE
                LocationGroupId = :locationGroups[0].Id
                AND LocationId = :locations[0].Id
        ];

        System.assert(locations.size() == 1, 'locationGroupAssignments is not size 1 when using LocationGroupId: \'' + locationGroups[0].Id + ' and LocationId: ' + locations[0].Id + '\'');
        System.assert(locationGroupAssignments[0].LocationExternalReference != null, 'LocationExternalReference is null');
        System.assert(locationGroupAssignments[0].LocationExternalReference == TestSettings.KNOWN_GOOD_LOCATION_NAME, 'LocationExternalReference is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locationGroupAssignments[0].LocationName != null, 'LocationName is null');
        System.assert(locationGroupAssignments[0].LocationName == TestSettings.KNOWN_GOOD_LOCATION_NAME, 'LocationName is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_NAME + '\'');
        System.assert(locationGroupAssignments[0].LocationGroupExternalReference != null, 'LocationGroupExternalReference is null');
        System.assert(locationGroupAssignments[0].LocationGroupExternalReference == TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME, 'LocationGroupExternalReference is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
        System.assert(locationGroupAssignments[0].LocationGroupName != null, 'LocationGroupName is null');
        System.assert(locationGroupAssignments[0].LocationGroupName == TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME, 'LocationGroupName is not: \'' + TestSettings.KNOWN_GOOD_LOCATION_GROUP_NAME + '\'');
    }
}