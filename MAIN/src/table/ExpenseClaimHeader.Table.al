table 50000 "ExpenseClaimHeader_TNC"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
            begin
                if Rec."No." <> xRec."No." then begin
                    GetSetup();
                    NoSeries.TestManual(GetNoSeriesCode());
                    Rec."No. Series" := '';
                end;
            end;
        }

        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }

        field(3; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("ExpenseClaimLine_TNC".Amount where("Document No." = field("No.")));
        }

        field(4; Status; Enum "ExpenseClaimStatus_TNC")
        {
            DataClassification = CustomerContent;
            Editable = false;
        }

        field(5; "Dataverse ID"; Guid)
        {
            Caption = 'Dataverse ID';
            DataClassification = CustomerContent;
        }

        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = "No. Series";
        }

        field(7; "Approver ID"; Code[50])
        {
            Caption = 'Approver ID';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = "User Setup"."User ID";
        }

        field(8; "Approval Comments"; Text[250])
        {
            Caption = 'Approval Comments';
            DataClassification = CustomerContent;
        }

        field(9; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
        }

        field(10; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        ExpenseClaimLine: Record "ExpenseClaimLine_TNC";
    begin
        ExpenseClaimLine.SetRange("Document No.", "No.");
        ExpenseClaimLine.DeleteAll(true);
    end;

    trigger OnInsert()
    begin
        InitInsert();

        "Date Created" := WorkDate();
        Status := Status::Open;
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
    begin
        GetSetup();

        NoSeriesCode := ExpenseManagementSetup."Expense Claim Nos.";

        if NoSeries.IsAutomatic(NoSeriesCode) then
            exit(NoSeriesCode);

        if NoSeries.HasRelatedSeries(NoSeriesCode) then
            if NoSeries.LookupRelatedNoSeries(NoSeriesCode, Rec."No. Series") then
                exit(Rec."No. Series");

        exit(NoSeriesCode);
    end;

    procedure InitInsert()
    var
        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
    begin
        if "No." = '' then begin
            NoSeriesCode := GetNoSeriesCode();
            "No. Series" := NoSeriesCode;
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series", "Date Created");
        end;
    end;

    local procedure GetSetup()
    begin
        if not ExpenseManagementSetup.Get() then begin
            ExpenseManagementSetup.Init();
            ExpenseManagementSetup.Insert();
        end;
    end;

    var
        ExpenseManagementSetup: Record "Expense Management Setup_TNC";
}