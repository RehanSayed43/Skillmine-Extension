pageextension 50123 vendorbank extends "Vendor Bank Account Card"
{
    layout
    {
        addafter(Name)
        {
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }

        }

    }


    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}