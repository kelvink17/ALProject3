namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;

tableextension 50200 "F1 Assembly Header" extends "Assembly Header"
{
    fields
    {
        field(50200; "F1 Race No."; Code[20])
        {
            Caption = 'Race No.';
            DataClassification = CustomerContent;
            TableRelation = "F1 Race Event";

            trigger OnValidate()
            var
                RaceManagement: Codeunit "F1 Race Management";
            begin
                RaceManagement.CheckRaceIsUpcoming("F1 Race No.");
            end;
        }
    }
    keys { key(F1Race; "F1 Race No.") { } }
}
