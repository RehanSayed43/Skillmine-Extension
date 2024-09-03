tableextension 50103 VendorExtt extends Vendor
{
    fields
    {
        field(50100; "MSME"; Boolean)
        {
            Caption = 'MSME';
            DataClassification = ToBeClassified;
        }
        field(50101; "MSME Type"; Option)
        {
            Caption = 'MSME Type';
            DataClassification = ToBeClassified;
            OptionMembers = "-","Micro","Small","Medium";
        }
    }
}
