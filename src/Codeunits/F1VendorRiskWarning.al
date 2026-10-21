namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.Document;
using Microsoft.Purchases.Vendor;

codeunit 50203 "F1CTRL Vendor Risk Warning"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterValidateEvent', 'Buy-from Vendor No.', false, false)]
    local procedure CheckVendorScoreOnVendorSelect(var Rec: Record "Purchase Header"; var xRec: Record "Purchase Header")
    var
        Vendor: Record Vendor;
    begin
        // Only run if a vendor has actually been selected
        if Rec."Buy-from Vendor No." = '' then
            exit;

        // Get the vendor record to check their F1 score
        if Vendor.Get(Rec."Buy-from Vendor No.") then begin
            // If the vendor score is below 30, trigger a high-risk warning popup
            if Vendor."F1 Vendor Score" < 30 then
                Message('⚠️ HIGH RISK WARNING: Supplier %1 ("%2") has an F1 Vendor Score of %3. Proceed with caution!', Vendor."No.", Vendor.Name, Vendor."F1 Vendor Score");
        end;
    end;
}