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
            repeater(Races)
            {
                field("No."; Rec."No.") { ApplicationArea = All; ToolTip = 'Specifies the race number.'; }
                field(Name; Rec.Name) { ApplicationArea = All; ToolTip = 'Specifies the race name.'; }
                field("Race Date"; Rec."Race Date") { ApplicationArea = All; ToolTip = 'Specifies the race date.'; }
                field(Circuit; Rec.Circuit) { ApplicationArea = All; ToolTip = 'Specifies the circuit.'; }
            }
        }
    }
}
