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
            group(Info)
            {
                Caption = 'Equipment Info';

                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = All;
                }
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
                field("Availability Status"; Rec."Availability Status")
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                Caption = 'Equipment Details';

                field("Reason"; Rec."Reason")
                {
                    Caption = 'Status Reason';
                    ApplicationArea = All;
                }
            }
        }
    }
}
