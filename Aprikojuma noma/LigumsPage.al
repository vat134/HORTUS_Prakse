page 80012 "Rental Agreement List"
{
    PageType = List;
    SourceTable = "Rental Agreement";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "Rental Agreement Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Agreement ID"; Rec."Agreement ID")
                {
                    ApplicationArea = All;
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
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(AddAgreement)
            {
                ApplicationArea = All;
                Caption = 'Add Agreement';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    AgreementDialogPage: Page "Agreement dialog";
                begin
                    if AgreementDialogPage.RunModal() = Action::OK then begin
                        CreateRentalAgreement(AgreementDialogPage.getCustomerID(), AgreementDialogPage.getEquipmentID(), AgreementDialogPage.getStartDate(), AgreementDialogPage.getEndDate())
                    end
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
                    if Rec."Status" <> Rec."Status"::Active then
                        Error('Only active agreements can be ended.');

                    Rec."End Date" := Today;
                    Rec."Status" := Rec."Status"::Completed;
                    Rec.Modify(true);

                    if Rec."Equipment ID" <> 0 then begin
                        if EquipmentRec.Get(Rec."Equipment ID") then begin
                            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
                            EquipmentRec."Unavailable until" := 0D;
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
                    if Rec."Status" <> Rec."Status"::Active then
                        Error('Only active agreements can be canceled.');

                    Rec."Status" := Rec."Status"::Canceled;
                    Rec.Modify(true);

                    if Rec."Equipment ID" <> 0 then begin
                        if EquipmentRec.Get(Rec."Equipment ID") then begin
                            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
                            EquipmentRec."Unavailable until" := 0D;
                            EquipmentRec.Modify(true);
                        end
                        else
                            Error('Equipment with this ID not found.');
                    end;

                end;
            }
        }
    }

    procedure CreateRentalAgreement(CustomerID: Code[20]; EquipmentID: Integer; StartDate: Date; EndDate: Date)
    var
        RentalAgreementRec: Record "Rental Agreement";
        EquipmentRec: Record "Equipment";
    begin
        if CustomerID = '' then
            Error('Customer ID cannot be empty.');

        if not EquipmentRec.Get(EquipmentID) then
            Error('Equipment with ID %1 does not exist.', EquipmentID);
        if EquipmentRec."Availability Status" <> EquipmentRec."Availability Status"::Available then
            Error('Equipment with ID %1 is not available.', EquipmentID);

        RentalAgreementRec.Init();
        RentalAgreementRec."Customer ID" := CustomerID;
        RentalAgreementRec."Equipment ID" := EquipmentID;
        RentalAgreementRec."Start Date" := StartDate;
        RentalAgreementRec."End Date" := EndDate;
        RentalAgreementRec.Insert();

        RentalAgreementRec.UpdateStatus();

        if RentalAgreementRec."Status" = RentalAgreementRec."Status"::Active then begin
            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Unavailable;
            EquipmentRec."Unavailable until" := RentalAgreementRec."End Date";
        end else begin
            EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
            EquipmentRec."Unavailable until" := 0D;
        end;
        EquipmentRec.Modify(true);

        Message('Rental agreement created successfully');
    end;

}
