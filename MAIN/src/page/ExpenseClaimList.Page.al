page 50003 "Expense Claim List_TNC"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "ExpenseClaimHeader_TNC";
    Caption = 'Expense Claims';
    CardPageId = "Expense Claim Card_TNC";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the expense claim.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the expense claim.';
                }
                field(TotalAmount; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount of the expense claim.';
                }
                field("Dataverse ID"; Rec."Dataverse ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the Dataverse ID for integration purposes.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewExpenseClaim)
            {
                ApplicationArea = All;
                Caption = 'New';
                Image = New;
                ToolTip = 'Create a new expense claim.';

                trigger OnAction()
                var
                    ExpenseClaimHeader: Record "ExpenseClaimHeader_TNC";
                    ExpenseClaimCard: Page "Expense Claim Card_TNC";
                begin
                    ExpenseClaimHeader.Init();
                    ExpenseClaimHeader.Insert(true);
                    ExpenseClaimCard.SetRecord(ExpenseClaimHeader);
                    ExpenseClaimCard.Run();
                end;
            }
        }
    }
}