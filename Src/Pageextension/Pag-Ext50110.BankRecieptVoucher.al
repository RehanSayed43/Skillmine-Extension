pageextension 50110 "Bank Reciept Voucher " extends "Bank Receipt Voucher"
{
    layout
    {
        addafter("Bal. Account Type")
        {
            // field("UTR No."; Rec."UTR No.") { ApplicationArea = all; }
            // field("UTR Date"; Rec."UTR Date") { ApplicationArea = all; }
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = all;
            }
        }
    }
}
