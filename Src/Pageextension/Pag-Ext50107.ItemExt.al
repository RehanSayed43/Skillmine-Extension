// pageextension 50107 Items extends "Item Card"
// {
//     layout
//     {
//         addafter(Item)
//         {
//             field(Division; Rec.Division)
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Division field.', Comment = '%';
//             }
//             // field("MRP/Non MRP"; Rec."MRP/Non MRP")
//             // {
//             //     ApplicationArea = All;
//             //     ToolTip = 'Specifies the value of the MRP/Non MRP field.', Comment = '%';
//             // }
//             field(Priority; Rec.Priority)
//             {
//                 ApplicationArea = all;
//             }
//             field("PACK SIZE"; Rec."PACK SIZE")
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the PACK SIZE field.', Comment = '%';
//             }
//             field("Pack-Type"; Rec."Pack-Type")
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Pack-Type field.', Comment = '%';
//             }
//             field(Segement; Rec.Segement)
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Segement field.', Comment = '%';
//             }
//             field(Grade; Rec.Grade)
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Grade field.', Comment = '%';
//             }
//             field(Shape; Rec.Shape)
//             {
//                 ApplicationArea = All;

//                 ToolTip = 'Specifies the value of the Shape field.', Comment = '%';
//             }
//             // field("Promo/Non-Promo"; Rec."Promo/Non-Promo")
//             // {
//             //     ApplicationArea = all;
//             // }
//             field(Tanker; Rec.Tanker)
//             {
//                 ApplicationArea = all;
//             }
//             field("MRP/Nons MRP"; Rec."MRP/Nons MRP")
//             {
//                 ApplicationArea = all;
//             }
//             field("Promo/Non-Promos"; Rec."Promo/Non-Promos")
//             {
//                 ApplicationArea = all;
//             }



//         }
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }