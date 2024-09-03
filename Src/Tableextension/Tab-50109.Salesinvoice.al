tableextension 50109 SalesInv extends "Sales Header"
{
    fields
    {
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