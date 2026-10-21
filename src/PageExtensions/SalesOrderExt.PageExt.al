namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.Document;

pageextension 50209 "F1CTRL Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("F1 Race Event No."; Rec."F1 Race Event No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the F1 Race Event associated with this sale or sponsorship deal.';
            }
        }
    }
}