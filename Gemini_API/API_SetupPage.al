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

    actions
    {
        area(processing)
        {
            action(Initialize)
            {
                Caption = 'Set default version';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if not Rec.FindFirst then begin
                        Rec.Init();
                        Rec."Model Version" := 'gemini-1.5-flash-latest';
                        Rec.Insert();
                    end
                    else begin
                        Rec."Model Version" := 'gemini-1.5-flash-latest';
                        Rec.Modify();
                    end;
                end;
            }
        }
    }
}
