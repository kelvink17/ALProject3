namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;
using Microsoft.Purchases.History;

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
            column(AssignedTeamMembers; AssignedTeamMemberCount) { }
            column(TotalInventoryUsed; InventoryQuantityUsed) { }
            column(PurchaseSpending; TotalPurchaseSpending) { }
            column(TotalSponsoredRevenue; SponsoredRevenue) { }
            column(NetFinancialResult; RaceNetResult) { }

            trigger OnAfterGetRecord()
            begin
                // For each race event record, compute its total revenue
                AssignedTeamMemberCount := CalculateAssignedTeamMembers("No.");
                InventoryQuantityUsed := CalculateInventoryUsed("No.");
                TotalPurchaseSpending := CalculatePurchaseSpending("No.");
                SponsoredRevenue := CalculateSponsoredRevenue("No.");
                RaceNetResult := SponsoredRevenue - TotalPurchaseSpending;
            end;
        }
    }

    local procedure CalculateAssignedTeamMembers(RaceNo: Code[20]): Integer
    var
        TeamAssignment: Record "F1 Team Assignment";
    begin
        TeamAssignment.SetRange("Race No.", RaceNo);
        exit(TeamAssignment.Count());
    end;

    local procedure CalculateInventoryUsed(RaceNo: Code[20]): Decimal
    var
        InventoryUsage: Record "F1 Inventory Usage";
        TotalQuantity: Decimal;
    begin
        InventoryUsage.SetRange("Race No.", RaceNo);
        if InventoryUsage.FindSet() then
            repeat
                TotalQuantity += InventoryUsage."Quantity Used";
            until InventoryUsage.Next() = 0;

        exit(TotalQuantity);
    end;

    local procedure CalculatePurchaseSpending(RaceNo: Code[20]): Decimal
    var
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        Spending: Decimal;
    begin
        PurchInvHeader.SetRange("F1 Race No.", RaceNo);
        if PurchInvHeader.FindSet() then
            repeat
                PurchInvLine.SetRange("Document No.", PurchInvHeader."No.");
                if PurchInvLine.FindSet() then
                    repeat
                        Spending += PurchInvLine.Amount;
                    until PurchInvLine.Next() = 0;
            until PurchInvHeader.Next() = 0;

        exit(Spending);
    end;

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
        AssignedTeamMemberCount: Integer;
        InventoryQuantityUsed: Decimal;
        TotalPurchaseSpending: Decimal;
        SponsoredRevenue: Decimal;
        RaceNetResult: Decimal;
}

