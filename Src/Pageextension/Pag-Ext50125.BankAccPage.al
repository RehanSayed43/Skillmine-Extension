pageextension 50125 "Bank Acc Card Page" extends "Bank Account Card"
{
    layout
    {
        addafter(Name)
        {
            field("Bank Acc Name"; Rec."Bank Acc Name")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}