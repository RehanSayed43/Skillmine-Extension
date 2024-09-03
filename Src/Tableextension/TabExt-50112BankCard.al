tableextension 50112 "Bank Acc Card" extends "Bank Account"
{
    fields
    {
        field(50120; "Bank Acc Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}