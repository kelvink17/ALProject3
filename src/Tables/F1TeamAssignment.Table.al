namespace Thunderstrike.F1CTRL;

table 50202 "F1 Team Assignment"
{
    Caption = 'Team Assignment';
    DataClassification = CustomerContent;
    LookupPageId = "F1 Team Assignments";
    DrillDownPageId = "F1 Team Assignments";
    fields
    {
        field(1; "Race No."; Code[20])
        {
            Caption = 'Race No.';
            NotBlank = true;
            TableRelation = "F1 Race Event";
        }
        field(2; "Team Member No."; Code[20])
        {
            Caption = 'Team Member No.';
            NotBlank = true;
            TableRelation = "F1 Team Member" where(Blocked = const(false));
            trigger OnValidate()
            var
                Member: Record "F1 Team Member";
            begin
                if "Team Member No." = '' then begin
                    Clear(Role);
                    exit;
                end;
                Member.Get("Team Member No.");
                Member.TestField(Blocked, false);
                Role := Member.Role;
            end;
        }
        field(3; Role; Enum "F1 Team Role") { Caption = 'Role'; }
        field(4; Notes; Text[250]) { Caption = 'Notes'; }
        field(5; "Member Name"; Text[100])
        {
            Caption = 'Member Name';
            FieldClass = FlowField;
            CalcFormula = lookup("F1 Team Member".Name where("No." = field("Team Member No.")));
            Editable = false;
        }
        field(6; "Race Name"; Text[100])
        {
            Caption = 'Race Name';
            FieldClass = FlowField;
            CalcFormula = lookup("F1 Race Event".Name where("No." = field("Race No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Race No.", "Team Member No.") { Clustered = true; }
        key(Member; "Team Member No.") { }
    }
    trigger OnInsert()
    begin
        TestField("Race No.");
        TestField("Team Member No.");
    end;
    trigger OnModify()
    begin
        TestField("Race No.");
        TestField("Team Member No.");
    end;
}
