page 80011 "Equipment List"
{
    PageType = List;
    SourceTable = "Equipment";
    ApplicationArea = All;
    UsageCategory = Lists;

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
            action(AddNewEquipment)
            {
                ApplicationArea = All;
                Caption = 'Add New Equipment';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = AddLine;

                trigger OnAction()
                var
                    Equipment: Record Equipment;
                    NewEquipmentID: Integer;
                begin
                    AddLine();

                    Commit();

                    if Equipment.FindLast() then
                        NewEquipmentID := Equipment."Equipment ID"
                    else
                        NewEquipmentID := 0;
                    OpenEquipmentCard(NewEquipmentID)
                end;
            }
        }
    }

    procedure AddLine()
    var
        Equipment: Record Equipment;
    begin

        Equipment.Init();

        if Equipment.FindLast() then
            Equipment."Equipment ID" := Equipment."Equipment ID" + 1
        else
            Equipment."Equipment ID" := 0;

        Equipment."Name" := '';
        Equipment."Description" := '';
        Equipment."Daily Rental Fee" := 0;
        Equipment."Availability Status" := 0;


        Equipment.Insert();
    end;

    procedure OpenEquipmentCard(EquipmentID: Integer)
    var
        EquipmentCardPage: Page "Equipment Card";
        EquipmentRec: Record Equipment;
    begin
        if EquipmentRec.Get(EquipmentID) then begin
            EquipmentCardPage.SetRecord(EquipmentRec);
            EquipmentCardPage.RunModal;
        end else
            Error('Not found equipment by that ID');
    end;

}