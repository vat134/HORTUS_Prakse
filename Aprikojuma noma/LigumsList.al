page 80013 "Rental Agreement Card"
{
    PageType = Card;
    SourceTable = "Rental Agreement";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                }
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }

                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
