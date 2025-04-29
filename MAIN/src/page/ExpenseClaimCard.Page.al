page 50004 "Expense Claim Card_TNC"
{
    PageType = Document;
    SourceTable = "ExpenseClaimHeader_TNC";
    Caption = 'Expense Claim';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the expense claim.';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the description of the expense claim.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount of the expense claim.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    Editable = false;
                    ToolTip = 'Specifies the status of the expense claim.';
                    StyleExpr = StatusStyleTxt;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the expense claim was created.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies who created this expense claim.';
                }
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ID of the user who must approve the expense claim.';
                }
                field("Approval Comments"; Rec."Approval Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies comments made by the approver.';
                }
                field("Dataverse ID"; Rec."Dataverse ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the Dataverse ID for integration purposes.';
                    Editable = false;
                }
            }
            part(Lines; "Expense Claim Subform_TNC")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
                Caption = 'Expense Lines';
                Editable = LinesEditable;
            }
        }
        area(FactBoxes)
        {
            part("Document Attachment Factbox"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                UpdatePropagation = Both;
                Provider = Lines;
                SubPageLink = "Table ID" = CONST(50001),  // Use actual table ID for Expense Claim Line
                              "No." = FIELD("Document No."),
                              "Line No." = FIELD("Line No.");
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Comments)
            {
                ApplicationArea = All;
                Caption = 'Comments';
                Image = ViewComments;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // Make lines editable only when status is Open
        LinesEditable := (Rec.Status = Rec.Status::Open);
    end;



    var
        LinesEditable: Boolean;
        StatusStyleTxt: Text;
}