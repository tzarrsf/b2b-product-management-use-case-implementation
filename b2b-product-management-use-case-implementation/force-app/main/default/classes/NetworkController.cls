/**
 * @description       : Network Controller class - Sample code for Partner Learning Camp training material
 * @author            : Tom Zarr
 * @group             : Salesforce Commerce Partner Readiness (2023)
 * @last modified on  : 08-21-2023
 * @last modified by  : Tom Zarr
**/
public with sharing class NetworkController extends AbstractController {

    /**
     * Get the Network for the given Name. This is the top level Experience Cloud Site entity which ties into a storefront
     * such as "B2B LWR Enhanced Store from TSO."
     */
    public static Network getNetworkByName(String name) {
        String signature = debugCallSignature('getNetworkByName', name);

        // Get the Network entity (Experience Cloud Site) by the given Name
        Network network = [
            SELECT
                Id
                ,Name
                ,Description
                ,AllowedExtensions
                ,CaseCommentEmailTemplateId
                ,ChangePasswordEmailTemplateId
                ,ChgEmailVerNewEmailTemplateId
                ,ChgEmailVerOldEmailTemplateId
                ,CreatedById
                ,CreatedDate
                ,DeviceActEmailTemplateId
                ,EmailFooterLogoId
                ,EmailFooterText
                ,EmailSenderAddress
                ,EmailSenderName
                ,FirstActivationDate
                ,ForgotPasswordEmailTemplateId
                ,HeadlessForgotPasswordTemplateId
                ,LastModifiedById
                ,LastModifiedDate
                ,LockoutEmailTemplateId
                ,MaxFileSizeKb
                ,NewSenderAddress
                ,SelfRegMicroBatchSubErrorEmailTemplateId
                ,SelfRegProfileId
                ,Status
                ,SystemModstamp
                ,UrlPathPrefix
                ,VerificationEmailTemplateId
                ,WelcomeEmailTemplateId
            FROM
                Network
            WHERE
                Name = :name
            WITH
                SECURITY_ENFORCED
        ];

        Assert.isNotNull(network, 'network was null: ' + signature);
        debugReturn(signature, network);
        return network;
    }

    /**
     * Get the Network for the given Id. This is the top level Experience Cloud Site entity which ties into a storefront
     * such as "0DBHn000000khwCOAQ"
     */
    public static Network getNetworkById(Id id) {
        String signature = debugCallSignature('getNetworkById', id);

        // Get the Network entity (Experience Cloud Site) by the given Name
        Network network = [
            SELECT
                Id
                ,Name
                ,Description
                ,AllowedExtensions
                ,CaseCommentEmailTemplateId
                ,ChangePasswordEmailTemplateId
                ,ChgEmailVerNewEmailTemplateId
                ,ChgEmailVerOldEmailTemplateId
                ,CreatedById
                ,CreatedDate
                ,DeviceActEmailTemplateId
                ,EmailFooterLogoId
                ,EmailFooterText
                ,EmailSenderAddress
                ,EmailSenderName
                ,FirstActivationDate
                ,ForgotPasswordEmailTemplateId
                ,HeadlessForgotPasswordTemplateId
                ,LastModifiedById
                ,LastModifiedDate
                ,LockoutEmailTemplateId
                ,MaxFileSizeKb
                ,NewSenderAddress
                ,SelfRegMicroBatchSubErrorEmailTemplateId
                ,SelfRegProfileId
                ,Status
                ,SystemModstamp
                ,UrlPathPrefix
                ,VerificationEmailTemplateId
                ,WelcomeEmailTemplateId
            FROM
                Network
            WHERE
                Id = :id
            WITH
                SECURITY_ENFORCED
        ];

        Assert.isNotNull(network, 'network was null: ' + signature);
        debugReturn(signature, network);
        return network;
    }
}