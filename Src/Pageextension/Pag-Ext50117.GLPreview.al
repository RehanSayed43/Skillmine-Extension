pageextension 50107 GLs extends "G/L Entries Preview"
{
    layout
    {
        addafter("Bal. Account No.")
        {
            field("Bal Acc name"; BalAccNameNew)
            {
                Caption = 'Bal Acc name';
                ApplicationArea = all;
            }


        }

        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Clear(BalAccNameNew);
        GlAcount.Reset();
        GlAcount.SetRange("No.", Rec."Bal. Account No.");
        if GlAcount.FindFirst() then begin
            BalAccNameNew := GlAcount.Name;
        end;

        Customer.Reset();
        Customer.SetRange("No.", Rec."Bal. Account No.");
        if Customer.FindFirst() then begin
            BalAccNameNew := Customer.Name;
        end;
        Vendor.Reset();
        Vendor.SetRange("No.", Rec."Bal. Account No.");
        if Vendor.FindFirst() then begin
            BalAccNameNew := Vendor.Name;
        end;
        FixedAsset.Reset();
        FixedAsset.SetRange("No.", Rec."Bal. Account No.");
        if FixedAsset.FindFirst() then begin
            BalAccNameNew := FixedAsset.Description;
        end;

        BankAccount.Reset();
        BankAccount.SetRange("No.", Rec."Bal. Account No.");
        if BankAccount.FindFirst() then begin
            BalAccNameNew := BankAccount.Name;
        end;
        Employee.Reset();
        Employee.SetRange("No.", Rec."Bal. Account No.");
        if Employee.FindFirst() then begin
            BalAccNameNew := Employee."First Name";
        end;



    end;

    var
        myInt: Integer;
        GlAcount: Record "G/L Account";
        GlEntries: Record "G/L Entry";
        FixedAsset: Record "Fixed Asset";
        Customer: Record Customer;
        Vendor: Record Vendor;
        BankAccount: Record "Bank Account";
        Employee: Record Employee;
        BalAccNameNew: Text[100];
}