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
        }
    }
}
