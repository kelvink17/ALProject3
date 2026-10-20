namespace Thunderstrike.F1CTRL;

page 50202 "F1 Team Members"
{
    PageType = List;
    SourceTable = "F1 Team Member";
    Caption = 'Team Members';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "F1 Team Member Card";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique number.';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name.';
                }
                field("Role"; Rec."Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the role.';
                }
                field("Email"; Rec."Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the email.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the phone no..';
                }
                field("Blocked"; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the blocked.';
                }
            }

        }
    }

}
