namespace Thunderstrike.F1CTRL;

using Microsoft.Finance.GeneralLedger.Posting;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Posting;

codeunit 50206 "F1 Purchase Posting Mgt."
{
    Permissions = tabledata "Purch. Inv. Header" = m;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure CopyRaceToPostedInvoice(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean)
    var
        PurchInvHeader: Record "Purch. Inv. Header";
    begin
        if PurchInvHdrNo = '' then
            exit;

        if not PurchInvHeader.Get(PurchInvHdrNo) then
            exit;

        PurchInvHeader."F1 Race No." := PurchaseHeader."F1 Race No.";
        PurchInvHeader.Modify();
    end;
}
