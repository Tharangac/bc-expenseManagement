codeunit 50000 "DocumentAttachment_TNC"
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        ExpenseClaimLine: Record ExpenseClaimLine_TNC;
    begin
        case DocumentAttachment."Table ID" of
            DATABASE::ExpenseClaimLine_TNC:
                begin
                    RecRef.Open(DATABASE::ExpenseClaimLine_TNC);
                    if ExpenseClaimLine.Get(DocumentAttachment."No.", DocumentAttachment."Line No.") then
                        RecRef.GetTable(ExpenseClaimLine);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        LineNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::ExpenseClaimLine_TNC:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    FieldRef := RecRef.Field(2);
                    LineNo := FieldRef.Value;

                    DocumentAttachment.SetRange("Table ID", DATABASE::ExpenseClaimLine_TNC);
                    DocumentAttachment.SetRange("No.", RecNo);
                    DocumentAttachment.SetRange("Line No.", LineNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        LineNo: Integer;
    begin
        case RecRef.Number of
            DATABASE::ExpenseClaimLine_TNC:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    FieldRef := RecRef.Field(2);
                    LineNo := FieldRef.Value;
                    DocumentAttachment.Validate("Table ID", DATABASE::ExpenseClaimLine_TNC);
                    DocumentAttachment.Validate("No.", RecNo);
                    DocumentAttachment.Validate("Line No.", LineNo);
                end;
        end;
    end;
}