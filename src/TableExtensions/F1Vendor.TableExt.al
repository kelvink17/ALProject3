namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.Vendor;

tableextension 50204 "F1 Vendor" extends Vendor
{
    fields
    {
        field(50200; "F1 Vendor Score"; Decimal)
        {
            Caption = 'F1 Vendor Score';
            DataClassification = CustomerContent;
            MinValue = 0;
            MaxValue = 100;
        }
    }
}
