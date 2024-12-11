page 80018 "Equipment dialog"
{
    PageType = StandardDialog;
    Caption = 'Status inputs';

    layout
    {
        area(Content)
        {
            field("Name"; "Name")
            {
                ApplicationArea = all;
            }
            field("Description"; "Description")
            {
                ApplicationArea = all;
            }
            field("Daily Rental Fee"; "Daily Rental Fee")
            {
                ApplicationArea = all;
            }
        }
    }

    procedure getName(): Text[100]
    begin
        exit("Name")
    end;

    procedure getDescription(): Text[250]
    begin
        exit("Description")
    end;

    procedure getDailyRentalFee(): Decimal
    begin
        exit("Daily Rental Fee")
    end;

    var
        "Name": Text[100];
        "Description": Text[250];
        "Daily Rental Fee": Decimal;
}