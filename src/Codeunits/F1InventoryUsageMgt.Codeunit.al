namespace Thunderstrike.F1CTRL;

using Microsoft.Assembly.Document;
using Microsoft.Assembly.History;
using Microsoft.Assembly.Posting;

codeunit 50201 "F1 Inventory Usage Mgt."
{
    Permissions = tabledata "F1 Inventory Usage" = RI;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterPostedAssemblyLineInsert', '', false, false)]
    local procedure LogAssemblyUsage(var PostedAssemblyLine: Record "Posted Assembly Line"; AssemblyLine: Record "Assembly Line")
    var
        PostedAssemblyHeader: Record "Posted Assembly Header";
        InventoryUsage: Record "F1 Inventory Usage";
    begin
        if PostedAssemblyLine.Type <> PostedAssemblyLine.Type::Item then
            exit;

        if PostedAssemblyLine.Quantity = 0 then
            exit;

        PostedAssemblyHeader.Get(PostedAssemblyLine."Document No.");
        if PostedAssemblyHeader."F1 Race No." = '' then
            exit;

        InventoryUsage.Init();
        InventoryUsage."Entry No." := 0;
        InventoryUsage."Race No." := PostedAssemblyHeader."F1 Race No.";
        InventoryUsage."Item No." := PostedAssemblyLine."No.";
        InventoryUsage."Quantity Used" := PostedAssemblyLine.Quantity;
        InventoryUsage."Unit of Measure Code" := PostedAssemblyLine."Unit of Measure Code";
        InventoryUsage."Posting Date" := PostedAssemblyHeader."Posting Date";
        InventoryUsage."Posted Assembly No." := PostedAssemblyHeader."No.";
        InventoryUsage.Insert();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnAfterUndoPost', '', false, false)]
    local procedure ReverseAssemblyUsage(var PostedAssemblyHeader: Record "Posted Assembly Header"; SuppressCommit: Boolean)
    var
        OriginalUsage: Record "F1 Inventory Usage";
        ReversalUsage: Record "F1 Inventory Usage";
    begin
        OriginalUsage.SetRange("Posted Assembly No.", PostedAssemblyHeader."No.");
        OriginalUsage.SetRange("Reverses Entry No.", 0);
        if OriginalUsage.FindSet() then
            repeat
                ReversalUsage.Init();
                ReversalUsage."Entry No." := 0;
                ReversalUsage."Race No." := OriginalUsage."Race No.";
                ReversalUsage."Item No." := OriginalUsage."Item No.";
                ReversalUsage."Quantity Used" := -OriginalUsage."Quantity Used";
                ReversalUsage."Unit of Measure Code" := OriginalUsage."Unit of Measure Code";
                ReversalUsage."Posting Date" := PostedAssemblyHeader."Posting Date";
                ReversalUsage."Posted Assembly No." := OriginalUsage."Posted Assembly No.";
                ReversalUsage."Reverses Entry No." := OriginalUsage."Entry No.";
                ReversalUsage.Insert();
            until OriginalUsage.Next() = 0;
    end;
}
