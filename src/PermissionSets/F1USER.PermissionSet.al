namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.History;

permissionset 50200 "F1 USER"
{
    Assignable = true;
    Caption = 'F1CTRL User';
    Permissions =
        codeunit "F1 Race Management" = X,
        tabledata "F1 Race Event" = RIMD,
        tabledata "F1 Team Member" = RIMD,
        tabledata "F1 Team Assignment" = RIMD,
        tabledata "F1 Inventory Usage" = Ri,
        tabledata "Sales Invoice Header" = R,
        tabledata "Sales Invoice Line" = R,
        table "F1 Race Event" = X,
        table "F1 Team Member" = X,
        table "F1 Team Assignment" = X,
        table "F1 Inventory Usage" = X,
        codeunit "F1 Inventory Usage Mgt." = X,
        page "F1 Race Events" = X,
        page "F1 Race Event Card" = X,
        page "F1 Team Members" = X,
        page "F1 Team Member Card" = X,
        page "F1 Team Assignments" = X,
        page "F1 Assignments Part" = X,
        page "F1 Role Center" = X,
        page "F1 Inventory Usage" = X,
        page "F1 Race Overview" = X;
}
