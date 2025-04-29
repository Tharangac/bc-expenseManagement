permissionset 50000 "Expense Per_TNC"
{
    Caption = 'Expense Management - Super';
    Assignable = true;
    Permissions = tabledata "Expense Management Setup_TNC" = RIMD,
        tabledata ExpenseClaimHeader_TNC = RIMD,
        tabledata ExpenseClaimLine_TNC = RIMD,
        table "Expense Management Setup_TNC" = X,
        table ExpenseClaimHeader_TNC = X,
        table ExpenseClaimLine_TNC = X,
        codeunit DocumentAttachment_TNC = X,
        page "Expense Claim Card_TNC" = X,
        page "Expense Claim List_TNC" = X,
        page "Expense Claim Subform_TNC" = X,
        page "Expense Management Setup_TNC" = X,
        page ExpenseClaimLineList_TNC = X;
}