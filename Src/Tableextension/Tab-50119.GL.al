tableextension 50105 GL extends "G/L Entry"
{
    fields
    {
        field(50105; "Bal Acc name"; Text[100])
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