namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.History;

pageextension 50207 "F1 Posted Purchase Receipts" extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("No.")
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race linked to this posted purchase receipt.';
            }
        }
    }
}
