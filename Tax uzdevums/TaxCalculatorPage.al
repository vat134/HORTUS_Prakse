page 80005 TaxCalculatorPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';

                field(Summ; Summ)
                {
                    ApplicationArea = All;
                    Caption = 'Summ';

                }

                field(Procents; Procents)
                {
                    ApplicationArea = All;
                    Caption = 'Procents';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Aprēķināt nodokli")
            {

                ApplicationArea = All;
                Image = ExecuteBatch;
                Caption = 'Aprēķināt nodokli';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    TaxCalculation: Codeunit TaxCalculationCodeunit;
                begin
                    TaxCalculation.CalculateAndShowTax(Summ, Procents)
                end;

            }
        }

    }

    var
        Summ, Procents : Integer;
}