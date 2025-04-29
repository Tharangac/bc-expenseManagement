table 50003 "Expense Management Setup_TNC"
{
    DataClassification = CustomerContent;
    Caption = 'Expense Management Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Expense Claim Nos."; Code[20])
        {
            Caption = 'Expense Claim Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}