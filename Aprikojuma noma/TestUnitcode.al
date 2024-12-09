codeunit 80015 MyCodeunit
{
    Subtype = Normal;
    procedure FillDetails(AgreementID: Integer)
    begin
        if RentalAgreementRec.Get(AgreementID) then begin
            if CustomerRec.Get(RentalAgreementRec."Customer ID") then begin
                if EquipmentRec.Get(RentalAgreementRec."Equipment ID") then begin

                    DayPeriod := (RentalAgreementRec."End Date" - RentalAgreementRec."Start Date") + 1;
                    TotalAmount := EquipmentRec."Daily Rental Fee" * DayPeriod;

                    RentalAgreementDetailsRec.Init();

                    if RentalAgreementDetailsRec.Get(RentalAgreementRec."Agreement ID") then begin
                        RentalAgreementDetailsRec."Agreement ID" := RentalAgreementRec."Agreement ID";
                        RentalAgreementDetailsRec."Customer ID" := RentalAgreementRec."Customer ID";
                        RentalAgreementDetailsRec."Customer Name" := CustomerRec."Name";
                        RentalAgreementDetailsRec."Status" := RentalAgreementRec."Status";
                        RentalAgreementDetailsRec."Equipment ID" := RentalAgreementRec."Equipment ID";
                        RentalAgreementDetailsRec."Equipment Name" := EquipmentRec."Name";
                        RentalAgreementDetailsRec."Start Date" := RentalAgreementRec."Start Date";
                        RentalAgreementDetailsRec."End Date" := RentalAgreementRec."End Date";
                        RentalAgreementDetailsRec."Day period" := DayPeriod;
                        RentalAgreementDetailsRec."Rental Fee" := EquipmentRec."Daily Rental Fee";
                        RentalAgreementDetailsRec."Total Amount" := TotalAmount;

                        RentalAgreementDetailsRec.Modify(true);
                    end
                    else begin

                        RentalAgreementDetailsRec."Agreement ID" := RentalAgreementRec."Agreement ID";
                        RentalAgreementDetailsRec."Customer ID" := RentalAgreementRec."Customer ID";
                        RentalAgreementDetailsRec."Customer Name" := CustomerRec."Name";
                        RentalAgreementDetailsRec."Status" := RentalAgreementRec."Status";
                        RentalAgreementDetailsRec."Equipment ID" := RentalAgreementRec."Equipment ID";
                        RentalAgreementDetailsRec."Equipment Name" := EquipmentRec."Name";
                        RentalAgreementDetailsRec."Start Date" := RentalAgreementRec."Start Date";
                        RentalAgreementDetailsRec."End Date" := RentalAgreementRec."End Date";
                        RentalAgreementDetailsRec."Day period" := DayPeriod;
                        RentalAgreementDetailsRec."Rental Fee" := EquipmentRec."Daily Rental Fee";
                        RentalAgreementDetailsRec."Total Amount" := TotalAmount;

                        RentalAgreementDetailsRec.Insert();
                    end;
                end else
                    Error('Equipment not found for this agreement.');
            end else
                Error('Customer not found for this agreement.');
        end else
            Error('Not found agreement by that ID');
    end;

    var
        RentalAgreementCardPage: Page "Rental Agreement Card";
        RentalAgreementRec: Record "Rental Agreement";
        RentalAgreementDetailsRec: Record "Rental Agreement Details";
        CustomerRec: Record "Customer";
        EquipmentRec: Record "Equipment";


        DayPeriod: Integer;
        TotalAmount: Decimal;
}