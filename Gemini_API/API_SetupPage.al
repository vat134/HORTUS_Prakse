page 80009 "Gemini_Setup"
{
    PageType = Card;
    SourceTable = "Gemini Settings";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Gemini Setup';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("API Key"; Rec."API Key")
                {
                    ApplicationArea = All;
                }
                field("Model Version"; Rec."Model Version")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
