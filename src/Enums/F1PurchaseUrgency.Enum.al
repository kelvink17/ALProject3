namespace Thunderstrike.F1CTRL;

enum 50202 "F1 Purchase Urgency"
{
    Extensible = true;

    value(0; Normal)
    {
        Caption = 'Normal';
    }
    value(1; High)
    {
        Caption = 'High';
    }
    value(2; Low)
    {
        Caption = 'Low';
    }
}
