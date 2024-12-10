table 80012 "Rental Agreement"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Agreement ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Agreement ID';
            Editable = false;
            AutoIncrement = true;
        }
        field(2; "Customer ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer ID';
            TableRelation = "Customer";
            trigger OnValidate()
            begin
                if Rec."Customer ID" = '' then
                    Error('Customer ID cannot be empty.');
            end;
        }
        field(3; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment ID';
            TableRelation = "Equipment" WHERE("Availability Status" = CONST(Available));
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
            trigger OnValidate()
            begin
                if Rec."Start Date" = 0D then
                    Error('Start Date cannot be empty.');
                if Rec."Start Date" < Today then
                    Error('Start Date cannot be in the past.');

                UpdateStatus();
            end;
        }
        field(5; "End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'End Date';
            trigger OnValidate()
            begin
                if Rec."End Date" = 0D then
                    Error('End Date cannot be empty.');
                if (Rec."Start Date" <> 0D) and (Rec."End Date" <= Rec."Start Date") then
                    Error('End Date must be after Start Date.');

                UpdateStatus();
            end;
        }
        field(6; "Status"; Option)
        {
            OptionMembers = Active,Completed,Canceled;
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Agreement ID")
        {
            Clustered = true;
        }
    }

    procedure UpdateStatus()
    var
        CurrentDate: Date;
        EquipmentRec: Record "Equipment";
    begin
        CurrentDate := Today;

        if (Rec."Start Date" <> 0D) and (Rec."End Date" <> 0D) then begin
            if (CurrentDate >= Rec."Start Date") and (CurrentDate <= Rec."End Date") then begin
                Rec."Status" := Rec."Status"::Active;
            end
            else if (CurrentDate > Rec."End Date") then begin
                Rec."Status" := Rec."Status"::Completed;
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
        end;
    end;

    trigger OnDelete()
    var
        EquipmentRec: Record "Equipment";
        RentalAgreementDetailsRec: Record "Rental Agreement Details";
    begin
        if RentalAgreementDetailsRec.Get("Agreement ID") then
            RentalAgreementDetailsRec.Delete();
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
