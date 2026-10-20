namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Assembly.Posting;
using Microsoft.Purchases.Document;
using Microsoft.Purchases.Posting;

codeunit 50200 "F1 Race Management"
{
    procedure CheckRaceIsUpcoming(RaceNo: Code[20])
    var
        RaceEvent: Record "F1 Race Event";
    begin
        if RaceNo = '' then
            exit;

        RaceEvent.Get(RaceNo);
        if RaceEvent.Status <> RaceEvent.Status::Upcoming then
            Error(RaceNotUpcomingErr, RaceEvent."No.", RaceEvent.Status);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnBeforePost', '', false, false)]
    local procedure CheckRaceBeforeAssemblyPost(var AssemblyHeader: Record "Assembly Header")
    begin
        CheckRaceIsUpcoming(AssemblyHeader."F1 Race No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforeCheckAndUpdate', '', false, false)]
    local procedure CheckRaceBeforePurchaseReceipt(var PurchaseHeader: Record "Purchase Header"; var ModifyHeader: Boolean)
    begin
        if PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
            exit;

        if PurchaseHeader.Receive then
            CheckRaceIsUpcoming(PurchaseHeader."F1 Race No.");
    end;

    var
        RaceNotUpcomingErr: Label 'Race %1 is %2. Only Upcoming races can be selected on orders, have assembly orders posted, or receive purchase orders.', Comment = '%1 = race number, %2 = race status';
}
