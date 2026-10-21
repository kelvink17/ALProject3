namespace Thunderstrike.F1CTRL;

using Microsoft.Inventory.Item;

table 50203 "F1 Inventory Usage"
{
    Caption = 'Inventory Usage';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Race No."; Code[20])
        {
            Caption = 'Race No.';
            TableRelation = "F1 Race Event";
        }
        field(3; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;
        }
        field(4; "Quantity Used"; Decimal)
        {
            Caption = 'Quantity Used';
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(6; "Posted Assembly No."; Code[20])
        {
            Caption = 'Posted Assembly No.';
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
        }
        field(8; "Reverses Entry No."; Integer)
        {
            Caption = 'Reverses Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
