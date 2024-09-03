report 50114 "Credit-Invoice Memo"
{
    ApplicationArea = All;
    Caption = 'CRR-Invoice memo';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'InvoiceMemo.rdl';
    //SKILLMINE
    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";
            column(InvNo_; "No.") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Post_Code; "Ship-to Post Code") { }
            column(Ship_to_Name; "Ship-to Name") { }
            column(ShipStateCode; ShipStateCode) { }
            column(ShipToState; ShipToState) { }
            column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(IRN_Hash; "IRN Hash")
            {

            }
            column(Acknowledgement_No_; "Acknowledgement No.")
            {

            }
            column(Acknowledgement_Date; "Acknowledgement Date")
            {

            }
            column(QR_Code; "QR Code")
            {

            }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(BillToState; BillToState) { }
            column(BillToStateCode; BillToStateCode) { }
            column(Posting_Date; "Posting Date") { }
            column(CustomerGST; CustomerGST)
            {

            }
            column(CustomerPan; CustomerPan)
            {

            }
            column(CustomerSateCode; CustomerSateCode)
            {

            }
            column(CustomerStateName; CustomerStateName)
            {

            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }
            column(Document_Date; "Document Date") { }
            column(Payment_Terms_Code; "Payment Terms Code") { }
            column(payDescription; payDescription) { }

            column(IRN; '') { }


            //comp info
            column(CopmPicture; compInfo.Picture) { }
            column(Comp_Name; compInfo.Name) { }
            column(CompADD; compInfo.Address) { }
            column(compAdd2; compInfo."Address 2") { }
            column(EMAIL; compInfo."E-Mail") { }
            column(GST; compInfo."GST Registration No.") { }
            column(PAN; compInfo."P.A.N. No.") { }
            column(CompCONT; compInfo."Phone No.") { }
            column(CompStateCODE; compStaeCode) { }
            column(CompState; CompState) { }
            column(compcity; compInfo."Ship-to City") { }
            column(Post_Code; compinfo."Post Code") { }
            column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code") { }
            // column(BankName; compInfo."Bank Name") { }
            // column(Particular; Particular)
            // {

            // }
            column(compInfocin; compInfo."Registration No.")
            {

            }
            // column(BankAccNo; compInfo."Bank Account No.") { }
            column(comments; comments) { }

            column(BankAccno; BankAccno)
            {

            }
            column(BankName; BankName)
            {

            }
            column(BankIFSC; BankIFSC)
            {

            }
            column(Work_Description; "Sales Cr.Memo Header".GetWorkDescription())
            {

            }
            column(Billname; Billname)
            {

            }
            column(BillAddress; BillAddress)
            {

            }
            column(BillAddress2; BillAddress2)
            {

            }
            column(Billcity; Billcity)
            {

            }
            column(BillPostcode; BillPostcode)
            {

            }
            column(BankCity; BankCity)
            {

            }
            column(LocationGStno; LocationGStno)
            {

            }


            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
                DataItemLink = "Document No." = field("No.");
                // DataItemTableView = where(Type = filter());
                //DataItemTableView = where(Type = filter('G/L Account'));


                // column(serialNo; serialNo) { }
                column(Srno; Srno)
                {

                }
                column(No_; "No.") { }
                column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code") { }
                column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code") { }
                column(Description; Description) { }
                column(CommentTypeDescription; CommentTypeDescription + '\n')
                { }
                column(Description_2; "Description 2") { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Rate; "GST Group Code") { }
                column(Quantity; Quantity) { }
                column(taxable_value; "Line Amount") { }

                column(CGST; CGSTAmt) { }
                column(SGST; SGSTAmt) { }
                column(IGST; IGSTAmt) { }


                column(total; total) { }
                column(total1; total1) { }
                column(totalGST; totalGST) { }
                column(AmountInWords; AmountInWords) { }
                column(TaxInWords2; TaxInWords2) { }
                column(tax2; totalGST) { }
                column(LUTNo; LUTNo) { }
                column(CGSTRate; CGSTRate)
                {

                }
                column(SGSTRate; SGSTRate)
                {

                }
                column(IGSTRate; IGSTRate)
                {

                }

                column(GRANDTOTAL; GRANDTOTAL)
                {

                }






                trigger OnAfterGetRecord()
                var
                    myInt: Integer;

                begin
                    if ("Sales Cr.Memo Line"."Line No." = 10000) and ("Sales Cr.Memo Line"."Location Code" = '') then
                        CurrReport.Skip();
                    Srno := 0;
                    if "Sales Cr.Memo Line".Type = "Sales Cr.Memo Line".Type::"G/L Account" then
                        Srno := 1 else
                        Srno := 0;
                    Clear(total);

                    Clear(totalGST);

                    CLEAR(CGSTRate);

                    CLEAR(CGSTAmt);

                    CLEAR(GSTComponentCGST);

                    CLEAR(SGSTRate);

                    CLEAR(SGSTAmt);

                    CLEAR(GSTComponentSGST);

                    CLEAR(IGSTRate);

                    CLEAR(IGSTAmt);

                    CLEAR(GSTComponentIGST);

                    Clear(TaxDescription);

                    Clear(taxDesc);
                    Clear(total);

                    Clear(total1);
                    Clear(GRANDTOTAL);
                    Clear(tax2);


                    "Sales Invoice Line1".Reset();
                    "Sales Invoice Line1".SetRange("Document No.", "Sales Cr.Memo Header"."No.");
                    if "Sales Invoice Line1".FindSet() then begin
                        repeat
                            // total1 += "Sales Invoice Line1"."Line Amount";
                            // CommentDescription := SalesCommentLine.Comment;
                            // if ("Sales Invoice Line".Type = "Sales Invoice Line".Type::)
                            if "Sales Invoice Line1".Type = "Sales Invoice Line1".Type::" " then begin
                                CommentTypeDescription := CommentTypeDescription + "Sales Invoice Line1".Description;
                                // CommentTypeDescription :=  "Sa + "Sales Invoice Line1".Description
                            end;
                        until "Sales Invoice Line1".Next() = 0;
                        // Particular := Description + ',' + CommentDescription;

                    end;


                    GSTDetailLeger.RESET;


                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document No.", "Sales Cr.Memo Line"."Document No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."No.", "Sales Cr.Memo Line"."No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document Line No.", "Sales Cr.Memo Line"."Line No.");

                    IF GSTDetailLeger.FINDSET THEN
                        REPEAT

                            IF GSTDetailLeger."GST Component Code" = 'CGST' THEN BEGIN

                                GSTComponentCGST := 'CGST';

                                CGSTRate := GSTDetailLeger."GST %";

                                CGSTAmt += ABS(GSTDetailLeger."GST Amount");

                            END ELSE

                                IF GSTDetailLeger."GST Component Code" = 'SGST' THEN BEGIN

                                    GSTComponentSGST := 'SGST';

                                    SGSTRate := GSTDetailLeger."GST %";

                                    SGSTAmt += ABS(GSTDetailLeger."GST Amount");

                                END ELSE

                                    IF GSTDetailLeger."GST Component Code" = 'IGST' THEN BEGIN

                                        GSTComponentIGST := 'IGST';

                                        IGSTRate := GSTDetailLeger."GST %";

                                        IGSTAmt += ABS(GSTDetailLeger."GST Amount");

                                    END;

                        UNTIL GSTDetailLeger.NEXT = 0;
                    //  total += "Sales Invoice Line"."Line Amount";

                    //  totalGST := CGSTAmt + SGSTAmt + IGSTAmt;
                    GRANDTOTAL := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
                    //total := totalGST + total1;
                    PostedVoucherRep.InitTextVariable();
                    PostedVoucherRep.FormatNoText(Wordsinarray, GRANDTOTAL, ' ');
                    AmountInWords := Wordsinarray[1] + Wordsinarray[2];

                    tax2 += CGSTAmt + SGSTAmt + IGStAmt;
                    // tax2 := Abs(Tax);
                    PostedVoucherRep2.InitTextVariable();
                    PostedVoucherRep2.FormatNoText(Wordsinarray2, tax2, ' ');
                    TaxInWords2 := Wordsinarray2[1] + Wordsinarray2[2];
                end;

                trigger OnPreDataItem()
                var
                    myInt: Integer;
                begin
                    // Clear(PrevDimensionCode1);
                    // Clear(PrevDimensionCode2);
                    // Clear(GLno);
                end;


            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                // if "Sales Cr.Memo Header"."Location Code" = 'SK-MH' then begin
                //     Billname := 'Skillmine Technology Consulting Private Limited';
                //     BillAddress := '2nd Floor, Level 2, Imperium Building, Vijay Nagar Road, ';
                //     BillAddress2 := 'Seven Hills Hospital, Marol, Mumbai Suburban.';
                //     Billcity := 'MUMBAI';
                //     BillPostcode := '400059';
                //     CompState := 'Maharashtra';
                //     LocationGStno := '27AASCS5627E1ZZ';
                //     //  CompState := 'Maharashtra';
                //     // Billstatename := "Sales Invoice Header"."Bill-to City";
                // end else begin
                // Location.Reset();
                // Location.SetRange(Code, "Sales Cr.Memo Header"."Location Code");
                // if Location.FindFirst() then begin
                Clear(Location);
                if Location.get("Sales Cr.Memo Header"."Location Code") then begin
                    Billname := Location.Name;
                    BillAddress := Location.Address;
                    BillAddress2 := Location."Address 2";
                    Billcity := Location.City;
                    BillPostcode := Location."Post Code";
                    CompState := '';
                    LocationGStno := Location."GST Registration No.";
                    compStaeCode := '';

                    stateRec.Reset();
                    // stateRec.SetRange(Code, compInfo."State Code");
                    stateRec.SetRange(Code, Location."State Code");
                    if stateRec.FindFirst() then begin
                        compStaeCode := stateRec."State Code (GST Reg. No.)";
                        CompState := stateRec.Description;
                    end;


                end;
                //   end;


                Clear(comments);


                //Compstate
                // stateRec.Reset();
                // // stateRec.SetRange(Code, compInfo."State Code");
                // stateRec.SetRange(Code, Location."State Code");
                // if stateRec.FindFirst() then begin
                //     compStaeCode := stateRec."State Code (GST Reg. No.)";
                // end;

                //ShipState
                stateRec.Reset();
                stateRec.SetRange(Code, "Sales Cr.Memo Header"."GST Ship-to State Code");
                if stateRec.FindFirst() then begin
                    ShipToState := stateRec.Description;
                    ShipStateCode := stateRec."State Code (GST Reg. No.)";
                end;

                //billSate
                stateRec.Reset();
                stateRec.SetRange(Code, "Sales Cr.Memo Header"."GST Bill-to State Code");
                if stateRec.FindFirst() then begin

                    BillToState := stateRec.Description;
                    BillToStateCode := stateRec."State Code (GST Reg. No.)";
                end;


                //payDesc
                PayTerms.Reset();
                PayTerms.SetRange(Code, "Sales Cr.Memo Header"."Payment Terms Code");
                if PayTerms.FindFirst() then begin
                    payDescription := PayTerms.Description;
                end;

                //LUT no

                if ("Sales Cr.Memo Header"."GST Customer Type" = "Sales Cr.Memo Header"."GST Customer Type"::"Deemed Export") or ("Sales Cr.Memo Header"."GST Customer Type" = "Sales Cr.Memo Header"."GST Customer Type"::Exempted) or ("Sales Cr.Memo Header"."GST Customer Type" = "Sales Cr.Memo Header"."GST Customer Type"::"SEZ Development") or ("Sales Cr.Memo Header"."GST Customer Type" = "Sales Cr.Memo Header"."GST Customer Type"::"SEZ Unit") then begin
                    recLocation.Reset();
                    recLocation.SetRange(Code, "Sales Cr.Memo Header"."Location Code");
                    if recLocation.FindFirst() then begin
                        LUTNo := recLocation."LUT No.";
                    end;
                end;

                //comments
                commentLine.Reset();
                commentLine.SetRange(commentLine."No.", "Sales Cr.Memo Header"."No.");
                if commentLine.FindFirst() then begin
                    repeat
                        comments += (commentLine.Comment + ', ');

                    until commentLine.Next() = 0;

                end;

                //Customer GST & Panno & State code ?& State Name
                Customer.Reset();
                Customer.SetRange("No.", "Sales Cr.Memo Header"."Sell-to Customer No.");
                if Customer.FindFirst() then begin
                    CustomerGST := Customer."GST Registration No.";
                    CustomerPan := Customer."P.A.N. No.";
                    stateRec.Reset();
                    stateRec.SetRange(Code, Customer."State Code");
                    if stateRec.FindFirst() then begin
                        CustomerSateCode := stateRec."State Code (GST Reg. No.)";
                        CustomerStateName := stateRec.Description;
                    end;
                    // Bank.Reset();

                    //  if Bank."No." = '' then begin
                    if "Sales Cr.Memo Header"."Company Bank Account Code" = '' then begin
                        Bankno := 'BAN00003';
                        BankAccno := '000037477540037';
                        BankIFSC := 'DEUT0784PBC';
                        BankName := 'DEUTSCHE BANK';
                        BankCity := 'KHAR WEST';
                    end else begin
                        Bank.SetRange("No.", "Sales Cr.Memo Header"."Company Bank Account Code");
                        if Bank.FindFirst() then begin
                            Bankno := Bank."No.";
                            BankAccno := Bank."Bank Account No.";
                            BankIFSC := Bank."IFSC Code";
                            BankName := Bank."Bank Acc Name";
                            BankCity := Bank.City;
                        end;

                    end;
                end;


            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        Compinfo.get();
        Compinfo.CalcFields(Picture);

    end;

    var
        compInfo: Record "Company Information";
        PostedVoucherRep: Report "Posted Voucher";
        Srno: Integer;
        Billname: Text[130];
        BillAddress: text[200];
        BillAddress2: Text[200];
        Billcity: Text[200];
        BillPostcode: Code[20];
        BillStateCode: Code[20];
        Billstatename: Text[1000];
        Location: Record Location;
        LocationGStno: Code[20];
        BankCity: Text[100];
        SalesCommentLine: Record "Sales Comment Line";
        PostedVoucherRep2: Report "Posted Voucher";
        CommentDescription: Text[500];
        stateRec: Record State;
        GRANDTOTAL: Decimal;
        PayTerms: Record "Payment Terms";
        "Sales Invoice Line1": Record "Sales Cr.Memo Line";
        RecCust: Record Customer;
        CustomerGST: Code[20];
        Particular: Text[700];
        CustomerPan: Code[20];
        recLocation: Record Location;
        AmountSales: Decimal;
        commentLine: Record "Sales Comment Line";
        GSTDetailLeger: Record "Detailed GST Ledger Entry";
        Tax: Decimal;
        tax2: Decimal;
        baseValue: Decimal;
        CGSTAmt: Decimal;
        GSTComponentCGST: Code[20];
        SGSTAmt: Decimal;
        GSTComponentSGST: Code[20];
        IGSTAmt: Decimal;
        CustomerSateCode: Code[10];
        CustomerStateName: text[20];
        StateS: Record State;
        Customer: Record Customer;
        GSTComponentIGST: Code[20];
        UTGST: Decimal;
        brand: Code[50];
        CGSTRate: Decimal;
        SGSTRate: Decimal;
        IGSTRate: Decimal;
        TaxDescription: Decimal;
        taxDesc: text;
        tdsValue: Decimal;
        GrossAmt: Decimal;
        total: Decimal;
        totalGST: Decimal;
        CommentTypeDescription: Text[1000];
        AmountInWords: Text[200];
        Wordsinarray: array[2] of Text;
        Wordsinarray2: array[2] of Text;
        TaxInWords2: Text[200];
        total1: Decimal;
        Bank: Record "Bank Account";
        Bankno: Code[100];
        BankAccno: Text[1000];
        BankName: Text[100];
        BankIFSC: Text[190];
        CompState: Text;
        compStaeCode: Code[10];
        ShipToState: Text;
        ShipStateCode: Code[10];
        BillToState: Text;
        BillToStateCode: Code[10];
        payDescription: Text;
        LUTNo: Code[25];
        comments: Text;

}
