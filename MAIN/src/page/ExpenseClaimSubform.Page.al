page 50001 "Expense Claim Subform_TNC"
{
    PageType = ListPart;
    SourceTable = "ExpenseClaimLine_TNC";
    Caption = 'Lines';
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the line number within the expense claim.';
                    Visible = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the amount of the expense.';
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
                    ToolTip = 'Specifies the project this expense is related to.';
                }
                field("Admin Comment"; Rec."Admin Comment")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies any administrative comments about this expense.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Upload)
            {
                ApplicationArea = All;
                Caption = 'Upload Receipt';
                Image = Attachments;
                ToolTip = 'Upload a receipt image for this expense claim.';

                trigger OnAction()
                var
                    DocAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocAttachmentDetails.OpenForRecRef(RecRef);
                    DocAttachmentDetails.RunModal();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Date" := WorkDate();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        exit(true);
    end;

}