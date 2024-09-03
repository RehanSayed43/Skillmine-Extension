tableextension 50111 vendorbank extends "Vendor Bank Account"
{
    fields
    {
        field(50111; "Vendor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }



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