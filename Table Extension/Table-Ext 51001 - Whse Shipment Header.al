tableextension 51001 "Whse Shipment Header" extends "Warehouse Shipment Header"
{
    fields
    {
        // Add changes to table fields here
        field(51001; "Resource No."; Code[20])
        {
            TableRelation = Resource where(Type = const(machine));
            trigger OnValidate()
            var
                JobSetup: Record "Jobs Setup";
                JobPlanLine: Record "Job Planning Line";
                Lineno: Integer;
            begin
                JobSetup.Get();
                JobSetup.TestField("Default Job for Logistics");
                Rec.TestField("Shipping Agent Service Code");
                Rec.TestField("Shipment Date");
                JobPlanLine.SetRange("Job No.", JobSetup."Default Job for Logistics");
                JobPlanLine.SetRange("Job Task No.", Rec."Shipping Agent Service Code");
                if JobPlanLine.FindLast() then
                    Lineno := JobPlanLine."Line No." + 10000
                else
                    Lineno := 10000;
                JobPlanLine.Init();
                JobPlanLine."Line No." := Lineno;
                JobPlanLine."Job No." := JobSetup."Default Job for Logistics";
                JobPlanLine."Job Task No." := Rec."Shipping Agent Service Code";
                JobPlanLine."Line Type" := JobPlanLine."Line Type"::Budget;
                JobPlanLine."Document No." := Rec."No.";
                JobPlanLine.Type := JobPlanLine.Type::Resource;
                JobPlanLine.Validate("Planning Date", Rec."Shipment Date");
                JobPlanLine.validate("No.", Rec."Resource No.");
                JobPlanLine.Validate(Quantity, JobSetup."Default Qty for Logistic");
                JobPlanLine.Insert(true);
            end;
        }
    }

    var
        myInt: Integer;
}