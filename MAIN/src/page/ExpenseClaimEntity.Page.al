page 50008 "Expense Claim Entity_TNC"
{
    APIGroup = 'expense';
    APIPublisher = 'd4p';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Expense Claim Entity';
    DelayedInsert = true;
    EntityName = 'expenseClaim';
    EntitySetName = 'expenseClaims';
    PageType = API;
    SourceTable = ExpenseClaimHeader_TNC;
    ODataKeyFields = "SystemId";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(createdBy; Rec."Created By")
                {
                    Caption = 'Created By';
                }
                field(approverID; Rec."Approver ID")
                {
                    Caption = 'Approver ID';
                }
                field(approvalComments; Rec."Approval Comments")
                {
                    Caption = 'Approval Comments';
                }
                field(dateCreated; Rec."Date Created")
                {
                    Caption = 'Date Created';
                }
                field(totalAmount; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                part(lines; "Expense Claim Line Entity_TNC")
                {
                    EntityName = 'expenseClaimLine';
                    EntitySetName = 'expenseClaimLines';
                    SubPageLink = "Expense Claim Header ID" = field("SystemId");
                }
            }
        }
    }
}
