table 80011 "Equipment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment ID';
            Editable = false;
            AutoIncrement = true;
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
            Editable = false;
        }
        field(6; "Unavailable until"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Unavailable until';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Equipment ID")
        {
            Clustered = true;
        }
    }
}
