namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Vendor;

tableextension 50201 "F1 Purchase Header" extends "Purchase Header"
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
        field(50201; "F1 Purchase Urgency"; Enum "F1 Purchase Urgency")
        {
            Caption = 'Purchase Urgency';
            DataClassification = CustomerContent;
        }
        field(50202; "F1 Vendor Score"; Decimal)
        {
            Caption = 'Vendor Score';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor."F1 Vendor Score" where("No." = field("Buy-from Vendor No.")));
            Editable = false;
        }
    }
    keys
    {
        key(F1Race; "F1 Race No.") { }
    }
}
