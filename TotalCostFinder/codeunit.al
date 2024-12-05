codeunit 80010 AddLineToInventorySummPage
{
    Subtype = Normal;

    procedure AddLine(TotalValue: Decimal)
    var
        InventoryHistory: Record "Inventory Value History";
    begin

        InventoryHistory.Init();

        if InventoryHistory.FindLast() then
            InventoryHistory."Line No." := InventoryHistory."Line No." + 1
        else
            InventoryHistory."Line No." := 0;

        InventoryHistory."Date" := Today();
        InventoryHistory."Total Value" := TotalValue;

        InventoryHistory.Insert();

    end;
}
