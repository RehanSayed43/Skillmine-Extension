pageextension 50120 PostedMemo extends "Posted Sales Credit Memo"
{
    layout
    {
        addafter("Applies-to Doc. Type")
        {
            // field("Applies-to Doc. No.1"; Rec."Applies-to Doc. No.")
            // {
            //     ApplicationArea = all;
            // }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter("Generate IRN")
        {
            action("Credit Note")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    sales: Record "Sales Cr.Memo Header";
                begin
                    sales.SetRange("No.", Rec."No.");
                    Report.SetTableView(sales);
                    Report.Run();


                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        Report: Report "Credit-Invoice Memo";
}