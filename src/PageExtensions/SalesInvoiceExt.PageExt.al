namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.Document;

pageextension 50210 "F1CTRL Sales Invoice Ext" extends "Sales Invoice"
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