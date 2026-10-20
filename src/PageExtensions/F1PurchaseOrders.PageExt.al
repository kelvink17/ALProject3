namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;

pageextension 50203 "F1 Purchase Orders" extends "Purchase Order List"
{
    layout
    {
        addlast(Control1)
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race linked to this purchase order.';
            }
        }
    }
}
