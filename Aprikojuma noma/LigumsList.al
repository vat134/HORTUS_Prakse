page 80013 "Rental Agreement Card"
{
    PageType = Card;
    SourceTable = "Rental Agreement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."Customer ID" = '' then
                            Error('Customer ID cannot be empty.');
                    end;
                }
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        EquipmentRec: Record "Equipment";
                    begin
                        if Rec."Equipment ID" <> 0 then begin
                            if EquipmentRec.Get(Rec."Equipment ID") then begin
                                EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Unavailable;
                                EquipmentRec.Modify(true);
                            end
                            else
                                Error('Equipment with this ID not found.');
                        end;
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."Start Date" = 0D then
                            Error('Start Date cannot be empty.');
                        if (Rec."End Date" <> 0D) and (Rec."End Date" <= Rec."Start Date") then
                            Error('End Date must be after Start Date.');

                        UpdateStatus();
                    end;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec."End Date" = 0D then
                            Error('End Date cannot be empty.');
                        if (Rec."Start Date" <> 0D) and (Rec."End Date" <= Rec."Start Date") then
                            Error('End Date must be after Start Date.');

                        UpdateStatus();
                    end;
                }
            }

        }
    }

    procedure UpdateStatus()
    var
        CurrentDate: Date;
        EquipmentRec: Record "Equipment";
    begin
        CurrentDate := Today;

        if (Rec."Start Date" <> 0D) and (Rec."End Date" <> 0D) then begin
            if (CurrentDate >= Rec."Start Date") and (CurrentDate <= Rec."End Date") then
                Rec."Status" := Rec."Status"::Active
            else if (CurrentDate > Rec."End Date") then
                Rec."Status" := Rec."Status"::Completed;
        end;
    end;
}
