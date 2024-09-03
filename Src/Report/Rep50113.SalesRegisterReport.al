report 50113 "Sales Register1"
{
    UsageCategory = Administration;
    ApplicationArea = ALL;
    DefaultLayout = RDLC;
    RDLCLayout = './SalesRegisterGST1.rdl'; //PurchaseRegisterGST1.rdl
    //SKILLMINE


    dataset
    {
        //dataitem(DataItem1000000000; Table122)
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            column(Srno; Srno)
            {
            }
            // column(BC_Document_Type; "Sales Invoice Line".) { }
            column(Document_No; "No.") { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Order_No_; "Order No.")
            {

            }
            column(External_Document_No_; "External Document No.")
            {

            }
            column(Document_Date; "Document Date")
            {

            }

            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(PostingDes; PostingDes)
            {

            }
            column(CustomerGstno; CustomerGstno)
            {

            }
            // column(Vendor_Name; "Buy-from Vendor Name") { }
            // column(Pay_to_Vendor_No_; "Pay-to Vendor No.") { }
            // column(Gstno; "Vendor GST Reg. No.") { }
            column(Vedor_PostingGrp; PostingDes) { }
            // column(Vendor_Invoice_No_; "Vendor Invoice No.") { }
            column(Posting_Date; "Posting Date")
            {
                // Caption = 'Invoice Date';
            }
            column(Procurement_Type; "Nature of Supply") { }
            column(Location_State_Code; "Location State Code" + '' + '-' + '(' + "recStateDesc" + ')') { }
            column(Place_Of_Supply; "Ship-to City") { }

            // column(salespnm; purchaserCode)
            // {
            // }
            column(startdt; startdt)
            {
            }
            column(enddt; enddt)
            {
            }

            column(MapleGSTIN; MapleGSTIN)
            {
            }
            // column(DimensionValueEntry; DimensionValueEntry."Dimension Code")
            // {

            // }
            column(Shortcut_Dimension_1_Code; "Shortcut Dimension 1 Code")
            {

            }
            column(Shortcut_Dimension_2_Code; "Shortcut Dimension 2 Code")
            {

            }
            column(VendorStateCode; recstateDesc2)
            {

            }
            //dataitem(DataItem1000000001; Table123)
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = where("No." = filter(<> ''));
                //kj_filter  //DataItemTableView = WHERE(Type = FILTER("G/L Account" | Item | "Charge (Item)" | "Fixed Asset"), Quantity = FILTER(<> 0));
                //  DataItemTableView = where(Quantity = FILTER(<> 0), Type = filter(Item | "G/L Account" | "Charge (Item)" | "Fixed Asset"));
                // column(Client_G_L_Account_No_; "Client G/L Account No.") { }
                column(Description; Description) { }
                column(No_s; "No.")
                {

                }
                column(ItemNo; ItemNo)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Classification; name) { }
                column(Eligibility; "GST Credit") { }
                column(GSTCode; "GST Group Code") { }
                column(RCM; GST12) { }
                column(Taxable_Value; "Line Amount") { } //taxable
                column(Rate_of_Tax; totalRate) { }
                column(Integrated_tax; IGSTAmt) { }
                column(Central_Tax; CGSTAmt) { }
                column(State_Tax; SGSTAmt) { }
                column(Total_Invoice; Final_Amount) { }

                trigger OnAfterGetRecord()
                begin
                    // clear(total);
                    // clear(Total_Amount);
                    // clear(Final_Amount);

                    // "Purch. Inv. Line".Reset();
                    // "Purch. Inv. Line".SetRange("Document No.", "Purch. Inv. Header"."No.");
                    // if "Purch. Inv. Line".FindSet() then begin
                    //     repeat
                    //         total += "Purch. Inv. Line"."Line Amount";
                    //     until "Purch. Inv. Line".Next() = 0;

                    // end;
                    CLEAR(CGSTRate);

                    CLEAR(CGSTAmt);

                    CLEAR(GSTComponentCGST);

                    CLEAR(SGSTRate);

                    CLEAR(SGSTAmt);

                    CLEAR(GSTComponentSGST);

                    CLEAR(IGSTRate);

                    CLEAR(IGSTAmt);

                    CLEAR(GSTComponentIGST);
                    GSTDetailLeger.Reset();
                    GSTDetailLeger.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                    GSTDetailLeger.SetRange("No.", "Sales Invoice Line"."No.");
                    GSTDetailLeger.SetRange("Document Line No.", "Sales Invoice Line"."Line No.");
                    If GSTDetailLeger.FindSet() then
                        repeat
                            if GSTDetailLeger."GST Component Code" = 'CGST' then begin
                                GSTComponentCGST := 'CGST';
                                CGSTAmt := abs(GSTDetailLeger."GST Amount");
                                CGSTRate := GSTDetailLeger."GST %";

                            end else
                                if GSTDetailLeger."GST Component Code" = 'SGST' then begin
                                    GSTComponentSGST := 'SGST';
                                    SGSTAmt := abs(GSTDetailLeger."GST Amount");
                                    SGSTRate := GSTDetailLeger."GST %";

                                end else
                                    if GSTDetailLeger."GST Component Code" = 'IGST' then begin
                                        GSTComponentIGST := 'IGST';
                                        IGSTAmt := Abs(GSTDetailLeger."GST Amount");
                                        IGSTRate := Abs(GSTDetailLeger."GST %");

                                    end;

                        until GSTDetailLeger.next = 0;
                    totalRate := CGSTRATE + SGSTRATE + IGSTRATE;
                    Total_Amount := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
                    Final_Amount := Total_Amount;

                    if GSTComponentCGST = 'SGST' then begin
                        GstCredit := 'Yes';


                    end else
                        if GSTComponentCGST = 'CGST' then begin
                            GstCredit := 'Yes'
                        end else
                            if GSTComponentCGST = 'IGST' then begin
                                GstCredit := 'Yes'
                            end else begin
                                GstCredit := 'No'
                            end;


                    clear(GST12);
                    GstGroup.Reset();
                    GstGroup.setrange(Code, "Sales Invoice Line"."GST Group Code");
                    if GstGroup."Reverse Charge" = false then begin
                        GST12 := 'No'
                    end else begin
                        GST12 := 'Yes'

                    end;

                    GLacc.Reset();
                    GLacc.SetRange("No.", "Sales Invoice Line"."No.");
                    GLacc.SetFilter("No.", '1000810');
                    if GLacc.FindFirst() then// begin
                                             //name := 'Capital Work-in-Progress'
                        name := 'INPUT Service'
                    else
                        name := 'CG';
                    EmieNo := '';
                    SrlNo := '';


                    // "Purch. Inv. Line".Reset();
                    // "Purch. Inv. Line".SetRange("No.", "Purch. Inv. Line"."Document No.");
                    // "Purch. Inv. Line".SetFilter("GST Credit", 'Availment');
                    // if "Purch. Inv. Line". then begin
                    //     GstCredit := 'Yes'
                    //     else
                    //     GstCredit := 'No';

                    // end;
                    // Purchinvline.Reset();

                    // Clear(GstCredit);

                    // if Purchinvline."GST Credit" = Purchinvline."GST Credit"::Availment then begin
                    //     GstCredit := 'Yes'
                    // end
                    // else
                    //     GstCredit := 'No';
                    // Vendor.Reset();
                    // Vendor.SetRange("No.", "Purch. Inv. Header"."Buy-from Vendor No.");
                    // // Vendor.SetRange(Name,"Purch. Inv. Header"."Pay-to Name");
                    // if Vendor.FindFirst() then begin
                    //     VendorStateCode := Vendor."State Code";
                    // end;

                    Customer.Reset();
                    Customer.SetRange("No.", "Sales Invoice Header"."Sell-to Customer No.");
                    if Customer.FindFirst() then begin
                        VendorStateCode := Customer."State Code";
                        CustomerGstno := Customer."GST Registration No.";
                    end;







                    ServTaxPerc := 0;

                end;

                trigger OnPreDataItem()
                begin
                    ServTaxPerc := 0;
                    PRDt := 0D;
                    Purchinvline.Reset();

                    Clear(GstCredit);


                    // if "Purch. Inv. Line"."GST Credit" = "Purch. Inv. Line"."GST Credit"::Availment then
                    //     GstCredit := 'Yes';

                    // if "Purch. Inv. Line"."GST Credit" = "Purch. Inv. Line"."GST Credit"::" " then
                    //     GstCredit := 'NO';
                    // if "Purch. Inv. Line"."GST Credit" = "Purch. Inv. Line"."GST Credit"::"Non-Availment" then
                    //     GstCredit := 'NO';

                end;
            }

            trigger OnAfterGetRecord()
            var
            // recstateDesc2: Text[100];
            begin

                PostingG.Reset();
                PostingG.SetRange(Code, "Sales Invoice Header"."Customer Posting Group");
                if PostingG.FindFirst() then begin
                    PostingDes := PostingG.Description;
                end;

                recstate.Reset();
                recstate.SetRange(Code, "Sales Invoice Header"."Location State Code");
                if recstate.FindFirst() then begin
                    recstateDesc := recstate.Description;
                end;

                recstate.Reset();
                recstate.SetRange(Code, Customer."State Code");
                if recstate.FindFirst() then begin
                    recstateDesc2 := recstate.Description;
                end;
                Srno += 1;



            end;

            trigger OnPreDataItem()
            begin
                Srno := 0;

                "Sales Invoice Header".SETRANGE("Sales Invoice Header"."Posting Date", startdt, enddt);
                //IF "Purch. Inv. Header".FINDSET THEN;
                // "Purch. Inv. Header"."Purchaser Code" := '';
            end;
        }
        //dataitem(DataItem1000000070; Table124)
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            column(SrnoCRR; SrnoCM) { }
            // column(BC_Document_TypeCRR; "Sales Invoice Line".GetDocumentType()) { }
            column(Document_NoCRR; "No.") { }
            // column(Vendor_NameCRR; "Buy-from Vendor Name") { }
            // column(Pay_to_Vendor_No_s; "Pay-to Vendor No.") { }
            // column(GstnoCRR; "Vendor GST Reg. No.") { }
            column(Sell_to_Customer_NameCR; "Sell-to Customer Name")
            {

            }
            column(Sell_to_Customer_No_CRR; "Sell-to Customer No.")
            {

            }
            column(CustomerGstnoCR; CustomerGstnoCR)
            {

            }
            column(Vedor_PostingGrpCRR; PostingDes) { }
            //column(Vendor_Cr__Memo_No_; "Vendor Cr. Memo No.") { }
            column(Posting_DateCR; "Posting Date") { }
            // Caption = 'Invoice Date'
            column(Procurement_TypeCRR; "Nature of Supply") { }
            column(Location_State_CodeCRR; "recStateDesc") { }
            column(Place_Of_SupplyCRR; "Ship-to City") { }
            column(text1; text1) { }
            column(VendorStateCodeCR; VendorStateCodeCR)
            {

            }
            column(Applies_to_Doc__No_; "Applies-to Doc. No.")
            {

            }
            column(External_Document_No_CR; "External Document No.")
            {

            }
            column(Document_DateCRR; "Document Date")
            {

            }

            // column(salespnm; purchaserCode)
            // {
            // }
            // column(startdt; startdt)
            // {
            // }
            // column(enddt; enddt)
            // {
            // }


            //dataitem(DataItem1000000071; Table125)
            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLinkReference = "Sales Cr.Memo Header";
                DataItemLink = "Document No." = FIELD("No.");
                // DataItemTableView = WHERE(Type = FILTER("G/L Account" | Item | 'Charge (Item)' | "Fixed Asset"),
                //  Quantity = FILTER(<> 0)); //kj
                //  DataItemTableView = where(Quantity = FILTER(<> 0), Type = filter(Item | "G/L Account" | "Charge (Item)" | "Fixed Asset")); //kj
                DataItemTableView = where("No." = filter(<> ''));
                column(No_cr; "No.") { }
                // column(Client_G_L_Account_No_CRR; "Client G/L Account No.") { }
                column(DescriptionCRR; Description) { }
                column(HSN_SAC_CodeCRR; "HSN/SAC Code") { }
                column(ClassificationCRR; namecr) { } ///Do this
                column(EligibilityCRR; "GST Credit") { }//Do this
                column(GSTCodeCRR; "GST Group Code") { }
                column(RCMCRR; GST12CR) { }    //Do this
                column(Taxable_ValueCRR; "Line Amount") { } //taxable
                column(Rate_of_TaxCRR; totalRate) { }
                column(Integrated_taxCRR; IGSTAmt) { }
                column(Central_TaxCRR; CGSTAmt) { }
                column(State_TaxCRR; SGSTAmt) { }
                column(Total_InvoiceCRR; Final_Amount) { }
                column(Shortcut_Dimension_1_CodeCR; "Shortcut Dimension 1 Code")
                {

                }
                column(Shortcut_Dimension_2_CodeCr; "Shortcut Dimension 2 Code")
                {

                }
                trigger OnAfterGetRecord()
                var

                begin
                    text1 := '-';


                    // clear(total);
                    // clear(Total_Amount);
                    // clear(Final_Amount);
                    // "Purch. Inv. Line".Reset();
                    // "Purch. Inv. Line".SetRange("Document No.", "Purch. Inv. Header"."No.");
                    // if "Purch. Inv. Line".FindSet() then begin
                    //     repeat
                    //         total += "Purch. Inv. Line"."Line Amount";
                    //     until "Purch. Inv. Line".Next() = 0;

                    // end;
                    CLEAR(CGSTRate);

                    CLEAR(CGSTAmt);

                    CLEAR(GSTComponentCGST);

                    CLEAR(SGSTRate);

                    CLEAR(SGSTAmt);

                    CLEAR(GSTComponentSGST);

                    CLEAR(IGSTRate);

                    CLEAR(IGSTAmt);

                    CLEAR(GSTComponentIGST);
                    GSTDetailLeger.Reset();
                    GSTDetailLeger.SetRange("No.", "Sales Cr.Memo Line"."No.");
                    GSTDetailLeger.SetRange("Document Line No.", "Sales Cr.Memo Line"."Line No.");
                    If GSTDetailLeger.FindSet() then
                        repeat
                            if GSTDetailLeger."GST Component Code" = 'CGST' then begin
                                GSTComponentCGST := 'CGST';
                                CGSTAmt := abs(GSTDetailLeger."GST Amount");
                                CGSTRate := GSTDetailLeger."GST %";
                            end else
                                if GSTDetailLeger."GST Component Code" = 'SGST' then begin
                                    GSTComponentSGST := 'SGST';
                                    SGSTAmt := abs(GSTDetailLeger."GST Amount");
                                    SGSTRate := GSTDetailLeger."GST %";
                                end else
                                    if GSTDetailLeger."GST Component Code" = 'IGST' then begin
                                        GSTComponentIGST := 'IGST';
                                        IGSTAmt := Abs(GSTDetailLeger."GST Amount");
                                        IGSTRate := Abs(GSTDetailLeger."GST %");
                                    end;

                        until GSTDetailLeger.next = 0;
                    totalRate := CGSTRATE + SGSTRATE + IGSTRATE;

                    Total_Amount := "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
                    Final_Amount := Total_Amount;

                    clear(GST12);
                    GstGroup.Reset();
                    GstGroup.setrange(Code, SalesCRMemoLineL."GST Group Code");
                    if GstGroup."Reverse Charge" = false then begin
                        GST12CR := 'No'
                    end else begin
                        GST12CR := 'Yes'

                    end;

                    GLacc.Reset();
                    GLacc.SetRange("No.", "Sales Cr.Memo Line"."No.");
                    GLacc.SetFilter("No.", '1000810');
                    if GLacc.FindFirst() then// begin
                                             //name := 'Capital Work-in-Progress'
                        namecr := 'INPUT Service'
                    else
                        namecr := 'CG';
                    // EmieNo := '';
                    SrlNo := '';

                    // Vendor.Reset();
                    // Vendor.SetRange("No.", "Sales Cr.Memo Header"."Buy-from Vendor No.");
                    // if Vendor.FindFirst() then begin
                    //     VendorStateCodeCR := Vendor."State Code";
                    // end;
                    Customer.Reset();
                    Customer.SetRange("No.", "Sales Cr.Memo Header"."Sell-to Customer No.");
                    if Customer.FindFirst() then begin
                        VendorStateCodeCR := Customer."State Code";
                        CustomerGstnoCR := Customer."GST Registration No.";
                    end;

                    //  ServTaxPerc := 0;

                end;

            }

            trigger OnAfterGetRecord()
            begin

                //MJ
                // IF RecVendor2.GET("Buy-from Vendor No.") THEN;
                // IF RecState2.GET(RecVendor2."State Code") THEN;
                // PlaceofSupply_CR := RecState2.Description + '(' + RecState2."State Code (GST Reg. No.)" + ')';
                // IF recLoc1.GET("Purch. Cr. Memo Hdr."."Location Code") THEN;
                // IF recVen1.GET("Purch. Cr. Memo Hdr."."Pay-to Vendor No.") THEN;
                // IF payterms1.GET("Purch. Cr. Memo Hdr."."Payment Terms Code") THEN;
                //MJ
                SrnoCM += 1;
            end;

            trigger OnPreDataItem()
            begin
                SrnoCM := 0;
                "Sales Cr.Memo Header".SETRANGE("Sales Cr.Memo Header"."Posting Date", startdt, enddt); //MJ
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Start Date"; startdt)
                    {
                        ApplicationArea = All;
                    }
                    field("End Date"; enddt)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        // IMEI_SERIAL_SHOW := FALSE
    end;

    // trigger OnPreReport()
    // begin
    //     //RecItemLed.GET;

    //     cnt := 1;
    //     IF USERID IN ['ADMIN', 'ACCAPV', 'PUREXE2'] THEN
    //         IMEI_SERIAL_SHOW := TRUE
    //     ELSE
    //         IMEI_SERIAL_SHOW := FALSE; //Win-234 20-03-2019
    // end;

    var
        salesp: Record "Salesperson/Purchaser";//"13";
        staterec: Record State;//"13762";
        VendorStateCode: Code[10];
        item: Record Item;//"27";
                          // schem: Record "Scheme Details";//"50001";
        GstCredit: Code[20];
        saleshdr: Record "Sales Header";//"36";
        purchhdr: Record "Purchase Header";//"38";
        VendorStateCodeCR: Code[10];
        Srno: Integer;
        SrnoCM: Integer;
        startdt: Date;
        enddt: Date;
        namecr: text[100];
        RecVendor: Record Vendor;//"23";
        CompInfo: Record "Company Information";//"79";
        payterms: Record "Payment Terms";//"3";
        postedshipment: Record "Purch. Rcpt. Header";//"120";
        RecItemLed: Record "Item Ledger Entry";//"32";
        PurchLine: Record "Purchase Line";//"39";
        ServTaxPerc: Decimal;
        PurchRectLine: Record "Purch. Rcpt. Line";//"121";
        PRDt: Date;
        EmieNo: Code[30];
        SrlNo: Code[30];
        cnt: Integer;
        ItemNo: Code[20];
        CustomerGstnoCR: Code[20];
        Vendor: Record Vendor;
        PINVL: Record "Purch. Inv. Line";//"123";
        ServTaxamt: Decimal;
        reclocation: Record Location;//"14";
        glacnt: Record "G/L Account";//"15";
        GRTOTLCY: Decimal;
        GST12CR: Text[10];
        DimensionValueEntry: Record "Dimension Set Entry";
        purchaserCode: Code[50];
        VendorPartCode: Code[50];
        GSTDetailLeger: Record "Detailed GST Ledger Entry";//"16419";
        CGSTRates: Decimal;
        //CGSTRATES:DECIMAL;
        //SGSTRATES:DECIMAL;
        //IGSTRATED:DECIMAL;
        //CGST:DECIMAL;
        //IGST:DECIMAL;
        //SGST:DECIMAL;
        //TOTALCGST:DECIMAL;
        //TOTALSGST:DECIMAL;
        //TOTALIGST:DECIMAL;
        //CGSTAMT:DECIMAL;

        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        SGSTRates: Decimal;
        IGSTRates: Decimal;
        IGSTAmt: Decimal;
        GSTComponentCGST: Text;
        GSTComponentSGST: Text;
        GSTComponentIGST: Text;
        GSTTIN_No: Code[20];
        Vend_State: Code[20];
        PlaceOfSupply: Text;
        MapleGSTIN: Code[20];
        StateCodeVendor: Code[10];
        recLoc: Record Location;//"14";
        recVen: Record Vendor;//"23";
        recGSTSetup: Record "GST Setup";//"16408";
        recPostedCRmemo: Record "Purch. Cr. Memo Hdr.";//"124";
        CrDocument: Text;
        CrDate: Date;
        recLoc1: Record Location;//"14";
        recVen1: Record Vendor;//"23";
        payterms1: Record "Payment Terms";//"3";
        RecVendor1: Record Vendor;//"23";
        CGSTAmt1: Decimal;
        CGSTRate1: Decimal;
        GSTComponentCGST1: Text;
        SGSTAmt1: Decimal;
        SGSTRate1: Decimal;
        GSTComponentSGST1: Text;
        IGSTAmt1: Decimal;
        IGSTRate1: Decimal;
        GSTComponentIGST1: Text;
        RecVendor2: Record Vendor;//"23";
        RecState2: Record State;// "13762";
        PlaceofSupply_CR: Text;
        IMEI_SERIAL_SHOW: Boolean;
        // RecFre: Record "13798"; //not found_kj
        Frt: Decimal;
        //  RecFre1: Record "13798";//not found_kj
        Frt1: Decimal;
        Category: code[30];
        itemRec: Record Item;
        Customer: Record Customer;

        //my
        GLacc: Record "G/L Account";
        name: Text[100];
        PostingG: Record "Vendor Posting Group";
        PostingDes: text[220];
        PostingDes2: text[20];
        Purchinvline: Record "Purch. Inv. Line";
        taxtransactionValue: Record "Tax Transaction Value";
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        TotalIGST: Decimal;
        TotalSGST: Decimal;
        TotalCGST: Decimal;
        Taxrecordid: RecordId;
        IGSTRATE: Decimal;
        CGSTRATE: Decimal;
        SGSTRATE: Decimal;
        Total: Decimal;
        Grandtotal: Decimal;

        //Detail
        Satename: Text[100];
        StateCode: text[50];
        // Total: Decimal;

        // compinfo: Record "Company Information";
        GSTDetailLegers: Record "Detailed GST Ledger Entry";
        CGSTAmts: Decimal;
        // CGSTRate: Decimal;
        GSTComponentCGSTs: Code[20];
        SGSTAmts: Decimal;
        // SGSTRate: Decimal;
        GSTComponentSGSTs: Code[20];
        IGSTAmts: Decimal;
        text1: Text[10];
        // IGSTRate: Decimal;

        GSTComponentIGSTs: Code[20];
        Amount: Decimal;
        Total_Amount: Decimal;
        // repcheck: report Check;
        AmountInWords: Text[200];
        wordsinarray: array[2] of text;
        CustomerGstno: Code[20];
        Final_Amount: Decimal;
        Address1: Text[50];
        Address2: Text[50];
        City: Text[50];
        PostCode: Text[50];
        countryCode: Text[50];
        //  PostedVoucherRep: Report "Posted Voucher";
        totalRate: Integer;
        GstGroup: Record "GST Group";
        GST12: text[10];
        recstate: Record State;
        recstateDesc2: Text[100];
        recStateDesc: Text[100];
        PurcCrMemoheadr: Record "Purch. Cr. Memo Hdr.";
        PurchCrMemoLine: Record "Purch. Cr. Memo Line";
        SalesCRMemoheader: Record "Sales Cr.Memo Header";
        SalesCRMemoLineL: Record "Sales Cr.Memo Line";
        doc: Code[100];
        doccr: Code[100];

        "BC Document Type": Code[100];
        BC_Document_TypeCR: Code[100];
        Vendor_Name: Text[100];
        Gstno: Code[50];
        Vedor_PostingGrp: Code[50];
        Location_State_Code: Code[50];
        Vendor_Invoice_No: Code[35];
        Posting_Date: Date;
        Procurement_Type: Code[50];
        Place_of_Supply: Text[100];
        Client_G_L_Account_No: Code[10];
        Description: Text[120];
        HSN: code[20];
        Classification: Text[120];
        Eligibility: Code[120];
        // GSTCode: Code[20];
        // RCM: text[120];
        // Taxable_Value: Decimal;
        // Integrated_tax: Decimal;
        // Central_Tax: Decimal;
        // State_Tax: Decimal;
        Total_Invoice: Decimal;
        BC_DocumentType: text[20];
        fromdate: Date;
        Todate: Date;

    //documenttype:




}