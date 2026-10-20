namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.History;

pageextension 50206 "F1 Posted Purchase Receipt" extends "Posted Purchase Receipt"
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
