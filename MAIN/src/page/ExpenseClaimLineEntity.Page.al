page 50006 "Expense Claim Line Entity_TNC"
{
    APIGroup = 'expense';
    APIPublisher = 'd4p';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'Expense Claim Line Entity';
    DelayedInsert = true;
    EntityName = 'expenseClaimLine';
    EntitySetName = 'expenseClaimLines';
    PageType = API;
    SourceTable = ExpenseClaimLine_TNC;
    ODataKeyFields = "SystemId";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'Document No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(project; Rec.Project)
                {
                    Caption = 'Project';
                }
                field(expenseType; Rec."Expense Type")
                {
                    Caption = 'Expense Type';
                }
                field(paymentType; Rec."Payment Type")
                {
                    Caption = 'Payment Type';
                }
                field(currency; Rec.Currency)
                {
                    Caption = 'Currency';
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                }
                field(billable; Rec.Billable)
                {
                    Caption = 'Billable';
                }
                field(adminComment; Rec."Admin Comment")
                {
                    Caption = 'Admin Comment';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(expenseClaimHeaderID; Rec."Expense Claim Header ID")
                {
                    Caption = 'Expense Claim Header ID';
                }
            }
        }
    }


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        ExpenseClaimLine: Record ExpenseClaimLine_TNC;
        NewLineNo: Integer;
    begin
        ExpenseClaimLine.SetRange("Document No.", Rec."Document No.");
        if ExpenseClaimLine.FindLast() then
            NewLineNo := ExpenseClaimLine."Line No." + 10000
        else
            NewLineNo := 10000;
        Rec."Line No." := NewLineNo;
    end;
}
