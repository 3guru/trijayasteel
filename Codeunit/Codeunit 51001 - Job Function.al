codeunit 51001 "Job Function"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, database::"Job Planning Line", 'OnBeforeInsertEvent', '', false, false)]
    local procedure OnInsertJobPlanningLine(var Rec: Record "Job Planning Line"; RunTrigger: Boolean)
    var
        Resource: Record Resource;
    begin
        if (Rec.Type = Rec.Type::Resource) and (Rec."No." <> '') then begin
            Resource.Get(Rec."No.");
            Resource.SetRange("Date Filter", Rec."Planning Date");
            Resource.CALCFIELDS(Capacity, "Qty. on Order (Job)", "Qty. Quoted (Job)", "Qty. on Service Order", "Qty. on Assembly Order");
            if Resource.Capacity - Resource."Qty. on Order (Job)" - Resource."Qty. Quoted (Job)" - Resource."Qty. on Assembly Order" - Resource."Qty. on Service Order"
            - Rec.Quantity < 0 then
                Error('Kapasitas %1 di tanggal %2 sudah overlimit', Rec."No.", Rec."Planning Date");
        end;
    end;

    var
        myInt: Integer;
}