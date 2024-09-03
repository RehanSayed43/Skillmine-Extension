pageextension 50115 SalesInvoice extends "Sales Invoice"
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
            field("External Doc No"; Rec."External Doc No")
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