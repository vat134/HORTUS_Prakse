table 80004 DeletedCustomerLog
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Contact"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(5; "Deletion Reason"; Text[250])
        {
            DataClassification = CustomerContent;
        }

        field(6; "Deletion Date"; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(7; "Deleted By"; Text[50])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
