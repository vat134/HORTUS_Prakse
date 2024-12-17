page 80050 "API Audit Log List"
{
    Caption = 'API Audit Logs';
    PageType = List;
    SourceTable = "API Audit Log";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("HDTEntry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("HDTDate"; Rec."Date") { ApplicationArea = All; }
                field("HDTPayload"; Rec."Request") { ApplicationArea = All; }
                field("HDTRequest"; Rec."RequestURL") { ApplicationArea = All; }
                field("HDTResponse"; Rec."Response") { ApplicationArea = All; }
                field("Request Status"; Rec."Request Status") { ApplicationArea = All; }
                field("Request Status Code"; Rec."Request Status Code") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("DownloadRequest")
            {
                Caption = 'Download Request';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.DownloadRequest();
                end;
            }

            action("DownloadResponse")
            {
                Caption = 'Download Response';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.DownloadResponse();
                end;
            }
        }
    }
}
