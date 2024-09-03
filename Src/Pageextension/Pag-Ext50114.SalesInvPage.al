pageextension 50100 MyExtensions extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("External Doc No"; Rec."External Doc No")
            {
                ApplicationArea = all;
            }


        }

    }

    actions
    {
        addafter(Email)
        {
            action("Invoice Report")
            {
                ApplicationArea = All;
                Visible = true;



                trigger OnAction()
                var
                    sales: Record "Sales Invoice Header";
                begin
                    sales.SetRange("No.", Rec."No.");
                    Report.SetTableView(sales);

                    Report.Run();
                end;
            }
        }

    }


    var
        myInt: Integer;
        Report: Report 50100;
        BUHEAD: Code[20];

    // trigger OnOpenPage()
    // var

    // begin

    //     FilterDimensions();
    // end;

    // trigger OnAfterGetRecord()
    // var
    //     myInt: Integer;
    // begin

    //     FilterDimensions();
    // end;

    local procedure FilterDimensions()
    var

        DimSetEntry: Record "Dimension Set Entry";
        DimSetID: Integer;
    //BUHEAD: Code[20];
    begin
        DimSetID := Rec."Dimension Set ID";
        if DimSetID <> 0 then begin
            DimSetEntry.SetRange("Dimension Code", 'BU HEAD');
            DimSetEntry.SetRange("Dimension Set ID", DimSetID);
            if DimSetEntry.FindFirst() then begin
                // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
                BUHEAD := DimSetEntry."Dimension Value Code";
            end;
        end;
    end;
}