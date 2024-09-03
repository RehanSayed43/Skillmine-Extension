pageextension 50102 Custledger extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("External Doc No"; Rec."External Doc No")
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