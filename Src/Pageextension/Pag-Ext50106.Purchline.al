pageextension 50106 MyExtension extends "Purchase Order Subform"
{
    layout
    {
        addafter("Line Amount")
        {
            field(Deleivery; Rec.Delivery)
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}