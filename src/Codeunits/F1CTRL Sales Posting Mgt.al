namespace Thunderstrike.F1CTRL;

using Microsoft.Sales.Posting;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;

codeunit 50204 "F1CTRL Sales Posting Mgt"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeSalesInvHeaderInsert', '', false, false)]
    local procedure CopyRaceEventToPostedInvoice(var SalesInvHeader: Record "Sales Invoice Header"; var SalesHeader: Record "Sales Header")
    begin
        SalesInvHeader."F1 Race Event No." := SalesHeader."F1 Race Event No.";
    end;
}