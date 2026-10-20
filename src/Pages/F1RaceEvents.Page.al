namespace Thunderstrike.F1CTRL;

page 50200 "F1 Race Events"
{
    PageType = List;
    SourceTable = "F1 Race Event";
    Caption = 'Race Events';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "F1 Race Event Card";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Lines)
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
            action(PurchaseOrders)
            {
                Caption = 'Purchase Orders';
                ApplicationArea = All;
                Image = Order;
                RunObject = page Microsoft.Purchases.Document."Purchase Order List";
                RunPageLink = "F1 Race No." = field("No.");
                ToolTip = 'View purchase orders for this race.';
            }
        }
    }
}
