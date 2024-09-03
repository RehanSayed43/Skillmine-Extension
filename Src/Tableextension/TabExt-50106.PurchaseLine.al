tableextension 50107 MyExtension extends "Purchase Line"
{
    fields
    {
        field(50101; Delivery; Text[100])
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