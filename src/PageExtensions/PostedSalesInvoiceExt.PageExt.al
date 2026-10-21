namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

pageextension 50211 "F1CTRL Posted Sales Inv Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("F1 Race Event No."; Rec."F1 Race Event No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the F1 Race Event associated with this posted invoice.';
            }
        }
    }
}