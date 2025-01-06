page 80023 "KnightMovesPage"
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
                field("Knight Position"; KnightPosition)
                {
                    ToolTip = 'Enter the current position of the knight (example: E4).';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calculate Moves")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    if not IsValidPosition(KnightPosition) then
                        Error('Invalid position. Please enter a valid chess board position (example: E4).');

                    Message('The knight has %1 valid moves.', CalculateKnightMoves(KnightPosition));
                end;
            }
        }
    }

    local procedure IsValidPosition(Position: Text[2]): Boolean
    var
        Column: Char;
        Row: Integer;
    begin
        if StrLen(Position) <> 2 then
            exit(false);

        Position := Position.ToUpper();
        Column := Position[1];
        Row := Position[2] - '0';

        exit((Column >= 'A') and (Column <= 'H') and (Row >= 1) and (Row <= 8));
    end;

    local procedure CalculateKnightMoves(Position: Text[2]): Integer
    var
        Column: Integer;
        Row: Integer;
        ValidMoves: Integer;
        MoveOffsets: array[8, 2] of Integer;
        i: Integer;
        NewColumn: Integer;
        NewRow: Integer;
    begin
        MoveOffsets[1, 1] := 2;
        MoveOffsets[1, 2] := 1;
        MoveOffsets[2, 1] := 2;
        MoveOffsets[2, 2] := -1;
        MoveOffsets[3, 1] := -2;
        MoveOffsets[3, 2] := 1;
        MoveOffsets[4, 1] := -2;
        MoveOffsets[4, 2] := -1;
        MoveOffsets[5, 1] := 1;
        MoveOffsets[5, 2] := 2;
        MoveOffsets[6, 1] := 1;
        MoveOffsets[6, 2] := -2;
        MoveOffsets[7, 1] := -1;
        MoveOffsets[7, 2] := 2;
        MoveOffsets[8, 1] := -1;
        MoveOffsets[8, 2] := -2;

        Column := StrPos('ABCDEFGH', UpperCase(Position[1]));
        Row := Position[2] - '0';

        ValidMoves := 0;

        for i := 1 to 8 do begin
            NewColumn := Column + MoveOffsets[i, 1];
            NewRow := Row + MoveOffsets[i, 2];

            if (NewColumn >= 1) and (NewColumn <= 8) and
               (NewRow >= 1) and (NewRow <= 8) then
                ValidMoves := ValidMoves + 1;
        end;

        exit(ValidMoves);
    end;

    var
        KnightPosition: Text[2];
}
