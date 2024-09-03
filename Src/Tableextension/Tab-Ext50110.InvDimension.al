tableextension 50110 EXT extends "Sales Invoice Header"
{
    fields
    {
        field(50120; "ShortCut Dimension3"; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(50101; "External Doc No"; Code[60])
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