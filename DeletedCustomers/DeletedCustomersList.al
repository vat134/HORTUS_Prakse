page 80024 DeletedCustomerList
{
    PageType = List;
    SourceTable = DeletedCustomerLog;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Deleted Customers';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {

                }
                field("Customer No."; Rec."Customer No.")
                {

                }
                field("Customer Name"; Rec."Customer Name")
                {

                }
                field("Contact"; Rec."Contact")
                {

                }
                field("Deletion Reason"; Rec."Deletion Reason")
                {

                }
                field("Deletion Date"; Rec."Deletion Date")
                {

                }
                field("Deleted By"; Rec."Deleted By")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Refresh List")
            {
                Caption = 'Refresh List';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    CurrPage.Update();
                end;
            }
        }
    }
}
