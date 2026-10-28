namespace Thunderstrike.F1CTRL;

controladdin "F1 Race Readiness"
{
    Scripts = 'src/ControlAddIns/Scripts/F1RaceReadiness.js';
    StartupScript = 'src/ControlAddIns/Scripts/F1RaceReadinessStartup.js';
    StyleSheets = 'src/ControlAddIns/Styles/F1RaceReadiness.css';

    RequestedHeight = 240;
    MinimumHeight = 200;
    MaximumHeight = 280;
    HorizontalStretch = true;

    event DashboardReady();
    event RefreshRequested();

    procedure ShowTeamReadiness(RaceName: Text; RaceDate: Text; DaysRemaining: Integer; CoveredRoles: Integer; TeamCoverage: Integer);
}
