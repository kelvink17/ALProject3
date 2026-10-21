namespace Thunderstrike.F1CTRL;

page 50208 "F1 Inventory Usage"
{
    PageType = List;
    SourceTable = "F1 Inventory Usage";
    Caption = 'Inventory Usage';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Entries)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the usage entry number.';
                }
                field("Race No."; Rec."Race No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the race that used the item.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the item used.';
                }
                field("Quantity Used"; Rec."Quantity Used")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity used in the posted assembly.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unit used to measure the quantity.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the assembly posting date.';
                }
                field("Posted Assembly No."; Rec."Posted Assembly No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posted assembly associated with this entry.';
                }
                field("Reverses Entry No."; Rec."Reverses Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the original usage entry reversed by this entry.';
                }
            }
        }
    }
}
