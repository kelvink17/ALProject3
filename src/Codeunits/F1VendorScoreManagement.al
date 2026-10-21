namespace Thunderstrike.F1CTRL;

using Microsoft.Purchases.Document;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Posting;
using Microsoft.Purchases.Vendor;
using Microsoft.Finance.GeneralLedger.Posting;

codeunit 50202 "F1CTRL Vendor Score Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure UpdateVendorScoreOnReceipt(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        Vendor: Record Vendor;
        LateDays: Integer;
        EarlyDays: Integer;
        BonusPoints: Integer;
        HasExpectedReceiptDate: Boolean;
    begin
        if PurchRcpHdrNo = '' then
            exit;

        if not PurchRcptHeader.Get(PurchRcpHdrNo) then
            exit;

        if not Vendor.Get(PurchRcptHeader."Buy-from Vendor No.") then
            exit;

        PurchRcptLine.SetRange("Document No.", PurchRcpHdrNo);
        if PurchRcptLine.FindSet() then
            repeat
                if PurchRcptLine."Expected Receipt Date" <> 0D then begin
                    HasExpectedReceiptDate := true;
                    if PurchRcptLine."Expected Receipt Date" < PurchRcptLine."Posting Date" then
                        LateDays += PurchRcptLine."Posting Date" - PurchRcptLine."Expected Receipt Date"
                    else
                        if PurchRcptLine."Expected Receipt Date" > PurchRcptLine."Posting Date" then
                            EarlyDays += PurchRcptLine."Expected Receipt Date" - PurchRcptLine."Posting Date";
                end;
            until PurchRcptLine.Next() = 0;

        if not HasExpectedReceiptDate then
            exit;

        // If there are late days, apply the penalty
        if LateDays > 0 then begin
            if Vendor."F1 Vendor Score" > (LateDays * 5) then
                Vendor.Validate("F1 Vendor Score", Vendor."F1 Vendor Score" - (LateDays * 5))
            else
                Vendor.Validate("F1 Vendor Score", 0);
        end
        else begin
            if EarlyDays > 0 then
                BonusPoints := EarlyDays * 2
            else
                BonusPoints := 2;

            if Vendor."F1 Vendor Score" <= (100 - BonusPoints) then
                Vendor.Validate("F1 Vendor Score", Vendor."F1 Vendor Score" + BonusPoints)
            else
                Vendor.Validate("F1 Vendor Score", 100); // Cap max score at 100
        end;

        Vendor.Modify();
    end;
}