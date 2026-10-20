namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;

pageextension 50200 "F1 Assembly Order" extends "Assembly Order"
{
    layout
    {
        addafter("No.")
        {
            field("F1 Race No."; Rec."F1 Race No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the race this assembly order prepares equipment for.';
            }
        }
    }
}
