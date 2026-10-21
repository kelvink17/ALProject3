namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.Vendor;

pageextension 50208 "F1 Vendor Card" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("F1 Vendor Score"; Rec."F1 Vendor Score")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the F1 team rating for this vendor, from 0 to 100.';
            }
        }
    }
}
