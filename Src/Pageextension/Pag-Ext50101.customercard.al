pageextension 50108 "customer card" extends "Customer Card"
{
    layout
    {
        addafter("ARN No.")
        {
            field("Customer LUT No."; Rec."Customer LUT No.") { ApplicationArea = all; }
        }
    }
}
