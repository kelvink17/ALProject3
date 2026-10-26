namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.History;

tableextension 50205 "F1 Purch. Inv. Header" extends "Purch. Inv. Header"
{
    fields
    {
        field(50200; "F1 Race No."; Code[20])
        {
            Caption = 'Race No.';
            DataClassification = CustomerContent;
            TableRelation = "F1 Race Event";
            Editable = false;
        }
    }

    keys
    {
        key(F1Race; "F1 Race No.") { }
    }
}
