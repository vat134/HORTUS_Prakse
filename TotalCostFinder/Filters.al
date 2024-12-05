pageextension 80004 ItemListFilter extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(setfilter)
            {
                Caption = 'Set Filter';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Rec.SetFilter("No.", '>=1100&<=1200');
                    //Rec.SetRange("Unit Price", 600, 660);
                end;
            }
            action(GetSelectionFilters)
            {
                Caption = 'Get Selection Filters';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    Item2: Record Item;
                    Item3: Record Item;
                begin
                    CurrPage.SetSelectionFilter(Item2);
                    Message('Filter=%1, Count=%2', Item2.GetFilters(), Item2.Count);

                    Item3.FindFirst();
                    Item3.Mark(true);
                    Item3.Next();
                    Item3.Mark(true);
                    Item3.MarkedOnly(true);

                end;
            }
            action(SetTwoFilters)
            {
                Caption = 'Set two filters';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    grp: Integer;
                begin
                    grp := Rec.FilterGroup;
                    Rec.FilterGroup(10);
                    Rec.SetRange("Unit Price", 80, 300);
                    Rec.FilterGroup(11);
                    Rec.SetRange("Unit Price", 100, 400);
                    Rec.FilterGroup(grp);
                end;
            }

            action(CalculateCost)
            {
                Caption = 'Calculate cost';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    TotalValue: Decimal;
                    InventoryHistory: Codeunit AddLineToInventorySummPage;
                begin
                    Rec.SetFilter("Inventory", '>0');
                    if Rec.FindSet() then begin
                        repeat
                            TotalValue += Rec."Inventory" * Rec."Unit Cost";
                        until Rec.Next() = 0;
                    end;
                    Rec.Reset();
                    Message('Kopējā vērtība noliktavā: %1', TotalValue);
                    InventoryHistory.AddLine(TotalValue);
                end;
            }
        }
    }
}