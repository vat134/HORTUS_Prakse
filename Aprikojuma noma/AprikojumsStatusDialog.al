page 80016 "Status dialog"
{
    PageType = StandardDialog;
    Caption = 'Status inputs';

    layout
    {
        area(Content)
        {
            field("Availability Status"; "Availability Status")
            {
                ApplicationArea = all;
            }
            field("Unavailable until"; "Unavailable until")
            {
                ApplicationArea = all;
            }
        }
    }

    procedure getStatus(): Option
    begin
        exit("Availability Status")
    end;

    procedure getData(): Date
    begin
        exit("Unavailable until")
    end;

    var
        "Availability Status": Option Available,Unavailable;
        "Unavailable until": Date;
}