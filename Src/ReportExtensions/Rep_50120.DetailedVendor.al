reportextension 50120 Detailed extends "Vendor - Detail Trial Balance"
{
    dataset
    {
        add("Vendor Ledger Entry")
        {
            column("DocumentExternalNo"; DocNoExtNo)
            {


            }


        }
        modify("Vendor Ledger Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                myInt: Integer;
            begin
                //  Clear("Vendor Ledger Entry");
                Clear(DocNoExtNo);
                if "Vendor Ledger Entry"."External Document No." <> '' then begin
                    DocNoExtNo := "Vendor Ledger Entry"."External Document No."
                end else begin
                    DocNoExtNo := "Vendor Ledger Entry"."Document No.";
                end;


            end;
        }


        // Add changes to dataitems and columns here
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }


    var
        DocNoExtNo: Text[100];
}