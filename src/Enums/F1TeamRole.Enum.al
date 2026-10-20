namespace Thunderstrike.F1CTRL;

enum 50201 "F1 Team Role"
{
    Extensible = true;
    value(0; " ") { Caption = ' '; }
    value(1; Driver) { Caption = 'Driver'; }
    value(2; Engineer) { Caption = 'Engineer'; }
    value(3; Mechanic) { Caption = 'Mechanic'; }
    value(4; "Pit Crew") { Caption = 'Pit Crew'; }
    value(5; Manager) { Caption = 'Manager'; }
    value(6; Logistics) { Caption = 'Logistics'; }
}
