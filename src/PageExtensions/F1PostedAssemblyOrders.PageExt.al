namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.History;

pageextension 50205 "F1 Posted Assembly Orders" extends "Posted Assembly Orders"
{
    layout
    {
        addafter("No.")
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race linked to this posted assembly order.';
            }
        }
    }
}
