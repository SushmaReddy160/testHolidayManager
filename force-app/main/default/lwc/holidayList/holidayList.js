import { LightningElement,wire,track } from 'lwc';
import getHolidayDetails from '@salesforce/apex/HolidayManager.getHolidayDetails';
import updateUserRecord from '@salesforce/apex/HolidayManager.updateUserRecord';
import preSelectedHoliday from '@salesforce/apex/HolidayManager.preSelectedHoliday'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Success from '@salesforce/label/c.Success';
import Error from '@salesforce/label/c.Error';
import RowSelectionError from '@salesforce/label/c.RowSelectionError';
import GenericUpdateError from '@salesforce/label/c.GenericUpdateError';
export default class HolidayList extends LightningElement {
     columns = [
        { label: 'Name', fieldName: 'name' },
        { label: 'Description', fieldName: 'description', type: 'text' },
        { label: 'Date', fieldName: 'Hdate', type: 'text' },
    ];
    label = {
        Success,
        Error,
        RowSelectionError,
        GenericUpdateError
        
    };
    preSelectedRow
    @wire(getHolidayDetails) holidaysList; 
    connectedCallback(){
        preSelectedHoliday().then(data=>{
            this.preSelectedRow = data;
        }).catch();
    }
    handleRowSelection(event){
        var selectedRows=event.detail.selectedRows;
        if(selectedRows.length>1)
        {
            var el = this.template.querySelector('lightning-datatable');
            selectedRows=el.selectedRows=el.selectedRows.slice(1);
            this.showNotification('Error',RowSelectionError,'warning','pester');
            event.preventDefault();
            return;
        }
    }
    holidayUpdateHandler(event){
        var selectedRows = this.template.querySelector("lightning-datatable").getSelectedRows();
        if(selectedRows.length == 0){
            this.showNotification('Error',Error,'error','pester');
        }
        var selectedRow = selectedRows[0];
        console.log('======'+selectedRow.name)
        updateUserRecord({selectedRow: selectedRow.name})
        .then(result=>{
            this.showNotification('Success',Success,'success','dismissable');
        })
        .catch(error=>{
            this.showNotification('Error',GenericUpdateError,'error','pester');
        })
        window.location.reload();
    }
    showNotification(title,message,variant,mode) {
        const event = new ShowToastEvent({
            title: title ,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(event);
    }
}