page 80004 "Weather dialog"
{
    PageType = StandardDialog;
    Caption = 'City input';

    layout
    {
        area(Content)
        {
            field("City"; "City")
            {
                ApplicationArea = all;
            }
        }
    }

    procedure getCity(): Text[100]
    begin
        exit("City")
    end;

    var
        "City": Text[100];
}