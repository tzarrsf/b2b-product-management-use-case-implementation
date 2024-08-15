import { LightningElement } from 'lwc';
import { getContent } from "experience/cmsDeliveryApi";

export default class InlinePdfDisplay extends LightningElement{
    this.docUrl = data.contentBody['sfdc_cms:media'].url;
}