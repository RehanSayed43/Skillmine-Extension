tableextension 50100 MyExtensionCustomer extends "Cust. Ledger Entry"
{
    fields
    {
        field(50101; "External Doc No"; Code[60])
        {
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Invoice Header"."External Doc No" WHERE("No." = Field("Document No.")));

        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}