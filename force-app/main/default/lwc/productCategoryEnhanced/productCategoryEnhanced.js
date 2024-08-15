import { LightningElement, api} from 'lwc';
import { publish } from 'lightning/messageService';
import getProductsByCategoryIdAlias from '@salesforce/apex/ProductCategoryEnhancedController.getProductsByCategoryIdViaDatabase';
import createReservation from '@salesforce/apex/OciRestUtility.createReservation';
import addToCart from '@salesforce/apex/ProductCategoryEnhancedController.addToCart';
import getAccountInfo from '@salesforce/apex/AccountDetailController.getAccountInfo';
import INVENTORY_RESERVATION_CHANNEL from '@salesforce/messageChannel/InventoryReservationChannel__c';

export default class ProductCategoryEnhanced extends LightningElement {

    /**
     * The channel Id for where your product images are sourced from
     */
    TODO_FIX_THIS_CMS_CHANNEL_IDENTIFIER = "/sfsites/c/cms/delivery/media/MC7543TYRG2JC5ZDMY3QYTZI3TXQ?version=1.1&channelId=0apHn000000bqmh";

    /**
     * The location identifier for an individual location such as 'Warehouse01' in Salesforce Order Management and Omnichannel Inventory.
     */
    LOCATION_IDENTIFIER = 'Warehouse01';

    /**
     * A resulting getProductsByCategoryId call should include images from CMS if set to true
    */
    INCLUDE_IMAGES = true;

    /**
     * Tracker variable for the target config of the same name in the meta file
     */
    @api recordId;

    /**
     * Tracker variable for the target config of the same name in the meta file
     */
    @api effectiveAccountId;
    effectiveAccountName;
    account;
    products = [];
    productQuantities = [];
    hasResult;
    addToCartSuccess;
    messageContext;

    /**
     * Get the Account Detail Info from the controller for the User context to assign an effective account id before loading products
     */
    renderedCallback() {
        console.info('getAccountInfo');
        if(this.effectiveAccountId === null) {
            getAccountInfo()
                .then((result) => {
                    console.info('getAccountInfo then...');
                    this.account = result;
                    console.info(`getAccountInfo result: + ${JSON.stringify(this.account)}`);
                    this.effectiveAccountId = this.account.Id;
                    this.effectiveAccountName = this.account.Name;
                    this.error = undefined;
                    this.loadProducts();
                })
                .catch((error) => {
                    console.info('getAccountInfo catch...');
                    this.error = error;
                    this.account = undefined;
                    this.effectiveAccountId = undefined;
                    this.effectiveAccountName = undefined;
                });
        }
        else {
            this.loadProducts();
        }
    }

    /**
     * Load the products by the record Id, that is, the target config of the same name which is a category Id
     * and shuffle this data over to the initializeQuantities method being sure to handle errors along the way
     */
    loadProducts = () => {
        getProductsByCategoryIdAlias({categoryId: this.recordId, includeImages: this.INCLUDE_IMAGES})
            .then((result) => {
                this.products = [];
                this.products = result;
                this.error = undefined;
                this.hasResult = this.products.length > 0;
                this.initializeQuantities();
            })
            .catch((error) => {
                this.error = error;
                this.products = undefined;
            });
    }

    /**
     * Handle the available quantities marking things as unavailable for order if there's no inventory to support it
     */
    initializeQuantities = () => {
        this.products.forEach((product) => {
            console.warn("product.Name: " + product.Name);
            console.warn("product.name: " + product.name);
            //this.productQuantities.push({productId: product.id, qty: 1});
            //product.unavailable = product.availableToOrder <= 0;
        });
    }

    /**
     * Invoke the addToCart method imported from the ProductCategoryEnhancedController class
     * @param {*} productId
     * @param {*} price
     * @param {*} quantity
     */
    addToCart = (productId, price, quantity) => {
        addToCart({effectiveAccountId: this.effectiveAccountId,
                    productId: productId,
                    price: price,
                    quantity: quantity})
            .then(
                (result) => {
                    console.log('addToCart result:', result)
                    this.addToCartSuccess = result === 'success';
                    this.createReservation(productId, quantity);
                })
            .catch(error => {
                console.log('error' + error);
                console.log('error2' + JSON.stringify(error));
                });
    }

    /**
     * Create a reservation for a product with a given quantity
     * @param {*} productId
     * @param {*} quantity
     */
    createReservation = (productId, quantity) => {
        let product = this.products.find((product) => {
            return product.id == productId;
        });
        let sku = product.sku;
        createReservation({locationIdentifier: this.LOCATION_IDENTIFIER,
                            quantity: quantity,
                            stockKeepingUnit: sku})
            .then(
                (result) => {
                    let results = JSON.parse(result);
                    console.log(results);
                })
            .catch(error => {
                console.log('error' + JSON.stringify(error));
                });
    }

    /**
     * Provides support for adding to the cart from the Product Category page by ultimately invoking this
     * component's addTOCart method and uncerlying controller's method and then publishing an inventory reservation.
     * @param {*} e 
     */
    handleAddToCart = (e) => {
        console.log('EFFECTIVE ACCOUNT ID', this.effectiveAccountId);
        let productId = e.target.getAttribute('data-id');
        let product = this.products.find(product => product.id == productId);
        let qtyObject = this.productQuantities.find((productQty) => {
            return productQty.productId == productId;
        });
        this.addToCart(productId, product.price, qtyObject.qty);
        const payload = { productId: productId, time: Date.now(), effectiveAccountId: this.effectiveAccountId };
        publish(this.messageContext,INVENTORY_RESERVATION_CHANNEL, payload);
    }

    /**
     * Handles the click event from the OK button presented when the "Item added to cart!" message is displayed and
     * resets the state for addToCartSuccess
     */
    handleOkButton = () => {
        this.addToCartSuccess = false;
    }

    /**
     * Handle the event bubbled up from the quantitySelector component and update the display by seeking the id's index
     * and assigning the new quantity to the product
     */
    handleQtyChange = (e) => {
        let id = e.detail.id.split('-')[0];
        let index = this.productQuantities.findIndex((productQty) => {
            return productQty.productId == id;
        });
        this.productQuantities[index].qty = e.detail.qty;
    }
}