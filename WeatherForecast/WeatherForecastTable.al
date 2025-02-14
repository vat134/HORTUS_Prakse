table 80006 WeatherForecast
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
            AutoIncrement = true;
        }

        field(2; "Request Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Request Time';
        }

        field(3; "City"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'City';
        }

        field(4; "Temperature (C)"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Temperature (C)';
        }

        field(5; "Wind Speed (m/s)"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Wind Speed (m/s)';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
