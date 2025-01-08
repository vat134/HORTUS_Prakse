codeunit 80000 CustomerDeletionHandler
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeCustomerDelete(var Rec: Record Customer)
    var
        DeletionReason: Text[250];
        Dialog: Dialog;
        DeletedLog: Record DeletedCustomerLog;
    begin

        if not AskForDeletionReason(DeletionReason) then
            Rec.TestField(Rec."No.");

        LogDeletedCustomer(Rec, DeletionReason);
    end;

    local procedure AskForDeletionReason(var Reason: Text[250]): Boolean
    var
        DeletionReasonPage: Page DeletionReasonSubPage;
    begin
        DeletionReasonPage.RunModal();
        Reason := DeletionReasonPage.GetReason();
        exit(DeletionReasonPage.GetReason() <> '');
    end;

    local procedure LogDeletedCustomer(Rec: Record Customer; DeletionReason: Text[250])
    var
        DeletedLog: Record DeletedCustomerLog;
    begin
        DeletedLog.Init();
        DeletedLog."Customer No." := Rec."No.";
        DeletedLog."Customer Name" := Rec.Name;
        DeletedLog."Contact" := Rec."Contact";
        DeletedLog."Deletion Reason" := DeletionReason;
        DeletedLog."Deletion Date" := CurrentDateTime();
        DeletedLog."Deleted By" := UserId();
        DeletedLog.Insert();
    end;
}