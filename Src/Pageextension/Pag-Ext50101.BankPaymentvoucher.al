pageextension 50101 "Bank Payment voucher " extends "Bank Payment Voucher"
{
    layout
    {
        addafter("Bank Payment Type")
        {
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = all;
            }
            // field("UTR No."; Rec."UTR No.") { ApplicationArea = all; }
            // field("UTR Date"; Rec."UTR Date") { ApplicationArea = all; }
        }
    }
}
