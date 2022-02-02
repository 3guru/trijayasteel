page 50000 "Item List API"
{
    PageType = API;

    APIPublisher = 'MSI';
    APIGroup = 'POS';
    APIVersion = 'v2.0';

    EntityName = 'ItemList';
    EntitySetName = 'Items';

    EntityCaption = 'ItemList';
    EntitySetCaption = 'Items';


    SourceTable = Item;
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(ItemNo; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = all;
                }
                field(PictureAsJson; PictureAsJson)
                {
                    ApplicationArea = all;
                }
                field(ItemCategoryCode; Rec."Item Category Code")
                {
                    ApplicationArea = all;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = all;
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        PictureAsJson: Text;

    trigger OnAfterGetRecord()
    var
        GetItemPic: Codeunit "JA Get Item Pic";
    begin
        PictureAsJSON := GetItemPic."Pic as JSON"(Rec."No.");
    end;
}