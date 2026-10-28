namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.Document;

tableextension 50207 "F1CTRL Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50200; "F1 Race Event No."; Code[20])
        {
            Caption = 'F1 Race Event No.';
            TableRelation = "F1 Race Event"."No.";
            DataClassification = CustomerContent;




            trigger OnValidate()
            var
                RaceManagement: Codeunit "F1 Race Management";
            begin
                RaceManagement.CheckRaceIsUpcoming("F1 Race Event No.");
            end;
        }
    }
}

