pageextension 51003 "Job setup" extends "Jobs Setup"
{
    layout
    {
        // Add changes to page layout here

        addafter("Job Nos.")
        {
            field("Default Job for Logistics"; rec."Default Job for Logistics")
            {
                ApplicationArea = all;
            }
            field("Default Qty for Logistic"; rec."Default Qty for Logistic")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    //Variables, procedures and triggers are not allowed on Page Customizations
}