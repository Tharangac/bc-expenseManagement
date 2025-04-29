page 50005 "Expense Management Setup_TNC"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Expense Management Setup_TNC";
    Caption = 'Expense Management Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Expense Claim Nos."; Rec."Expense Claim Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number series code used for expense claims.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}