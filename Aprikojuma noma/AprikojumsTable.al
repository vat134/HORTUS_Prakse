table 80011 "Equipment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment ID';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(3; "Description"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(4; "Daily Rental Fee"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Daily Rental Fee';
        }
        field(5; "Availability Status"; Option)
        {
            OptionMembers = Available,Unavailable;
            DataClassification = CustomerContent;
            Caption = 'Availability Status';
        }
        field(6; "Reason"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Reason';
        }
    }

    keys
    {
        key(PK; "Equipment ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        EquipmentRec: Record "Equipment";
    begin
        if EquipmentRec.FindLast() then
            Rec."Equipment ID" := EquipmentRec."Equipment ID" + 1
        else
            Rec."Equipment ID" := 1;
    end;
}
