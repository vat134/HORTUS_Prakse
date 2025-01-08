page 80025 DeletionReasonSubPage
{
    PageType = Card;
    SourceTable = TempTable;
    Caption = 'Enter Deletion Reason';

    layout
    {
        area(content)
        {
            group(ReasonGroup)
            {
                field(Reason; Reason)
                {
                    Caption = 'Deletion Reason';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(OK)
            {
                Caption = 'OK';
                ApplicationArea = All;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Reason = '' then
                        Error('Please enter a reason for deletion.');
                    CurrPage.Close();
                end;
            }

            action(Cancel)
            {
                Caption = 'Cancel';
                ApplicationArea = All;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Clear(Reason);
                    Error('CALL ERROR');
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        Reason: Text[250];

    procedure GetReason(): Text[250];
    begin
        exit(Reason);
    end;
}

table 80026 TempTable
{
    TableType = Temporary;
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Temp Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
}