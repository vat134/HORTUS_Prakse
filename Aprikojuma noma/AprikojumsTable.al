table 80011 "Equipment"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
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
