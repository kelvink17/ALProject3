namespace Thunderstrike.F1CTRL;

page 50206 "F1 Role Center"
{
    PageType = RoleCenter;
    Caption = 'Thunderstrike Racing';
    layout
    {
        area(RoleCenter)
        {
            part(UpcomingRaces; "F1 Race Overview") { ApplicationArea = All; }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Racing)
            {
                Caption = 'Race Management';
                action(RaceEvents)
                {
                    Caption = 'Race Events';
                    ApplicationArea = All;
                    RunObject = page "F1 Race Events";
                    ToolTip = 'Manage race events.';
                }
                action(TeamMembers)
                {
                    Caption = 'Team Members';
                    ApplicationArea = All;
                    RunObject = page "F1 Team Members";
                    ToolTip = 'Manage team members.';
                }
                action(TeamAssignments)
                {
                    Caption = 'Team Assignments';
                    ApplicationArea = All;
                    RunObject = page "F1 Team Assignments";
                    ToolTip = 'Manage team assignments.';
                }
            }
            group(Operations)
            {
                Caption = 'Orders';
                action(AssemblyOrders)
                {
                    Caption = 'Assembly Orders';
                    ApplicationArea = All;
                    RunObject = page Microsoft.Assembly.Document."Assembly Orders";
                    ToolTip = 'Manage assembly orders.';
                }
                action(PurchaseOrders)
                {
                    Caption = 'Purchase Orders';
                    ApplicationArea = All;
                    RunObject = page Microsoft.Purchases.Document."Purchase Order List";
                    ToolTip = 'Manage purchase orders.';
                }
                action(SalesOrders)
                {
                    Caption = 'Sales Orders';
                    ApplicationArea = All;
                    RunObject = page Microsoft.Sales.Document."Sales Order List";
                    ToolTip = 'Manage race-related sales and sponsorship orders.';
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                action(RaceSummaryReport)
                {
                    Caption = 'F1 Race Summary Report';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "F1 Race Summary Report";
                    ToolTip = 'View race event details and sponsored revenue.';
                }
            }
        }

        area(Embedding)
        {
            action(Races)
            {
                Caption = 'Race Events';
                ApplicationArea = All;
                RunObject = page "F1 Race Events";
                ToolTip = 'Open race events.';
            }
            action(Members)
            {
                Caption = 'Team Members';
                ApplicationArea = All;
                RunObject = page "F1 Team Members";
                ToolTip = 'Open team members.';
            }
            action(Assignments)
            {
                Caption = 'Team Assignments';
                ApplicationArea = All;
                RunObject = page "F1 Team Assignments";
                ToolTip = 'Open team assignments.';
            }
            action(Builds)
            {
                Caption = 'Assembly Orders';
                ApplicationArea = All;
                RunObject = page Microsoft.Assembly.Document."Assembly Orders";
                ToolTip = 'Open assembly orders.';
            }
            action(Purchases)
            {
                Caption = 'Purchase Orders';
                ApplicationArea = All;
                RunObject = page Microsoft.Purchases.Document."Purchase Order List";
                ToolTip = 'Open purchase orders.';
            }
            action(Sales)
            {
                Caption = 'Sales Orders';
                ApplicationArea = All;
                RunObject = page Microsoft.Sales.Document."Sales Order List";
                ToolTip = 'Open sales orders.';
            }
        }

    }


}
