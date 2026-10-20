namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;

pageextension 50201 "F1 Assembly Orders" extends "Assembly Orders"
{
    layout
    {
        addlast(Control1)
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race linked to this assembly order.';
            }
        }
    }
}
