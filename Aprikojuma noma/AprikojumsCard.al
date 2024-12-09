page 80014 "Equipment Card"
{
    PageType = Card;
    SourceTable = "Equipment";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("Daily Rental Fee"; Rec."Daily Rental Fee")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
