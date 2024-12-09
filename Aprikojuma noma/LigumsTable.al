table 80012 "Rental Agreement"
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
        field(3; "Equipment ID"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Equipment ID';
            TableRelation = "Equipment" WHERE("Availability Status" = CONST(Available));
        }
        field(4; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'End Date';
        }
        field(6; "Status"; Option)
        {
            OptionMembers = Active,Completed,Canceled;
            DataClassification = CustomerContent;
            Caption = 'Status';
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

    trigger OnDelete()
    var
        RentalAgreementDetailsRec: Record "Rental Agreement Details";
    begin
        if RentalAgreementDetailsRec.Get("Agreement ID") then
            RentalAgreementDetailsRec.Delete();
    end;
}
