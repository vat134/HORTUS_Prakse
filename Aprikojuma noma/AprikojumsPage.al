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

                trigger OnAction()
                var
                    EquipmentDialogPage: Page "Equipment dialog";
                begin
                    if EquipmentDialogPage.RunModal() = Action::OK then begin
                        CreateNewEquipment(EquipmentDialogPage.getName(), EquipmentDialogPage.getDescription(), EquipmentDialogPage.getDailyRentalFee());
                    end
                end;
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
                    HistoryRec: Record "Rental Agreement History";
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

                        HistoryRec.Init();
                        Rec.Modify(true);
                        if StatusDialogPage.getStatus() = 0 then begin
                            HistoryRec."New Status" := 0;
                        end else begin
                            HistoryRec."New Status" := 1;
                        end;
                        HistoryRec."Change Date" := Today;
                        HistoryRec."Reason" := StatusDialogPage.getReason();
                        HistoryRec."Unavailible until" := StatusDialogPage.getData();
                        HistoryRec.Insert();

                        Rec.Modify(true);
                    end
                end;
            }
        }
    }

    procedure CreateNewEquipment(Name: Text[100]; Description: Text[250]; DailyRentalFee: Decimal)
    var
        EquipmentRec: Record "Equipment";
    begin
        EquipmentRec.Init();
        EquipmentRec."Name" := Name;
        EquipmentRec."Description" := Description;
        EquipmentRec."Daily Rental Fee" := DailyRentalFee;
        EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
        EquipmentRec.Insert();
        Message('New equipment created');
    end;

}