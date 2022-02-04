tableextension 51002 "Jobs Setup" extends "Jobs Setup"
{
    fields
    {
        // Add changes to table fields here
        field(51001; "Default Job for Logistics"; Code[20])
        {
            TableRelation = Job;
        }
        field(51002; "Default Qty for Logistic"; Decimal)
        { }
    }

    var
        myInt: Integer;
}