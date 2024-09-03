tableextension 50101 Purchase extends "Purchase Header"
{
    fields
    {
        field(50289; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(50290; "Payment Terms"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50291; "Deleivery Schedule"; Text[100])
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