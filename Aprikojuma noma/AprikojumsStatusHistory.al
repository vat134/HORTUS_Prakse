table 80013 "Rental Agreement History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "History ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'History ID';
            Editable = false;
            AutoIncrement = true;
        }
        field(2; "New Status"; Option)
        {
            OptionMembers = Available,Unavailable;
            DataClassification = CustomerContent;
            Caption = 'New Status';
        }
        field(3; "Change Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Change Date';
        }
        field(4; "Reason"; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Reason';
        }
        field(5; "Unavailible until"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Unavailible until';
        }
    }

    keys
    {
        key(PK; "History ID")
        {
            Clustered = true;
        }
    }
}