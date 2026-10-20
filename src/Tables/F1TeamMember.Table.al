namespace Thunderstrike.F1CTRL;

table 50201 "F1 Team Member"
{
    Caption = 'Team Member';
    DataClassification = CustomerContent;
    LookupPageId = "F1 Team Members";
    DrillDownPageId = "F1 Team Members";
    fields
    {
        field(1; "No."; Code[20]) { Caption = 'No.'; NotBlank = true; }
        field(2; Name; Text[100]) { Caption = 'Name'; }
        field(3; Role; Enum "F1 Team Role") { Caption = 'Role'; }
        field(4; "Email"; Text[80]) { Caption = 'Email'; ExtendedDatatype = EMail; }
        field(5; "Phone No."; Text[30]) { Caption = 'Phone No.'; ExtendedDatatype = PhoneNo; }
        field(6; Blocked; Boolean) { Caption = 'Blocked'; }
    }
    keys { key(PK; "No.") { Clustered = true; } }
    trigger OnDelete()
    var
        Assignment: Record "F1 Team Assignment";
    begin
        Assignment.SetRange("Team Member No.", "No.");
        if not Assignment.IsEmpty() then
            Error(AssignedErr, "No.");
    end;
    var
        AssignedErr: Label 'Team member %1 cannot be deleted while assignments exist.', Comment = '%1 = team member number';
}
