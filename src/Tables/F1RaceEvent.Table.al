namespace Thunderstrike.F1CTRL;

table 50200 "F1 Race Event"
{
    Caption = 'Race Event';
    DataClassification = CustomerContent;
    LookupPageId = "F1 Race Events";
    DrillDownPageId = "F1 Race Events";
    fields
    {
        field(1; "No."; Code[20]) { Caption = 'No.'; NotBlank = true; }
        field(2; Name; Text[100]) { Caption = 'Name'; }
        field(3; "Race Date"; Date) { Caption = 'Race Date'; }
        field(4; Location; Text[100]) { Caption = 'Location'; }
        field(5; Circuit; Text[100]) { Caption = 'Circuit'; }
        field(6; Status; Enum "F1 Race Status") { Caption = 'Status'; }
        field(7; Season; Integer) { Caption = 'Season'; MinValue = 0; }
    }
    keys
    {
        key(PK; "No.") { Clustered = true; }
        key(RaceDate; "Race Date") { }
    }
    trigger OnDelete()
    var
        Assignment: Record "F1 Team Assignment";
        AssemblyHeader: Record Microsoft.Assembly.Document."Assembly Header";
        PurchaseHeader: Record Microsoft.Purchases.Document."Purchase Header";
    begin
        Assignment.SetRange("Race No.", "No.");
        if not Assignment.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", Assignment.TableCaption());
        AssemblyHeader.SetRange("F1 Race No.", "No.");
        if not AssemblyHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", AssemblyHeader.TableCaption());
        PurchaseHeader.SetRange("F1 Race No.", "No.");
        if not PurchaseHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", PurchaseHeader.TableCaption());
    end;
    var
        RelatedRecordsErr: Label '%1 %2 cannot be deleted because related %3 records exist.', Comment = '%1 = table, %2 = number, %3 = related table';
}
