import { LightningElement, track, wire, api } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import INVENTORY_RESERVATION_CHANNEL from '@salesforce/messageChannel/InventoryReservationChannel__c';
import clearCart from '@salesforce/apex/ProductCategoryEnhancedController.clearCart';

export default class ReservationIndicator extends LightningElement {

    @api effectiveAccountId;
    @api recordId;
    @track reservationActive;
    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        this.subscribeToMessageChannel();
        this.reservationActive = localStorage.getItem('reservationActive') === 'true';
        if(this.reservationActive === true){
            this.start();
        }
    }

    subscribeToMessageChannel = () => {
        this.subscription = subscribe(this.messageContext, INVENTORY_RESERVATION_CHANNEL, (message) => {
            this.handleMessage(message);
        });
    }

    /**
     * TODO: Use your imagination here! A few ideas and pointers:
     * 1. Check the conditions against your state such as the time passing and change the message to something like "reservation expired"
     * 2. Add a count of the number of reservations in play and when each expires in a map displayed to the user
     * 3. Build a dynamic timer for live feedback on the shortest reservation which will expire soonest
     * 4. Warn the user in something that catches the eye when expiration is approaching
     * 5. Scan for other carts belonging to the user and warn them if there are reservations
     * 6. If however you approach this makes logical sense - clear the cart using something like below
     */
    start(event) {
        // This is effectively commented out until you can define and supply your own state tracking and checking logic
        if(false) {
            // Clear the cart when ready clearCart
            this.clearCart();
        }
    }

    handleMessage = (message) => {

        // Track state for the time resrvation was created
        this.startTime = message.time;

        // Track state for the reservation being active to update the display
        localStorage.setItem('reservationActive', 'true');

        // Track state for the effectiveAccountId
        localStorage.setItem('effectiveAccountId', this.effectiveAccountId);

        // Track a local copy of what was tracked in state
        this.reservationActive = true;

        this.start();
    }

    /**
     * TODO: Clear the cart - maybe when the reservation has expired?
     */
    clearCart = () => {

        clearCart({effectiveAccountId: this.effectiveAccountId})
            .then(
                (result) => {
                    console.log('clear cart result: ',result);
                })
            .catch(error => {
                    console.log('error' + JSON.stringify(error));
                    console.log('error2' + error);
                });
    }
}