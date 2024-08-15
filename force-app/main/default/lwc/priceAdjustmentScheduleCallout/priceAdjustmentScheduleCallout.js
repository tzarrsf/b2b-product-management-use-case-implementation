import { LightningElement, api} from 'lwc';
import getAccountInfo from '@salesforce/apex/AccountDetailController.getAccountInfo';
import getAdjSchedulesByProdugetPriceAdjSchedulesByProductViaApictViaApi from '@salesforce/apex/PriceAdjustmentScheduleController.getPriceAdjSchedulesByProductViaApi';

export default class PriceAdjustmentScheduleCallout extends LightningElement {

    /** Tracker for the product Id to be passed along for the Price Adjustment Schedule search */
    @api productId;

    /**
     * Tracker variable for the target config of the same name in the meta file
     */
    effectiveAccountId;
    priceAdjustmentSchedules = [];
    hasResult;
    bannerMessage;

    /**
     * Get the Account Detail Info from the controller for the User context to assign an effective account id before loading products
     */
    connectedCallback(){
        //TODO: Figure out what's going on here
        if(this.effectiveAccountId === null) {
            console.info('connectedCallback');
            //TODO: Remove this call - should not be needed if we can pass it down from the parent
            getAccountInfo()
                .then(response => {
                    console.info('response.Id: ' + response.Id);
                    this.effectiveAccountId = response.Id;
                })
                .catch(error => {
                    console.error('error' + error);
                    console.error('error2' + JSON.stringify(error));
                });
        }
        this.loadPriceSchedules();
    }

    /**
     * Load the products by the record Id, that is, the target config of the same name which is a category Id
     * and shuffle this data over to the initializeQuantities method being sure to handle errors along the way
     */
    loadPriceSchedules = () => {
        console.error('getPriceAdjustmentSchedulesByProductAndEffectiveAccount call:' );
        console.error('this.productId: ' + this.productId );
        console.error('this.effectiveAccountId: ' + this.effectiveAccountId );
        getPriceAdjustmentSchedulesByProductAndEffectiveAccount({productId: this.productId, effectiveAccountId: this.effectiveAccountId})
            .then(
                (result) => {
                    this.priceAdjustmentSchedules = result;
                    try {
                        this.initializeBulkPricingAvailibility();
                    }
                    catch(error1) {
                        console.error('error: ' + error1);
                        console.error('error2' + JSON.stringify(error1));
                    }
                    this.hasResult = this.priceAdjustmentSchedules.length > 0;
                })
                .catch(error => {
                    console.error('error: ' + error);
                    console.error('error2: ' + JSON.stringify(error));
                });
    }

    /**
     * Handle the available quantities marking things as unavailable for order if there's no inventory to support it
     */
    initializeBulkPricingAvailibility = () => {
        this.bannerMessage = '';

        if(this.priceAdjustmentSchedules.length > 0) {
            this.bannerMessage = 'Bulk pricing available through our \"' + this.priceAdjustmentSchedules[0].name +  '\"';
        }
    }
}