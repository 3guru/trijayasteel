pageextension 51002 "Warehouse Shipment" extends "Warehouse Shipment"
{
    layout
    {
        // Add changes to page layout here

        addafter("Shipping Agent Service Code")
        {
            field("Resource No."; rec."Resource No.")
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