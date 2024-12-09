table 80015 "Rental Agreement Details"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Agreement ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Agreement ID';
            Editable = false;
        }
        field(2; "Customer ID"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer ID';
            TableRelation = "Customer";
        }
        field(3; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Name';
            Editable = false;
        }
        field(4; "Status"; Option)
        {
            OptionMembers = Active,Completed,Canceled;
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
        field(5; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment ID';
            TableRelation = "Equipment";
        }
        field(6; "Equipment Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment Name';
            Editable = false;
        }
        field(7; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
        }
        field(8; "End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'End Date';
        }
        field(9; "Day period"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Day period';
            Editable = false;
        }
        field(10; "Rental Fee"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Rental Fee';
            Editable = false;
        }
        field(11; "Total Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Amount';
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
}
