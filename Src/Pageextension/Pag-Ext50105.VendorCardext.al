pageextension 50105 "Vendor Card extt" extends "Vendor Card"
{
    layout
    {
        addafter(Transporter)
        {
            field(MSME; Rec.MSME)
            {
                ApplicationArea = all;
            }
            field("MSME Type"; Rec."MSME Type")
            {
                ApplicationArea = all;
            }

        }
        modify("Name 2")
        {
            Editable = true;
        }
    }
    trigger OnQueryClosePage(closeaction: Action): Boolean
    var
        myInt: Integer;
    begin
        if Rec.MSME = true then begin
            if Rec."MSME Type" = Rec."MSME Type"::"-" then
                Error('MSME Type is Mandatory');
        end;

        if rec."MSME" = false then begin
            if Rec."MSME Type" <> Rec."MSME Type"::"-" then
                Error('MSME Type should be Blank');
        end;

    end;
}
