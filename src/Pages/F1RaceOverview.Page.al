namespace Thunderstrike.F1CTRL;

page 50207 "F1 Race Overview"
{
    PageType = ListPart;
    SourceTable = "F1 Race Event";
    SourceTableView = sorting("Race Date") where(Status = const(Upcoming));
    Caption = 'Upcoming Races';
    Editable = false;
    CardPageId = "F1 Race Event Card";
    layout
    {
        area(Content)
        {
            usercontrol(ReadinessDashboard; "F1 Race Readiness")
            {
                ApplicationArea = All;

                trigger DashboardReady()
                begin
                    SendReadinessToDashboard();
                end;
            }
            repeater(Races)
            {
                field("No."; Rec."No.") { ApplicationArea = All; ToolTip = 'Specifies the race number.'; }
                field(Name; Rec.Name) { ApplicationArea = All; ToolTip = 'Specifies the race name.'; }
                field("Race Date"; Rec."Race Date") { ApplicationArea = All; ToolTip = 'Specifies the race date.'; }
                field(Circuit; Rec.Circuit) { ApplicationArea = All; ToolTip = 'Specifies the circuit.'; }
            }
        }
    }

    local procedure SendReadinessToDashboard()
    var
        RaceEvent: Record "F1 Race Event";
        RaceReadinessMgt: Codeunit "F1 Race Readiness Mgt.";
        CoveredRoles: Integer;
        TeamCoverage: Integer;
    begin
        RaceEvent.SetCurrentKey("Race Date");
        RaceEvent.SetRange(Status, RaceEvent.Status::Upcoming);
        RaceEvent.SetFilter("Race Date", '>=%1', WorkDate());

        if not RaceEvent.FindFirst() then begin
            CurrPage.ReadinessDashboard.ShowTeamReadiness('No upcoming race', 0, 0);
            exit;
        end;

        RaceReadinessMgt.CalculateTeamCoverage(
            RaceEvent."No.",
            CoveredRoles,
            TeamCoverage);

        CurrPage.ReadinessDashboard.ShowTeamReadiness(
            RaceEvent.Name,
            CoveredRoles,
            TeamCoverage);
    end;
}
