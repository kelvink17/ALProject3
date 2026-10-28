namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.Document;

pageextension 50212 "F1CTRL Sales Orders" extends "Sales Order List"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("F1 Race Event No."; Rec."F1 Race Event No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the F1 race event associated with this sales or sponsorship order.';
            }
        }
    }
}
