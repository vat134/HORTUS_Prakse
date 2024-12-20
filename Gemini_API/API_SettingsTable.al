table 80001 "Gemini Settings"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "API Key"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Model Version"; Enum GeminiVersions)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "API Key")
        {

        }
    }
}