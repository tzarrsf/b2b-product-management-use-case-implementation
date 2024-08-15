import { LightningElement, api } from 'lwc';

export default class QuantitySelector extends LightningElement {
    @api maxQty;
    @api id;
    @api displayZero;
    @api addInitialToMax;
    @api initialQty;
    amounts = [];
    selectedQty;
    isClicked;
    selectClass;

    connectedCallback(){
        this.maxQty = this.addInitialToMax === "true" ? this.maxQty + this.initialQty : this.maxQty;
        this.selectClass = this.maxQty == 0 ?  'slds-select disabled' : 'slds-select';
        let amountArray = [ ...Array(this.maxQty).keys() ].map( i => i+1);
        if(this.displayZero){
            amountArray.unshift(0);
        }
        amountArray.forEach((amount) => {
            let x = {'amount': amount, 'selected': amount == this.initialQty};
            this.amounts.push(x);
        });
    }

    handleQtyChange = (e) => {
        this.selectedQty = e.target.value;
        const evt = new CustomEvent('quantitychange', {
            detail: {id: this.id, qty: this.selectedQty},
        });
        this.dispatchEvent(evt);
    }

    handleOnClick = (e) => {
        this.isClicked = true;
    }

}