// report 50115 "Sales Perfoma"
// {
//     ApplicationArea = All;
//     Caption = 'Tax Invoice';
//     UsageCategory = ReportsAndAnalysis;
//     DefaultLayout = RDLC;
//     RDLCLayout = 'SalesPTaxInvoice.rdl';
//     //SKILLMINE
//     dataset
//     {
//         dataitem("Sales Header"; "Sales Header")
//         {
//             RequestFilterFields = "No.";
//             column(InvNo_; "No.") { }
//             column(Ship_to_Address; "Ship-to Address") { }
//             column(Ship_to_Address_2; "Ship-to Address 2") { }
//             column(Ship_to_City; "Ship-to City") { }
//             column(Ship_to_Post_Code; "Ship-to Post Code") { }
//             column(Ship_to_Name; "Ship-to Name") { }
//             column(ShipStateCode; ShipStateCode) { }
//             column(ShipToState; ShipToState) { }
//             column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
//             column(Bill_to_Address; "Bill-to Address") { }

//             column(Bill_to_Address_2; "Bill-to Address 2") { }
//             column(Bill_to_City; "Bill-to City") { }
//             column(Bill_to_Name; "Bill-to Name") { }
//             column(Bill_to_Post_Code; "Bill-to Post Code") { }
//             column(BillToState; BillToState) { }
//             column(BillToStateCode; BillToStateCode) { }
//             column(Posting_Date; "Posting Date") { }
//             column(External_Document_No_; "External Document No.")
//             {

//             }
//             column(CustomerGST; CustomerGST)
//             {

//             }
//             column(CustomerPan; CustomerPan)
//             {

//             }
//             column(CustomerSateCode; CustomerSateCode)
//             {

//             }
//             column(CustomerStateName; CustomerStateName)
//             {

//             }
//             column(Document_Date; "Document Date") { }
//             column(Payment_Terms_Code; "Payment Terms Code") { }
//             column(payDescription; payDescription) { }

//             column(IRN; '') { }


//             //comp info
//             column(CopmPicture; compInfo.Picture) { }
//             column(Comp_Name; compInfo.Name) { }
//             column(CompADD; compInfo.Address) { }
//             column(compAdd2; compInfo."Address 2") { }
//             column(EMAIL; compInfo."E-Mail") { }
//             column(GST; compInfo."GST Registration No.") { }
//             column(PAN; compInfo."P.A.N. No.") { }
//             column(CompCONT; compInfo."Phone No.") { }
//             column(CompStateCODE; compStaeCode) { }
//             column(CompState; CompState) { }
//             column(compcity; compInfo."Ship-to City") { }
//             column(Post_Code; compinfo."Post Code") { }
//             column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code") { }
//             //column(BankName; compInfo."Bank Name") { }
//             // column(Particular; Particular)
//             // {

//             // }
//             column(compInfocin; compInfo."Registration No.")
//             {

//             }
//             // column(BankAccNo; compInfo."Bank Account No.") { }
//             column(comments; comments) { }
//             column(Bankno; Bankno)
//             {

//             }
//             column(BankAccno; BankAccno)
//             {

//             }
//             column(BankName; BankName)
//             {

//             }
//             column(BankIFSC; BankIFSC)
//             {

//             }


//             dataitem("Sales Line"; "Sales Line")
//             {
//                 DataItemLinkReference = "Sales Header";
//                 DataItemLink = "Document No." = field("No.");
//                 // DataItemTableView = where(Type = filter());
//                 //DataItemTableView = where(Type = filter('G/L Account'));


//                 // column(serialNo; serialNo) { }
//                 column(Srno; Srno)
//                 {

//                 }
//                 column(No_; "No.") { }
//                 column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
//                 column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
//                 column(Description; Description) { }
//                 column(CommentTypeDescription; CommentTypeDescription + '\n')
//                 { }
//                 column(Description_2; "Description 2") { }
//                 column(HSN_SAC_Code; "HSN/SAC Code") { }
//                 column(Rate; "GST Group Code") { }
//                 column(Quantity; Quantity) { }
//                 column(taxable_value; "Line Amount") { }

//                 column(CGST; CGSTAmt) { }
//                 column(SGST; SGSTAmt) { }
//                 column(IGST; IGSTAmt) { }


//                 column(total; total) { }
//                 column(total1; total1) { }
//                 column(totalGST; totalGST) { }
//                 //column(AmountInWords; AmountInWords) { }
//                 column(Amtinwrds; Amtinwrds)
//                 {

//                 }
//                 column(TaxInWords2; TaxInWords2) { }
//                 column(tax2; totalGST) { }
//                 column(LUTNo; LUTNo) { }
//                 column(CGSTRate; CGSTRate)
//                 {

//                 }
//                 column(SGSTRate; SGSTRate)
//                 {

//                 }
//                 column(IGSTRate; IGSTRate)
//                 {

//                 }

//                 column(GRANDTOTAL; GRANDTOTAL)
//                 {

//                 }






//                 trigger OnAfterGetRecord()
//                 var
//                     myInt: Integer;

//                 begin
//                     Srno := 0;
//                     if "Sales Line".Type = "Sales Line".Type::"G/L Account" then
//                         Srno := 1 else
//                         Srno := 0;


//                     "Sales Invoice Line1".Reset();
//                     "Sales Invoice Line1".SetRange("Document No.", "Sales Header"."No.");
//                     if "Sales Invoice Line1".FindSet() then begin
//                         repeat

//                             if "Sales Invoice Line1".Type = "Sales Invoice Line1".Type::" " then begin
//                                 CommentTypeDescription := CommentTypeDescription + "Sales Invoice Line1".Description;

//                             end;
//                         until "Sales Invoice Line1".Next() = 0;
//                         RecPurchaseLine1.Reset();
//                         RecPurchaseLine1.SetRange("Document Type", "Sales Header"."Document Type");
//                         RecPurchaseLine1.SetRange("Document No.", "Sales Header"."No.");
//                         RecPurchaseLine1.SetFilter("GST Group Code", '<>%1', '');
//                         if RecPurchaseLine1.FindSet() then
//                             repeat
//                                 TaxRecordID := RecPurchaseLine1.RecordId();
//                                 TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
//                                 TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
//                                 TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
//                                 TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
//                                 TaxTransactionValue.SetRange("Visible on Interface", true);
//                                 TaxTransactionValue.SetFilter("Value ID", '%1|%2', 6, 2);
//                                 if TaxTransactionValue.FindSet() then begin

//                                     CGSTRate := TaxTransactionValue.Percent;
//                                     SGSTRate := TaxTransactionValue.Percent;
//                                     CGST += TaxTransactionValue.Amount;
//                                     SGST += TaxTransactionValue.Amount;

//                                     SGSTtxt := 'SGST';
//                                     CGSTtxt := 'CGST';
//                                     TotalCGST += CGST;
//                                     TotalSGST += SGST;
//                                 end else begin
//                                     TaxTransactionValue.Reset();
//                                     TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//tk
//                                     TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
//                                     TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
//                                     TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
//                                     TaxTransactionValue.SetRange("Visible on Interface", true);
//                                     TaxTransactionValue.SetFilter("Value ID", '%1', 3);
//                                     if TaxTransactionValue.FindSet() then
//                                         IGSTRate := TaxTransactionValue.Percent;
//                                     IGST += TaxTransactionValue.Amount;
//                                     IGSTtxt := 'IGST';
//                                     TotalIGST += IGST;

//                                 END;

//                                 Total += RecPurchaseLine1."Line Amount";
//                             //TotalIGST + TotalCGST + TotalSGST;
//                             until RecPurchaseLine1.Next() = 0;
//                         AmountToVendor := Total + CGST + SGST + IGST;
//                         //Naveen--
//                         PostedVoucher.InitTextVariable();
//                         "Sales Header".CalcFields(Amount);
//                         // PostedVoucher.FormatNoText(AmountinWords, Round("Purchase Header".Amount), "Purchase Header"."Currency Code");
//                         PostedVoucher.FormatNoText(AmountinWords, Round(AmountToVendor), "Sales Header"."Currency Code");
//                         Amtinwrds := AmountinWords[1] + AmountinWords[2];


//                         Tax += CGSTAmt + SGSTAmt + IGStAmt;
//                         tax2 := Abs(Tax);
//                         PostedVoucherRep2.InitTextVariable();
//                         PostedVoucherRep2.FormatNoText(Wordsinarray2, Tax2, ' ');
//                         TaxInWords2 := Wordsinarray2[1] + Wordsinarray2[2];


//                     end;



//                 end;

//                 trigger OnPreDataItem()
//                 var
//                     myInt: Integer;
//                 begin

//                 end;


//             }

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//             begin


//                 Clear(comments);


//                 //Compstate
//                 stateRec.Reset();
//                 stateRec.SetRange(Code, compInfo."State Code");
//                 if stateRec.FindFirst() then begin
//                     CompState := stateRec.Description;
//                     compStaeCode := stateRec."State Code (GST Reg. No.)";
//                 end;

//                 //ShipState
//                 stateRec.Reset();
//                 stateRec.SetRange(Code, "Sales Header"."GST Ship-to State Code");
//                 if stateRec.FindFirst() then begin
//                     ShipToState := stateRec.Description;
//                     ShipStateCode := stateRec."State Code (GST Reg. No.)";
//                 end;

//                 //billSate
//                 stateRec.Reset();
//                 stateRec.SetRange(Code, "Sales Header"."GST Bill-to State Code");
//                 if stateRec.FindFirst() then begin
//                     BillToState := stateRec.Description;
//                     BillToStateCode := stateRec."State Code (GST Reg. No.)";
//                 end;


//                 //payDesc
//                 PayTerms.Reset();
//                 PayTerms.SetRange(Code, "Sales Header"."Payment Terms Code");
//                 if PayTerms.FindFirst() then begin
//                     payDescription := PayTerms.Description;
//                 end;

//                 //LUT no

//                 if ("Sales Header"."GST Customer Type" = "Sales Header"."GST Customer Type"::"Deemed Export") or ("Sales Header"."GST Customer Type" = "Sales Header"."GST Customer Type"::Exempted) or ("Sales Header"."GST Customer Type" = "Sales Header"."GST Customer Type"::"SEZ Development") or ("Sales Header"."GST Customer Type" = "Sales Header"."GST Customer Type"::"SEZ Unit") then begin
//                     recLocation.Reset();
//                     recLocation.SetRange(Code, "Sales Header"."Location Code");
//                     if recLocation.FindFirst() then begin
//                         LUTNo := recLocation."LUT No.";
//                     end;

//                 end;

//                 //comments
//                 commentLine.Reset();
//                 commentLine.SetRange(commentLine."No.", "Sales Header"."No.");
//                 if commentLine.FindFirst() then begin
//                     repeat
//                         comments += (commentLine.Comment + ', ');

//                     until commentLine.Next() = 0;

//                 end;

//                 //Customer GST & Panno & State code ?& State Name
//                 Customer.Reset();
//                 Customer.SetRange("No.", "Sales Header"."Sell-to Customer No.");
//                 if Customer.FindFirst() then begin
//                     CustomerGST := Customer."GST Registration No.";
//                     CustomerPan := Customer."P.A.N. No.";
//                     stateRec.Reset();
//                     stateRec.SetRange(Code, Customer."State Code");
//                     if stateRec.FindFirst() then begin
//                         CustomerSateCode := stateRec.Code;
//                         CustomerStateName := stateRec.Description;
//                     end;
//                     Bank.Reset();

//                     if Bank."No." = '' then begin
//                         Bankno := 'BAN00003';
//                         BankAccno := '37477540037';
//                         BankIFSC := 'DEUT0784PBC';
//                         BankName := 'DEUTSCHE BANK- 037'
//                     end else begin
//                         Bank.SetRange("No.", "Sales Header"."Company Bank Account Code");
//                         if Bank.FindFirst() then begin
//                             Bankno := Bank."No.";
//                             BankAccno := Bank."Bank Account No.";
//                             BankIFSC := Bank."IFSC Code";
//                             BankName := Bank.Name;
//                         end;

//                     end;
//                 end;






//             end;


//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(Processing)
//             {
//             }
//         }
//     }



//     trigger OnInitReport()
//     var
//         myInt: Integer;
//     begin
//         Compinfo.get();
//         Compinfo.CalcFields(Picture);

//     end;

//     var
//         compInfo: Record "Company Information";
//         PostedVoucherRep: Report "Posted Voucher";
//         Srno: Integer;
//         SalesCommentLine: Record "Sales Comment Line";
//         PostedVoucherRep2: Report "Posted Voucher";
//         CommentDescription: Text[500];
//         stateRec: Record State;
//         GRANDTOTAL: Decimal;
//         PayTerms: Record "Payment Terms";
//         "Sales Invoice Line1": Record "Sales Line";
//         RecCust: Record Customer;
//         CustomerGST: Code[20];
//         RecPurchaseLine1: Record "Sales Line";
//         Particular: Text[700];
//         CustomerPan: Code[20];
//         recLocation: Record Location;
//         PostedVoucher: Report "Posted Voucher";
//         TaxtransactionValue: Record "Tax Transaction Value";
//         AmountSales: Decimal;
//         commentLine: Record "Sales Comment Line";
//         //GST 
//         GSTDetailLeger: Record "Detailed GST Ledger Entry";
//         Tax: Decimal;
//         tax2: Decimal;
//         baseValue: Decimal;
//         CGSTAmt: Decimal;
//         GSTComponentCGST: Code[20];
//         SGSTAmt: Decimal;
//         GSTComponentSGST: Code[20];
//         Bank: Record "Bank Account";
//         Bankno: Code[100];
//         BankAccno: Text[1000];
//         BankName: Text[100];
//         BankIFSC: Text[190];
//         IGSTAmt: Decimal;

//         CGSTPERCENT: Decimal;
//         SGSTPERCENT: Decimal;
//         IGSTPERCENT: Decimal;
//         CustomerSateCode: Code[10];
//         CustomerStateName: text[20];

//         Customer: Record Customer;
//         GSTComponentIGST: Code[20];
//         UTGST: Decimal;
//         brand: Code[50];

//         TaxDescription: Decimal;
//         taxDesc: text;
//         tdsValue: Decimal;
//         GrossAmt: Decimal;
//         total: Decimal;
//         totalGST: Decimal;
//         CommentTypeDescription: Text[1000];

//         Wordsinarray: array[2] of Text;
//         Wordsinarray2: array[2] of Text;
//         TaxInWords2: Text[200];
//         total1: Decimal;


//         CompState: Text;
//         compStaeCode: Code[10];

//         ShipToState: Text;
//         ShipStateCode: Code[10];

//         BillToState: Text;
//         BillToStateCode: Code[10];

//         //descriptions
//         payDescription: Text;
//         LUTNo: Code[25];

//         comments: Text;
//         Nettotal: Decimal;
//         Email1: Text[80];
//         Phone1: Text[80];
//         // RecPurchaseLine: Record "Purchase Line";
//         sales: Record "Purchase Line";
//         AmountToVendor: Decimal;
//         VendorGST: Code[20];
//         VendorPan: Code[20];
//         VendorContactName: Text[100];

//         IGSTtxt: text[10];
//         CGSTtxt: text[10];
//         SGSTtxt: text[10];
//         States: Text[30];
//         PostCode: Code[20];
//         companyinfo: Record "Company Information";
//         Amount: Decimal;
//         WholeAmount: Decimal;
//         Amtinwrds: Text;
//         // SalesPersnPurchaseCode:Record sales
//         FractionalAmount: Decimal;
//         AmountinWords: array[2] of Text;
//         // AmntinWrds: Text;
//         CGST: Decimal;
//         SGST: Decimal;
//         IGST: Decimal;
//         CGSTRate: Decimal;
//         SGSTRate: Decimal;
//         IGSTRate: Decimal;
//         TotalCGST: Decimal;
//         TotalSGST: Decimal;
//         TotalIGST: Decimal;

//         TaxRecordId: RecordId;
//         // Vendor:Record Vendor;

//         Txatotal: Decimal;


//     local procedure ClearData()
//     Begin
//         IGSTRate := 0;
//         SGSTRate := 0;
//         CGSTRate := 0;
//         SGSTtxt := '';
//         CGSTtxt := '';
//         TotalCGST := 0;
//         TotalSGST := 0;
//         TotalIGST := 0;
//         CGSTtxt := '';
//         IGSTtxt := '';

//         IGST := 0;
//         CGST := 0;
//         SGST := 0;
//         Clear(AmountinWords);
//         AmountToVendor := 0;

//     End;






// }
