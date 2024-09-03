report 50116 CharOfAccDelete
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Delete Chart of Account';


    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            trigger OnAfterGetRecord()
            var
                GLAcc: Record "G/L Account";
            begin
                if GLAcc.Get("G/L Account"."No.") then
                    GLAcc.DeleteAll();

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
                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
}