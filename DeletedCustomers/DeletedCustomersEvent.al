codeunit 80000 CustomerDeletionHandler
{
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeCustomerDelete(Rec: Record Customer)
    var
        DeletedLog: Record DeletedCustomerLog;
        User: Text[50];
    begin
        DeletedLog.Init();
        DeletedLog."Customer No." := Rec."No.";
        DeletedLog."Customer Name" := Rec.Name;
        DeletedLog."Contact" := Rec."Contact";
        DeletedLog."Deletion Date" := CurrentDateTime();
        DeletedLog."Deleted By" := UserId();
        DeletedLog.Insert();
    end;
}
