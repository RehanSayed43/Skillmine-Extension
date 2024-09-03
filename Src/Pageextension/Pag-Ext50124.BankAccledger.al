pageextension 50124 BankLedger extends "Bank Account Ledger Entries"
{
    layout
    {
        addafter("Bank Account No.")
        {
            field(Bankname; Bankname)
            {
                ApplicationArea = all;
            }

            // trigger OnAfterGetRecord()
            // var
            //     myInt: Integer;
            // begin

            // end;

        }



        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        Bankname: Text[100];
        bankacc: Record "Bank Account";
        banledger: Record "Bank Account Ledger Entry";

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        bankacc.Reset();
        bankacc.SetRange("No.", Rec."Bank Account No.");
        if bankacc.FindFirst()
        then begin
            Bankname := bankacc.Name;
        end;



    end;
}