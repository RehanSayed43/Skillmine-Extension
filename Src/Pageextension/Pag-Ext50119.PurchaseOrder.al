pageextension 50119 POPage extends "Purchase Order"
{
    layout
    {
        // field)
        // {
        //     DataClassification = ToBeClassified;
        // }
        addafter(Status)
        {
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = all;
            }
            field("Quote No.s"; Rec."Quote No.")
            {
                Editable = true;
                ApplicationArea = all;
            }
            field("Payment Terms"; Rec."Payment Terms")
            {
                ApplicationArea = all;
            }
            field("Deleivery Schedule"; Rec."Deleivery Schedule")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        addafter(Warehouse)
        {

            action("Purchase Order")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    PurchHdr: Record "Purchase Header";

                begin
                    PurchHdr.Reset();
                    PurchHdr.SetRange("No.", Rec."No.");
                    Report.SetTableView(PurchHdr);
                    Report.Run();
                end;
            }
        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        Report: Report 50112;
}