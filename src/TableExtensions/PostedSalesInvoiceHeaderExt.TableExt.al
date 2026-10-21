namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

tableextension 50208 "F1CTRL Posted Sales Inv Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50200; "F1 Race Event No."; Code[20])
        {
            Caption = 'F1 Race Event No.';
            TableRelation = "F1 Race Event"."No.";
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}