namespace Thunderstrike.F1CTRL;

page 50209 "F1 Race Event API"
{
    PageType = API;
    Caption = 'F1 Race Event API';

    // API URL properties: .../api/thunderstrike/f1/v1.0/companies(...)/raceEvents
    APIPublisher = 'thunderstrike';
    APIGroup = 'f1';
    APIVersion = 'v1.0';
    EntityName = 'raceEvent';
    EntitySetName = 'raceEvents';

    SourceTable = "F1 Race Event";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                // Unique Identifier (GUID) required for REST APIs
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(raceDate; Rec."Race Date")
                {
                    Caption = 'Race Date';
                }
                field(circuit; Rec.Circuit)
                {
                    Caption = 'Circuit';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
            }
        }
    }
}