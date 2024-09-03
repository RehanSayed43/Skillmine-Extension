pageextension 50104 "Location EXT" extends "Location Card"
{
    layout
    {
        addafter("Country/Region Code")
        {
            field("LUT No."; Rec."LUT No.")
            {
                ApplicationArea = all;
            }
        }
    }
}
