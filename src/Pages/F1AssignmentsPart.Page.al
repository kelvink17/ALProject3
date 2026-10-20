namespace Thunderstrike.F1CTRL;

page 50205 "F1 Assignments Part"
{
    PageType = ListPart;
    SourceTable = "F1 Team Assignment";
    Caption = 'Assignments Part';
    ApplicationArea = All;
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
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
