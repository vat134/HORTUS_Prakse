Page 80007 "HD EDI Order List"
{
    applicationarea = all;
    PageType = List;
    CardPageId = "HDT EDI Order Header Card";
    SourceTable = "HD EDI Message Header";

    caption = 'Edoc Document List';
    UsageCategory = Lists;

    // { 25022389;1;Part     ;
    // SubPageLink =Document No.=FIELD(Document No.);
    //             PagePartID=Page9401;
    //             Editable=TRUE;
    //             PartType=Page;
    //                          UpPropagation =SubPart }

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ID; REC.ID)
                {
                    ApplicationArea = All;
                }
                field(Direction; REC.Direction)
                {
                    ApplicationArea = All;
                }
                field("Document Type"; REC."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Internal No"; REC."Internal No")
                {
                    TableRelation = "Sales Header"."No." where("Document Type" = const(Order));
                    ApplicationArea = Basic;
                }
                field("Document Date"; REC."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; REC.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Lines; REC.Lines)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    DrillDownPageID = "HD EDI Order Line List";
                    TableRelation = "HD EDI Message Line";
                }
                field("File Name"; REC."File Name")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }

                field("External No"; REC."External No")
                {
                    ApplicationArea = Basic;
                }
                field("Sender ID"; REC."Sender ID")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Receiver ID"; REC."Receiver ID")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Party GLN"; REC."Buyer Party GLN")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Party GLN"; REC."Delivery Party GLN")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Party GLN"; REC."Seller Party GLN")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Additional Info 1"; REC."Additional Info 1")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Additional Info 2"; REC."Additional Info 2")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Sum Before VAT"; REC."Sum Before VAT")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Total VAT Sum"; REC."Total VAT Sum")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Total Sum"; REC."Total Sum")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Document Sub Type"; REC."Document Sub Type")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Order Date"; REC."Order Date")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Invoice Date"; REC."Invoice Date")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Due Date"; REC."Due Date")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Document No."; REC."Document No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Date"; REC."Delivery Date")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Party Name"; REC."Buyer Party Name")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Party Reg. No."; REC."Buyer Party Reg. No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Party VAT Reg. No."; REC."Buyer Party VAT Reg. No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Party Code"; REC."Delivery Party Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Party Name"; REC."Delivery Party Name")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Party Code"; REC."Seller Party Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Party Name"; REC."Seller Party Name")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Party Reg. No."; REC."Seller Party Reg. No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Party VAT Reg. No."; REC."Seller Party VAT Reg. No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Phone Num."; REC."Seller Phone Num.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Email Address"; REC."Seller Email Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Address"; REC."Seller Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller City"; REC."Seller City")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Postal Code"; REC."Seller Postal Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller County"; REC."Seller County")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Country Code"; REC."Seller Country Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Phone Num."; REC."Buyer Phone Num.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Email Address"; REC."Buyer Email Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Phone Num."; REC."Delivery Phone Num.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Email Address"; REC."Delivery Email Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Address"; REC."Delivery Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery City"; REC."Delivery City")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Postal Code"; REC."Delivery Postal Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery County"; REC."Delivery County")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Delivery Country Code"; REC."Delivery Country Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(Currency; REC.Currency)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Document Name"; REC."Document Name")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(AccountNum; REC.AccountNum)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(Iban; REC.Iban)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(BIC; REC.BIC)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(BankName; REC.BankName)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Sales Pers E-mail"; REC."Sales Pers E-mail")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Party Code"; REC."Buyer Party Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Address"; REC."Buyer Address")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer City"; REC."Buyer City")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Postal Code"; REC."Buyer Postal Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer County"; REC."Buyer County")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Buyer Country Code"; REC."Buyer Country Code")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field(Completed; REC.Completed)
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Error Message"; REC."Error Message")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; REC."Created DateTime")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Document Flow Type"; REC."Document Flow Type")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
                field("Released SO"; REC."Released SO")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    Import: Codeunit "HD EDI Order Import";
                begin
                    Import.Import();
                end;
            }
        }
    }

    trigger OnInit()
    var
    begin
        Rec.SetCurrentkey("Document Date");
        Rec.SetCurrentkey(ID);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetCurrentkey("Document Date");
        Rec.SetCurrentkey(ID);
    end;
}