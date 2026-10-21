namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;

pageextension 50202 "F1 Purchase Order" extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race this purchase order supplies.';
            }
            field("F1 Purchase Urgency"; Rec."F1 Purchase Urgency")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies how quickly this purchase order needs attention.';
            }
            field("F1 Vendor Score"; Rec."F1 Vendor Score")
            {
                ApplicationArea = All;
                ToolTip = 'Shows the score for the selected buy-from vendor.';
            }
        }
    }
}
