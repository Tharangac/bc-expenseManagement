table 50001 "ExpenseClaimLine_TNC"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = ExpenseClaimHeader_TNC."No.";
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(3; Amount; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(4; Currency; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = Currency.Code;
        }
        field(5; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Payment Type"; Enum "PaymentType_TNC")
        {
            DataClassification = CustomerContent;
        }
        field(7; Description; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Expense Type"; Enum "ExpenseType_TNC")
        {
            DataClassification = CustomerContent;
        }
        field(9; Billable; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(10; Project; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job."No.";
        }
        field(11; "Admin Comment"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(12; "User ID"; Code[50])
        {
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = User."User Name";
        }
        field(14; "Dataverse ID"; Guid)
        {
            DataClassification = CustomerContent;
        }

        field(15; "Expense Claim Header ID"; Guid)
        {
            DataClassification = CustomerContent;
            TableRelation = ExpenseClaimHeader_TNC.SystemId;
            trigger OnValidate()
            var
                ExpenseClaimHeader: Record ExpenseClaimHeader_TNC;
            begin
                ExpenseClaimHeader.GetBySystemId("Expense Claim Header ID");
                Rec."Document No." := ExpenseClaimHeader."No."
            end;
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(IndexKey01; "Dataverse ID")
        {
        }
    }

    trigger OnInsert()
    var
        ExpenseClaimHeader: Record ExpenseClaimHeader_TNC;
    begin
        ExpenseClaimHeader.Get("Document No.");
        "Expense Claim Header ID" := ExpenseClaimHeader.SystemId
    end;
}