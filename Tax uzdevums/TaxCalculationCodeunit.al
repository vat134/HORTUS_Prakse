codeunit 80006 TaxCalculationCodeunit
{
    procedure CalculateAndShowTax(Sum: Integer; Percent: Integer)
    var
        Tax: Integer;
    begin
        if (Sum <= 0) or (Percent < 0) or (Percent > 100) then begin
            Message('Lūdzu, ievadiet derīgas vērtības Summ un Procents.');
            exit;
        end;

        Tax := Sum * (Percent / 100);
        Message('Nodokli: %1', Tax);
    end;
}
