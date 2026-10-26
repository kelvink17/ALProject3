namespace Thunderstrike.F1CTRL;

using Microsoft.Foundation.NoSeries;

codeunit 50207 "F1 No. Series Mgt."
{
    Permissions =
        tabledata "No. Series" = RI,
        tabledata "No. Series Line" = RIM;

    procedure GetNextRaceNo(): Code[20]
    var
        RaceEvent: Record "F1 Race Event";
        NextNo: Code[20];
    begin
        EnsureNoSeries(RaceSeriesCodeLbl, 'F1 Race Events', 'RACE0001', 'RACE9999');
        repeat
            NextNo := NoSeries.GetNextNo(RaceSeriesCodeLbl);
        until not RaceEvent.Get(NextNo);

        exit(NextNo);
    end;

    procedure GetNextTeamMemberNo(): Code[20]
    var
        TeamMember: Record "F1 Team Member";
        NextNo: Code[20];
    begin
        EnsureNoSeries(TeamMemberSeriesCodeLbl, 'F1 Team Members', 'TM0001', 'TM9999');
        repeat
            NextNo := NoSeries.GetNextNo(TeamMemberSeriesCodeLbl);
        until not TeamMember.Get(NextNo);

        exit(NextNo);
    end;

    local procedure EnsureNoSeries(SeriesCode: Code[20]; Description: Text[100]; StartingNo: Code[20]; EndingNo: Code[20])
    var
        NoSeriesHeader: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        NoSeriesHeader.LockTable();
        if NoSeriesHeader.Get(SeriesCode) then
            exit;

        NoSeriesHeader.Init();
        NoSeriesHeader.Code := SeriesCode;
        NoSeriesHeader.Description := Description;
        NoSeriesHeader."Default Nos." := true;
        NoSeriesHeader."Manual Nos." := true;
        NoSeriesHeader.Insert();

        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := SeriesCode;
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine.Validate("Starting No.", StartingNo);
        NoSeriesLine.Validate("Ending No.", EndingNo);
        NoSeriesLine.Validate("Increment-by No.", 1);
        NoSeriesLine.Insert();
    end;

    var
        NoSeries: Codeunit "No. Series";
        RaceSeriesCodeLbl: Label 'F1-RACE', Locked = true;
        TeamMemberSeriesCodeLbl: Label 'F1-MEMBER', Locked = true;
}
