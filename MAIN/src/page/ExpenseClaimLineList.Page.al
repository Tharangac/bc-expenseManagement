page 50002 "ExpenseClaimLineList_TNC"
{
    PageType = List;
    SourceTable = ExpenseClaimLine_TNC;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the document number of the expense claim.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number within the expense claim.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount of the ExpenseClaimLine_TNC.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the currency of the expense.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the expense occurred.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the expense was paid by cash or card.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the expense.';
                }
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of expense.';
                }
                field(Billable; Rec.Billable)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this expense can be billed to a customer.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the project related to this expense.';
                }
                field("Admin Comment"; Rec."Admin Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any administrative notes about this expense.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the user who submitted this expense.';
                }
                field("Dataverse ID"; Rec."Dataverse ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the ID for integration with Dataverse.';
                }
            }
        }
    }

    actions
    {
        // Define actions if needed
    }

    trigger OnOpenPage();
    begin
        // Code to execute when the page is opened
    end;
}