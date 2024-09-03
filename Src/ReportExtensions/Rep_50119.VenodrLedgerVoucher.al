// reportextension 50119 MyExtension extends "Posted Voucher"
// {
//     dataset
//     {
//         // addlast("G/L Entry")
//         // {
//         //     //  column(Global_Dimension_1_Code; "Global Dimension 1 Code")
//         //     //     {

//         //     //     }

//         //     // dataitem("G/L Entrys"; "G/L Entry")
//         //     // {
//         //     //     column(Global_Dimension_1_Code; "Global Dimension 1 Code")
//         //     //     {

//         //     //     }
//         //     //     column(Global_Dimension_2_Code; "Global Dimension 2 Code")
//         //     //     {

//         //     //     }
//         //     //     column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
//         //     //     {

//         //     //     }
//         //     //     column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
//         //     //     {

//         //     //     }


//         //     // }
//         // }
//         add("G/L Entry")
//         {
//             column(Global_Dimension_1_Code; "Global Dimension 1 Code")
//             {

//             }
//             column(Global_Dimension_2_Code; "Global Dimension 2 Code")
//             {

//             }
//             column(Shortcut_Dimension_3_Code; "Shortcut Dimension 3 Code")
//             {

//             }
//             column(ShortcutDimension5Code_GLEntry; "Shortcut Dimension 5 Code")
//             {
//             }
//             column(ShortcutDimension6Code_GLEntry; "Shortcut Dimension 6 Code")
//             {
//             }
//             column(ShortcutDimension7Code_GLEntry; "Shortcut Dimension 7 Code")
//             {
//             }
//             column(ShortcutDimension8Code_GLEntry; "Shortcut Dimension 8 Code")
//             {
//             }
//             column(Shortcut_Dimension_4_Code; "Shortcut Dimension 4 Code")
//             {

//             }


//         }


//     }



//     var
//         vendor: Record "Vendor Ledger Entry";
//         BUHEAD: Code[20];
//         CONTRACTTYPE: Code[20];
//         COSTCENTR: Code[20];
//         GSTTYPE: Code[20];
//         MONTH: Code[20];
//         NATUREOFCOST: Code[20];
//         TECHDOMAIN: Code[20];
//     //Rec: Record "Vendor Ledger Entry";
//     // trigger OnPreReport()
//     // var
//     //     myInt: Integer;
//     // begin
//     //     FilterDimensions();
//     // end;


//     // local procedure FilterDimensions()
//     // var

//     //     DimSetEntry: Record "Dimension Set Entry";
//     //     DimSetID: Integer;
//     // //BUHEAD: Code[20];
//     // begin
//     //     DimSetID := "G/L Entry"."Dimension Set ID";
//     //     if DimSetID <> 0 then begin
//     //         DimSetEntry.SetRange("Dimension Code", 'BU HEAD');
//     //         DimSetEntry.SetRange("Dimension Code", 'CONTRACT TYPE');
//     //         DimSetEntry.SetRange("Dimension Code", 'COST CENTR');
//     //         DimSetEntry.SetRange("Dimension Code", 'GST TYPE');
//     //         //  DimSetEntry.SetRange("Dimension Code", 'GST TYPE');
//     //         DimSetEntry.SetRange("Dimension Code", 'MONTH');
//     //         DimSetEntry.SetRange("Dimension Code", 'NATURE OF COST');
//     //         DimSetEntry.SetRange("Dimension Code", 'TECH DOMAIN');
//     //         DimSetEntry.SetRange("Dimension Set ID", DimSetID);
//     //         if DimSetEntry.FindFirst() then begin
//     //             // Rec.SetRange(BUHEAD, DimSetEntry."Dimension Value Code");
//     //             BUHEAD := DimSetEntry."Dimension Value Code";
//     //             CONTRACTTYPE := DimSetEntry."Dimension Value Code";
//     //             COSTCENTR := DimSetEntry."Dimension Value Code";
//     //             GSTTYPE := DimSetEntry."Dimension Value Code";
//     //             MONTH := DimSetEntry."Dimension Value Code";
//     //             NATUREOFCOST := DimSetEntry."Dimension Value Code";
//     //             TECHDOMAIN := DimSetEntry."Dimension Value Code";

//     //         end;
//     //     end;
//     // end;

//     // trigger OnPostReport()
//     // var
//     //     myInt: Integer;
//     // begin

//     // end;
// }