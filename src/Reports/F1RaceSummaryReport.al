namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

report 50200 "F1 Race Summary Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'F1 Race Summary Report';

    // Using Word or Excel layout allows easy testing in BC
    DefaultLayout = Excel;
    ExcelLayout = 'src/F1RaceSummaryReport.xlsx';


    dataset
    {
        // Primary Data Item: Loop through Race Events
        dataitem(RaceEvent; "F1 Race Event")
        {
            RequestFilterFields = "No.", Season, Status;

            // Columns to include in report output
            column(No; "No.") { }
            column(Name; Name) { }
            column(Race_Date; "Race Date") { }
            column(Circuit; Circuit) { }
            column(Status; Status) { }
            column(TotalSponsoredRevenue; SponsoredRevenue) { }

            trigger OnAfterGetRecord()
            begin
                // For each race event record, compute its total revenue
                SponsoredRevenue := CalculateSponsoredRevenue("No.");
            end;
        }
    }

    local procedure CalculateSponsoredRevenue(RaceNo: Code[20]): Decimal
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        Revenue: Decimal;
    begin
        SalesInvoiceHeader.SetRange("F1 Race Event No.", RaceNo);
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
        SponsoredRevenue: Decimal;
}

