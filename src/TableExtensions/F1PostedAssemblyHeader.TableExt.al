namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.History;

tableextension 50202 "F1 Posted Assembly Header" extends "Posted Assembly Header"
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
