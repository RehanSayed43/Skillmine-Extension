pageextension 50116 SalesCrMemo extends "Sales Credit Memo"
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