page 80011 "Equipment List"
{
    PageType = List;
    SourceTable = "Equipment";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Equipment Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Daily Rental Fee"; Rec."Daily Rental Fee")
                {
                    ApplicationArea = All;
                }
                field("Availability Status"; Rec."Availability Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(AddEquipment)
            {
                ApplicationArea = All;
                Caption = 'Add Equipment';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "Equipment Card";
                RunPageMode = Create;
            }

            action(ChangeStatus)
            {
                ApplicationArea = All;
                Caption = 'Change Status';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    StatusDialogPage: Page "Status dialog";
                begin
                    if StatusDialogPage.RunModal() = Action::OK then begin
                        if StatusDialogPage.getStatus() = 0 then begin
                            Rec."Availability Status" := Rec."Availability Status"::Available;
                            Rec."Unavailable until" := 0D;
                        end else begin
                            if StatusDialogPage.getData() < Today() then
                                Message('The date is earlier than today.')
                            else begin
                                Rec."Availability Status" := Rec."Availability Status"::Unavailable;
                                Rec."Unavailable until" := StatusDialogPage.getData();
                            end;
                        end;

                        Rec.Modify(true);
                    end
                end;
            }
        }
    }
}