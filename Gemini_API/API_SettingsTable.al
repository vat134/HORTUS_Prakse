table 80001 "Gemini Settings"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "API Key"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Model Version"; Text[50])
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

    trigger OnInsert()
    begin
        if "Model Version" = '' then
            "Model Version" := 'gemini-1.5-flash-latest';
    end;
}