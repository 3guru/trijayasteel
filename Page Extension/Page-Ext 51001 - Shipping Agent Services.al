pageextension 51001 "Shipping Agent Sevices" extends "Shipping Agent Services"
{
    layout
    {
        // Add changes to page layout here
        modify(Code)
        {
            Visible = false;
        }
        addbefore(Code)
        {
            field(Jurusan; rec.Code)
            {
                ApplicationArea = all;
                trigger OnLookup(var Text: Text): Boolean
                var
                    JobSetup: Record "Jobs Setup";
                    JobTaskLine: Record "Job Task";
                begin
                    JobSetup.Get();
                    JobTaskLine.SetRange("Job No.");
                    if Page.RunModal(Page::"Job Task List", JobTaskLine) = Action::LookupOK then
                        Rec.Code := JobTaskLine."Job Task No.";
                end;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    //Variables, procedures and triggers are not allowed on Page Customizations
}