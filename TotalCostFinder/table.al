table 80010 "Inventory Value History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;

        }
        field(3; "Total Value"; Decimal)
        {
            Caption = 'Total Value';
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }
}