namespace Thunderstrike.F1CTRL;

permissionset 50200 "F1 USER"
{
    Assignable = true;
    Caption = 'F1CTRL User';
    Permissions =
        codeunit "F1 Race Management" = X,
        tabledata "F1 Race Event" = RIMD,
        tabledata "F1 Team Member" = RIMD,
        tabledata "F1 Team Assignment" = RIMD,
        table "F1 Race Event" = X,
        table "F1 Team Member" = X,
        table "F1 Team Assignment" = X,
        page "F1 Race Events" = X,
        page "F1 Race Event Card" = X,
        page "F1 Team Members" = X,
        page "F1 Team Member Card" = X,
        page "F1 Team Assignments" = X,
        page "F1 Assignments Part" = X,
        page "F1 Role Center" = X,
        page "F1 Race Overview" = X;
}
