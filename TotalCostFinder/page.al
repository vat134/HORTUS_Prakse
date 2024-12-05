page 80010 "Inventory Value History"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Inventory Value History';
    SourceTable = "Inventory Value History";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Total Value"; Rec."Total Value")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}