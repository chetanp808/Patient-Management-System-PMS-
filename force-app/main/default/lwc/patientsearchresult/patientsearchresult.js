import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Patient Id', fieldName: 'id' },
    { label: 'Patient Name', fieldName: 'name'},
    { label: 'Patient Email', fieldName: 'email'},
    { label: 'Patient Status', fieldName: 'status'},
];

export default class patientsearchresult extends LightningElement {
    columns = columns;
    @api searchresults=[];
}