namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

page 50201 "F1 Race Event Card"
{
    PageType = Card;
    SourceTable = "F1 Race Event";
    Caption = 'Race Event Card';
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
                field("Race Date"; Rec."Race Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the race date.';
                }
                field("Location"; Rec."Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the location.';
                }
                field("Circuit"; Rec."Circuit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the circuit.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status.';
                }
                field("Season"; Rec."Season")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the season.';
                }
                field("Total Sponsored Revenue"; TotalSponsoredRevenue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total sponsored revenue generated from posted sales invoices for this race event.';
                    Editable = false;
                }
            }
            part(AssignmentLines; "F1 Assignments Part")
            {
                ApplicationArea = All;
                SubPageLink = "Race No." = field("No.");
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(Assignments)
            {
                Caption = 'Team Assignments';
                ApplicationArea = All;
                Image = TeamSales;
                RunObject = page "F1 Team Assignments";
                RunPageLink = "Race No." = field("No.");
                ToolTip = 'View team assignments for this race.';
            }
            action(AssemblyOrders)
            {
                Caption = 'Assembly Orders';
                ApplicationArea = All;
                Image = AssemblyOrder;
                RunObject = page Microsoft.Assembly.Document."Assembly Orders";
                RunPageLink = "F1 Race No." = field("No.");
                ToolTip = 'View assembly orders for this race.';
            }
            action(PostedAssemblyOrders)
            {
                Caption = 'Posted Assembly Orders';
                ApplicationArea = All;
                Image = AssemblyOrder;
                RunObject = page Microsoft.Assembly.History."Posted Assembly Orders";
                RunPageLink = "F1 Race No." = field("No.");
                ToolTip = 'View posted assembly orders and components used for this race.';
            }
            action(InventoryUsage)
            {
                Caption = 'Inventory Usage';
                ApplicationArea = All;
                Image = Entries;
                RunObject = page "F1 Inventory Usage";
                RunPageLink = "Race No." = field("No.");
                ToolTip = 'View inventory used for this race.';
            }
            action(PurchaseOrders)
            {
                Caption = 'Purchase Orders';
                ApplicationArea = All;
                Image = Order;
                RunObject = page Microsoft.Purchases.Document."Purchase Order List";
                RunPageLink = "F1 Race No." = field("No.");
                ToolTip = 'View purchase orders for this race.';
            }
            action(PostedPurchaseReceipts)
            {
                Caption = 'Posted Purchase Receipts';
                ApplicationArea = All;
                Image = PostedReceipt;
                RunObject = page Microsoft.Purchases.History."Posted Purchase Receipts";
                RunPageLink = "F1 Race No." = field("No.");
                ToolTip = 'View posted purchase receipts for this race.';
            }
            action(SalesOrders)
            {
                Caption = 'Sales Orders';
                ApplicationArea = All;
                Image = Order;
                RunObject = page Microsoft.Sales.Document."Sales Order List";
                RunPageLink = "F1 Race Event No." = field("No.");
                ToolTip = 'View sales and sponsorship orders for this race.';
            }
            action(PostedSalesInvoices)
            {
                Caption = 'Posted Sales Invoices';
                ApplicationArea = All;
                Image = PostedOrder;
                RunObject = page Microsoft.Sales.History."Posted Sales Invoices";
                RunPageLink = "F1 Race Event No." = field("No.");
                ToolTip = 'View posted sponsor invoices and revenue for this race.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        TotalSponsoredRevenue := CalculateSponsoredRevenue();
    end;

    local procedure CalculateSponsoredRevenue(): Decimal
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesInvoiceLine: Record "Sales Invoice Line";
        Revenue: Decimal;
    begin
        if Rec."No." = '' then
            exit(0);

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
