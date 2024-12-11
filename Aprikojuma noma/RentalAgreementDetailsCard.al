page 80015 "Rental Agreement Details Card"
{
    PageType = Card;
    SourceTable = "Rental Agreement Details";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Agreement info")
            {
                field("Agreement ID"; Rec."Agreement ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Id"; Rec."Customer ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Rental info")
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Equipment Name"; Rec."Equipment Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Day period"; Rec."Day period")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Fee"; Rec."Rental Fee")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
