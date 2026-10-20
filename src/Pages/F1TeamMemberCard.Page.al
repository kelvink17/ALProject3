namespace Thunderstrike.F1CTRL;

page 50203 "F1 Team Member Card"
{
    PageType = Card;
    SourceTable = "F1 Team Member";
    Caption = 'Team Member Card';
    ApplicationArea = All;
    UsageCategory = Documents;
    layout
    {
        area(Content)
        {
            group(General)
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
