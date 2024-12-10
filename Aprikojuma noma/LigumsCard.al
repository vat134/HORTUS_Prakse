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
            }
        }
    }

    trigger OnClosePage()
    var
        EquipmentRec: Record "Equipment";
    begin
        if Rec."Equipment ID" <> 0 then begin
            if EquipmentRec.Get(Rec."Equipment ID") then begin
                if Rec."Status" = Rec."Status"::Active then begin
                    Message('OnClosePage, %1', Rec."End Date");
                    EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Unavailable;
                    EquipmentRec."Unavailable until" := Rec."End Date";
                    EquipmentRec.Modify(true);
                end
                else begin
                    EquipmentRec."Availability Status" := EquipmentRec."Availability Status"::Available;
                    EquipmentRec."Unavailable until" := 0D;
                    EquipmentRec.Modify(true);
                end
            end
            else
                Error('Equipment with this ID not found.');
        end;
    end;
}