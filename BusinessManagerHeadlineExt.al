pageextension 80004 BusinessManagerHeadlineExt extends "Headline RC Business Manager"
{
    layout
    {
        addbefore(Control1)
        {
            field(WikiCat; Hyperlink)
            {
                ApplicationArea = all;
                trigger OnDrillDown()
                begin
                    Hyperlink('https://en.wikipedia.org/wiki/Cat');
                end;
            }

            field(HeadLineTxt; HeadLineTxt)
            {
                ApplicationArea = all;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Hyperlink := 'Cat info!!!';
        HeadLineTxt := 'My Second Headline';
    end;

    var
        Hyperlink: Text;
        HeadLineTxt: Text;
}