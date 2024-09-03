pageextension 50117 "Sales Order Page " extends "Sales Order"
{
    layout
    {
        addfirst(General)
        {
            field("No. "; Rec."No.")
            {
                ApplicationArea = all;
            }

            field("Posting No."; Rec."Posting No.")
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