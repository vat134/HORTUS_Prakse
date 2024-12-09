page 80012 "Rental Agreement List"
{
    PageType = List;
    SourceTable = "Rental Agreement";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreement ID"; Rec."Agreement ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    trigger OnAssistEdit()
                    var
                        RentalAgreementDetailsCardPage: Page "Rental Agreement Details Card";
                        RentalAgreementDetailsRec: Record "Rental Agreement Details";
                        MyCodeunit: Codeunit "MyCodeunit";
                    begin
                        MyCodeunit.FillDetails(Rec."Agreement ID");
                        Commit();

                        if RentalAgreementDetailsRec.Get(Rec."Agreement ID") then begin
                            RentalAgreementDetailsCardPage.SetRecord(RentalAgreementDetailsRec);
                            RentalAgreementDetailsCardPage.RunModal;
                        end else
                            Error('Rental Agreement Details with the given ID not found.');
                    end;
                }

                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                }
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(AddNewEquipment)
            {
                ApplicationArea = All;
                Caption = 'Create New Agreement';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = AddContacts;

                trigger OnAction()
                var
                    RentalAgreement: Record "Rental Agreement";
                    NewAgreementID: Integer;
                begin
                    AddLine();

                    Commit();

                    if RentalAgreement.FindLast() then
                        NewAgreementID := RentalAgreement."Agreement ID"
                    else
                        NewAgreementID := 0;
                    OpenEquipmentCard(NewAgreementID)
                end;
            }

            action(EndRent)
            {
                ApplicationArea = All;
                Caption = 'End Rent Today';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EquipmentRec: Record "Equipment";
                begin
                    Rec."End Date" := Today;
                    Rec."Status" := Rec."Status"::Completed;
                    Rec.Modify(true);

                    if Rec."Equipment ID" <> 0 then begin
                        if EquipmentRec.Get(Rec."Equipment ID") then begin
                            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
                            EquipmentRec.Modify(true);
                        end
                        else
                            Error('Equipment with this ID not found.');
                    end;
                end;
            }
            action(Cancel)
            {
                ApplicationArea = All;
                Caption = 'Cancel';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EquipmentRec: Record "Equipment";
                begin
                    Rec."Status" := Rec."Status"::Canceled;
                    Rec.Modify(true);

                    if Rec."Equipment ID" <> 0 then begin
                        if EquipmentRec.Get(Rec."Equipment ID") then begin
                            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
                            EquipmentRec.Modify(true);
                        end
                        else
                            Error('Equipment with this ID not found.');
                    end;

                end;
            }
        }
    }

    procedure AddLine()
    var
        RentalAgreement: Record "Rental Agreement";
    begin

        RentalAgreement.Init();

        if RentalAgreement.FindLast() then
            RentalAgreement."Agreement ID" := RentalAgreement."Agreement ID" + 1
        else
            RentalAgreement."Agreement ID" := 0;

        RentalAgreement.Insert();

    end;

    procedure OpenEquipmentCard(AgreementID: Integer)
    var
        RentalAgreementCardPage: Page "Rental Agreement Card";
        RentalAgreementRec: Record "Rental Agreement";
    begin
        if RentalAgreementRec.Get(AgreementID) then begin
            RentalAgreementCardPage.SetRecord(RentalAgreementRec);
            RentalAgreementCardPage.RunModal;
        end else
            Error('Not found agreement by that ID');
    end;
}
