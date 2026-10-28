namespace Thunderstrike.F1CTRL;

table 50200 "F1 Race Event"
{
    Caption = 'Race Event';
    DataClassification = CustomerContent;
    LookupPageId = "F1 Race Events";
    DrillDownPageId = "F1 Race Events";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100]) { Caption = 'Name'; }
        field(3; "Race Date"; Date) { Caption = 'Race Date'; }
        field(4; Location; Text[100]) { Caption = 'Location'; }
        field(5; Circuit; Text[100]) { Caption = 'Circuit'; }
        field(6; Status; Enum "F1 Race Status") { Caption = 'Status'; }
        field(7; Season; Integer)
        {
            Caption = 'Season';
            MinValue = 0;
        }
    }
    keys
    {
        key(PK; "No.") { Clustered = true; }
        key(RaceDate; "Race Date") { }
    }
    trigger OnInsert()
    var
        F1NoSeriesMgt: Codeunit "F1 No. Series Mgt.";
    begin
        if "No." = '' then
            "No." := F1NoSeriesMgt.GetNextRaceNo();
    end;

    trigger OnDelete()
    var
        Assignment: Record "F1 Team Assignment";
    begin
        CheckDeletionAllowed();

        Assignment.SetRange("Race No.", "No.");
        Assignment.DeleteAll(true);
    end;

    procedure CheckDeletionAllowed()
    var
        AssemblyHeader: Record Microsoft.Assembly.Document."Assembly Header";
        PostedAssemblyHeader: Record Microsoft.Assembly.History."Posted Assembly Header";
        InventoryUsage: Record "F1 Inventory Usage";
        PurchaseHeader: Record Microsoft.Purchases.Document."Purchase Header";
        PurchRcptHeader: Record Microsoft.Purchases.History."Purch. Rcpt. Header";
        PurchInvHeader: Record Microsoft.Purchases.History."Purch. Inv. Header";
        SalesHeader: Record Microsoft.Sales.Document."Sales Header";
        SalesInvHeader: Record Microsoft.Sales.History."Sales Invoice Header";
    begin
        if Status <> Status::Cancelled then
            Error(RaceMustBeCancelledErr, "No.", Format(Status));

        AssemblyHeader.SetRange("F1 Race No.", "No.");
        if not AssemblyHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", AssemblyHeader.TableCaption());

        PostedAssemblyHeader.SetRange("F1 Race No.", "No.");
        if not PostedAssemblyHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", PostedAssemblyHeader.TableCaption());

        InventoryUsage.SetRange("Race No.", "No.");
        if not InventoryUsage.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", InventoryUsage.TableCaption());

        PurchaseHeader.SetRange("F1 Race No.", "No.");
        if not PurchaseHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", PurchaseHeader.TableCaption());

        PurchRcptHeader.SetRange("F1 Race No.", "No.");
        if not PurchRcptHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", PurchRcptHeader.TableCaption());

        PurchInvHeader.SetRange("F1 Race No.", "No.");
        if not PurchInvHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", PurchInvHeader.TableCaption());

        SalesHeader.SetRange("F1 Race Event No.", "No.");
        if not SalesHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", SalesHeader.TableCaption());

        SalesInvHeader.SetRange("F1 Race Event No.", "No.");
        if not SalesInvHeader.IsEmpty() then
            Error(RelatedRecordsErr, TableCaption(), "No.", SalesInvHeader.TableCaption());

    end;

    procedure ConfirmDeletion(): Boolean
    var
        Assignment: Record "F1 Team Assignment";
    begin
        CheckDeletionAllowed();

        Assignment.SetRange("Race No.", "No.");
        exit(Confirm(CancelledRaceDeleteQst, false, "No.", Assignment.Count()));
    end;

    var
        RelatedRecordsErr: Label '%1 %2 cannot be deleted because related %3 records exist.', Comment = '%1 = table, %2 = number, %3 = related table';
        RaceMustBeCancelledErr: Label 'Race event %1 cannot be deleted because its status is %2. Change the status to Cancelled before deleting it.', Comment = '%1 = race number, %2 = race status';
        CancelledRaceDeleteQst: Label 'Race event %1 is cancelled. Deleting it will also delete %2 team assignment(s). Do you want to continue?', Comment = '%1 = race number, %2 = team assignment count';
}
