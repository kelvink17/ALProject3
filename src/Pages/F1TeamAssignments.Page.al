namespace Thunderstrike.F1CTRL;

page 50204 "F1 Team Assignments"
{
    PageType = List;
    SourceTable = "F1 Team Assignment";
    Caption = 'Team Assignments';
    ApplicationArea = All;
    UsageCategory = Lists;
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Race No."; Rec."Race No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the race no..';
                }
                field("Race Name"; Rec."Race Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the race name.';
                }
                field("Team Member No."; Rec."Team Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the team member no..';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member name.';
                }
                field("Role"; Rec."Role")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the role.';
                }
                field("Notes"; Rec."Notes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the notes.';
                }
            }

        }
    }

}
