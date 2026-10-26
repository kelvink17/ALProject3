namespace Thunderstrike.F1CTRL;

codeunit 50205 "F1 Race Readiness Mgt."
{
    procedure CalculateTeamCoverage(RaceNo: Code[20]; var CoveredRoles: Integer; var TeamCoverage: Integer)
    var
        TeamAssignment: Record "F1 Team Assignment";
        RoleCovered: array[6] of Boolean;
        RoleNumber: Integer;
    begin
        Clear(CoveredRoles);
        Clear(TeamCoverage);

        TeamAssignment.SetRange("Race No.", RaceNo);
        if TeamAssignment.FindSet() then
            repeat
                RoleNumber := TeamAssignment.Role.AsInteger();
                if (RoleNumber >= 1) and (RoleNumber <= 6) then
                    if not RoleCovered[RoleNumber] then begin
                        RoleCovered[RoleNumber] := true;
                        CoveredRoles += 1;
                    end;
            until TeamAssignment.Next() = 0;

        TeamCoverage := Round((CoveredRoles / 6) * 100, 1);
    end;
}
