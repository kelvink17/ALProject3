namespace Thunderstrike.F1CTRL;

enum 50200 "F1 Race Status"
{
    Extensible = true;
    value(0; Upcoming) { Caption = 'Upcoming'; }
    value(1; Completed) { Caption = 'Completed'; }
    value(2; Cancelled) { Caption = 'Cancelled'; }
}
