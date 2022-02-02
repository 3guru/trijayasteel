page 50009 "Sales Order Lines API"
{
    APIPublisher = 'MSI';
    APIGroup = 'POS';
    APIVersion = 'v2.0';
    EntityCaption = 'SOLines';
    EntitySetCaption = 'SOLines';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'SOLines';
    EntitySetName = 'SOLines';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = "Sales Line";
    Extensible = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DocumentNo; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field(DocumentType; Rec."Document Type")
                {
                    ApplicationArea = all;
                }
                field(LineNo; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field(ItemNo; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field(UnitPrice; Rec."Unit Price")
                {
                    ApplicationArea = all;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                }
                field(AmountIncludingVAT; Rec."Amount Including VAT")
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
}