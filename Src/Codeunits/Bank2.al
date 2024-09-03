// codeunit 50100 "BankpOST"
// {
//     // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl. Post Line Subscriber", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
//     // local procedure OnPostBankAccOnBeforeBankAccLedgEntryInsert()
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostBankAccOnBeforeBankAccLedgEntryInsert', '', false, false)]
//     local procedure UpdateChequeDetails(BankAccount: Record "Bank Account"; var BankAccountLedgerEntry: Record "Bank Account Ledger Entry"; var GenJournalLine: Record "Gen. Journal Line")
//     var
//         BankPaymentRec: Record "Gen. Journal Line";
//         BankAccLedgerEntryRec: Record "Bank Account Ledger Entry";
//         VendorLedgerEntryRec: Record "Vendor Ledger Entry";
//         CustomerLedgerEntryRec: Record "Cust. Ledger Entry";
//     begin
//         // Find the bank payment record that was just posted
//         BankPaymentRec.RESET;
//         if BankPaymentRec.FINDLAST then begin
//             repeat
//                 // Check if the bank payment is related to a customer or vendor
//                 if BankPaymentRec."Account Type" = BankPaymentRec."Account Type"::Customer then begin
//                     // Flow UTR No and UTR Date to Customer Ledger Entry
//                     CustomerLedgerEntryRec.INIT;
//                     CustomerLedgerEntryRec."UTR No." := BankPaymentRec."UTR No.";
//                     CustomerLedgerEntryRec."UTR Date" := BankPaymentRec."UTR Date";
//                     // Set other relevant fields for customer ledger entries
//                     // Example: CustomerLedgerEntryRec."Customer No" := BankPaymentRec."Customer No";
//                     // Example: CustomerLedgerEntryRec."Amount" := BankPaymentRec."Amount";
//                     // Example: CustomerLedgerEntryRec."Posting Date" := BankPaymentRec."Posting Date";
//                     CustomerLedgerEntryRec.INSERT;
//                 end
//                 else if BankPaymentRec."Account Type" = BankPaymentRec."Account Type"::Vendor then begin
//                     // Flow UTR No and UTR Date to Vendor Ledger Entry
//                     VendorLedgerEntryRec.INIT;
//                     VendorLedgerEntryRec."UTR No." := BankPaymentRec."UTR No.";
//                     VendorLedgerEntryRec."UTR Date" := BankPaymentRec."UTR Date";
//                     // Set other relevant fields for vendor ledger entries
//                     // Example: VendorLedgerEntryRec."Vendor No" := BankPaymentRec."Vendor No";
//                     // Example: VendorLedgerEntryRec."Amount" := BankPaymentRec."Amount";
//                     // Example: VendorLedgerEntryRec."Posting Date" := BankPaymentRec."Posting Date";
//                     VendorLedgerEntryRec.INSERT;
//                 end;

//                 // Flow UTR No and UTR Date to Bank Account Ledger Entry
//                 BankAccLedgerEntryRec.INIT;
//                 BankAccLedgerEntryRec."UTR No." := BankPaymentRec."UTR No.";
//                 BankAccLedgerEntryRec."UTR Date" := BankPaymentRec."UTR Date";
//                 // Set other relevant fields for bank account ledger entries
//                 // Example: BankAccLedgerEntryRec."Bank Account No" := BankPaymentRec."Bank Account No";
//                 // Example: BankAccLedgerEntryRec."Amount" := BankPaymentRec."Amount";
//                 // Example: BankAccLedgerEntryRec."Posting Date" := BankPaymentRec."Posting Date";
//                 BankAccLedgerEntryRec.INSERT;

//             until BankPaymentRec.NEXT = 0;
//         end;
//     end;
// }
