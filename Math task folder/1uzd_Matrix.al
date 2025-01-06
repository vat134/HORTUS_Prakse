page 80022 "Math Square"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field("Rows"; Rows)
                {

                }
                field("Columns"; Columns)
                {

                }
                field("Number to Find"; TargetNumber)
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {

            action("Generate and Calculate")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    if (Rows > 100) or (Columns > 100) then
                        Error('Maximum size is 100x100.');

                    GenerateMatrix(Rows, Columns);
                    Message('Sum of neighbors: %1', CalculateSumOfNeighbors(TargetNumber));
                end;
            }

        }
    }

    local procedure GenerateMatrix(Rows: Integer; Columns: Integer)
    var
        Counter: Integer;
        RowIndex: Integer;
        ColIndex: Integer;
    begin
        Counter := 1;
        for RowIndex := 1 to Rows do
            for ColIndex := 1 to Columns do begin
                Matrix[RowIndex, ColIndex] := Counter;
                Counter := Counter + 1;
            end;
    end;

    local procedure CalculateSumOfNeighbors(TargetNumber: Integer): Integer
    var
        RowIndex: Integer;
        ColIndex: Integer;
        Sum: Integer;
    begin
        for RowIndex := 1 to Rows do
            for ColIndex := 1 to Columns do
                if Matrix[RowIndex, ColIndex] = TargetNumber then begin
                    Sum := 0;

                    if RowIndex > 1 then
                        Sum := Sum + Matrix[RowIndex - 1, ColIndex];

                    if RowIndex < Rows then
                        Sum := Sum + Matrix[RowIndex + 1, ColIndex];

                    if ColIndex > 1 then
                        Sum := Sum + Matrix[RowIndex, ColIndex - 1];

                    if ColIndex < Columns then
                        Sum := Sum + Matrix[RowIndex, ColIndex + 1];

                    exit(Sum);
                end;

        Error('Number not found in the matrix.');
    end;

    var
        Matrix: array[100, 100] of Integer;
        Rows: Integer;
        Columns: Integer;
        TargetNumber: Integer;
}