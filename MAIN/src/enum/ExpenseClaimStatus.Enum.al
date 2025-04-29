enum 50000 "ExpenseClaimStatus_TNC"
{
    Extensible = true;

    value(0; "Open") { Caption = 'Open'; }
    value(1; "Submitted") { Caption = 'Submitted'; }
    value(2; "Pending Approval") { Caption = 'Pending Approval'; }
    value(3; "Approved") { Caption = 'Approved'; }
    value(4; "Rejected") { Caption = 'Rejected'; }
    value(5; "Paid") { Caption = 'Paid'; }
}