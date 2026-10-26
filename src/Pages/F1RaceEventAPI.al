namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

page 50209 "F1 Race Event API"
{
    PageType = API;
    Caption = 'F1 Race Event API';

    // API URL properties: .../api/thunderstrike/f1/v1.0/companies(...)/raceEvents
    APIPublisher = 'thunderstrike';
    APIGroup = 'f1';
    APIVersion = 'v1.0';
    EntityName = 'raceEvent';
    EntitySetName = 'raceEvents';

    SourceTable = "F1 Race Event";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                // Unique Identifier (GUID) required for REST APIs
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(raceDate; Rec."Race Date")
                {
                    Caption = 'Race Date';
                }
                field(circuit; Rec.Circuit)
                {
                    Caption = 'Circuit';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(location; Rec.Location)
                {
                    Caption = 'Location';
                }
                field(season; Rec.Season)
                {
                    Caption = 'Season';
                }
                field(totalSponsoredRevenue; TotalSponsoredRevenue)
                {
                    Caption = 'Total Sponsored Revenue';
                    Editable = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        TotalSponsoredRevenue := CalculateSponsoredRevenue();
    end;

    local procedure CalculateSponsoredRevenue(): Decimal
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        Revenue: Decimal;
    begin
        SalesInvoiceHeader.SetRange("F1 Race Event No.", Rec."No.");
        if SalesInvoiceHeader.FindSet() then
            repeat
                SalesInvoiceLine.SetRange("Document No.", SalesInvoiceHeader."No.");
                if SalesInvoiceLine.FindSet() then
                    repeat
                        Revenue += SalesInvoiceLine.Amount;
                    until SalesInvoiceLine.Next() = 0;
            until SalesInvoiceHeader.Next() = 0;

        exit(Revenue);
    end;

    var
        TotalSponsoredRevenue: Decimal;
}