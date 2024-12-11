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
                trigger OnValidate()
                begin
                    if "Unavailable until" = 0D then
                        Error('Unavailable until date cannot be empty.');
                end;
            }
            field("Reason"; "Reason")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if "Reason" = '' then
                        Error('Reason cannot be empty.');
                end;
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

    procedure getReason(): Text[250]
    begin
        exit("Reason")
    end;

    var
        "Availability Status": Option Available,Unavailable;
        "Unavailable until": Date;
        "Reason": Text[250];

}