page 80006 "HDT EDI Order Header Card"
{
    PageType = Card;
    SourceTable = "HD EDI Message Header";
    Caption = 'Edoc Document Card';

    layout
    {
        area(Content)
        {
            group(Main)
            {
                field(ID; Rec.ID)
                {
                    //editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(AccountNum; Rec.AccountNum)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AccountNum field.', Comment = '%';
                }
                field("Additional Info 1"; Rec."Additional Info 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Additional Info 1 field.', Comment = '%';
                }
                field("Additional Info 2"; Rec."Additional Info 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Additional Info 2 field.', Comment = '%';
                }
                group(Bank)
                {
                    field(BankName; Rec.BankName)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the BankName field.', Comment = '%';
                    }
                    field(BIC; Rec.BIC)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the BIC field.', Comment = '%';
                    }
                    field(Iban; Rec.Iban)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Iban field.', Comment = '%';
                    }
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Date field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
                field("Delivery Date"; Rec."Delivery Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delivery Date field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Due Date field.', Comment = '%';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency field.', Comment = '%';
                }


                field("Document Flow Type"; Rec."Document Flow Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Flow Type field.', Comment = '%';
                }
                field("Document Name"; Rec."Document Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Name field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Document Sub Type"; Rec."Document Sub Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Sub Type field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }

                field("External No"; Rec."External No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External No field.', Comment = '%';
                }
                field("File Format"; Rec."File Format")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Format field.', Comment = '%';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Name field.', Comment = '%';
                }
                field("Internal No"; Rec."Internal No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Internal No field.', Comment = '%';
                }
                field(Lines; Rec.Lines)
                {
                    visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lines field.', Comment = '%';
                }
                field("Receiver ID"; Rec."Receiver ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receiver ID field.', Comment = '%';
                }
                field("Released SO"; Rec."Released SO")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Released SO field.', Comment = '%';
                }
                field("Sales Pers E-mail"; Rec."Sales Pers E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales Pers E-mail field.', Comment = '%';
                }

                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender ID field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Completed; Rec.Completed)
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Completed field.', Comment = '%';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Error Message field.', Comment = '%';
                }
                field(Direction; Rec.Direction)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Direction field.', Comment = '%';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created DateTime field.', Comment = '%';
                }
                Group(Driver)
                {
                    Caption = 'Driver';
                    field(Transporter; Rec.Transporter)
                    {
                        ApplicationArea = All;
                    }
                    field("Transporter Vendor Code"; Rec."Transporter Vendor Code")
                    {
                        ApplicationArea = All;
                    }
                    field("RV Code"; Rec."RV Code")
                    {
                        ApplicationArea = All;
                    }
                    field("Driver Code"; Rec."Driver Code")
                    {
                        ApplicationArea = All;
                    }
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
            }

            group(DocumentParties)
            {
                group(Seller)
                {
                    Caption = 'Seller';
                    field("Seller Address"; Rec."Seller Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Address field.', Comment = '%';
                    }
                    field("Seller City"; Rec."Seller City")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller City field.', Comment = '%';
                    }
                    field("Seller County"; Rec."Seller County")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller County field.', Comment = '%';
                    }
                    field("Seller Country Code"; Rec."Seller Country Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Country Code field.', Comment = '%';
                    }
                    field("Seller Email Address"; Rec."Seller Email Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Email Address field.', Comment = '%';
                    }
                    field("Seller Party Code"; Rec."Seller Party Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Party Code field.', Comment = '%';
                    }
                    field("Seller Party GLN"; Rec."Seller Party GLN")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Party GLN field.', Comment = '%';
                    }
                    field("Seller Party Name"; Rec."Seller Party Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Party Name field.', Comment = '%';
                    }
                    field("Seller Phone Num."; Rec."Seller Phone Num.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Phone Num. field.', Comment = '%';
                    }
                    field("Seller Postal Code"; Rec."Seller Postal Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Postal Code field.', Comment = '%';
                    }
                    field("Seller Party Reg. No."; Rec."Seller Party Reg. No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Party Reg. No. field.', Comment = '%';
                    }
                    field("Seller Party VAT Reg. No."; Rec."Seller Party VAT Reg. No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Seller Party VAT Reg. No. field.', Comment = '%';
                    }
                }
                group(Buyer)
                {
                    Caption = 'Buyer';
                    field("Buyer Address"; Rec."Buyer Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Address field.', Comment = '%';
                    }
                    field("Buyer City"; Rec."Buyer City")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer City field.', Comment = '%';
                    }
                    field("Buyer County"; Rec."Buyer County")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer County field.', Comment = '%';
                    }
                    field("Buyer Country Code"; Rec."Buyer Country Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Country Code field.', Comment = '%';
                    }
                    field("Buyer Email Address"; Rec."Buyer Email Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Email Address field.', Comment = '%';
                    }
                    field("Buyer Party Code"; Rec."Buyer Party Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Party Code field.', Comment = '%';
                    }
                    field("Buyer Party GLN"; Rec."Buyer Party GLN")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Party GLN field.', Comment = '%';
                    }
                    field("Buyer Party Name"; Rec."Buyer Party Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Party Name field.', Comment = '%';
                    }
                    field("Buyer Phone Num."; Rec."Buyer Phone Num.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Phone Num. field.', Comment = '%';
                    }
                    field("Buyer Postal Code"; Rec."Buyer Postal Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Postal Code field.', Comment = '%';
                    }
                    field("Buyer Party Reg. No."; Rec."Buyer Party Reg. No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Party Reg. No. field.', Comment = '%';
                    }
                    field("Buyer Party VAT Reg. No."; Rec."Buyer Party VAT Reg. No.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Buyer Party VAT Reg. No. field.', Comment = '%';
                    }
                }
                group(Delivery)
                {
                    Caption = 'Delivery';

                    field("Delivery Address"; Rec."Delivery Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Address field.', Comment = '%';
                    }
                    field("Delivery City"; Rec."Delivery City")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery City field.', Comment = '%';
                    }
                    field("Delivery County"; Rec."Delivery County")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery County field.', Comment = '%';
                    }
                    field("Delivery Country Code"; Rec."Delivery Country Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Country Code field.', Comment = '%';
                    }
                    field("Delivery Email Address"; Rec."Delivery Email Address")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Email Address field.', Comment = '%';
                    }
                    field("Delivery Party Code"; Rec."Delivery Party Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Party Code field.', Comment = '%';
                    }
                    field("Delivery Party GLN"; Rec."Delivery Party GLN")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Party GLN field.', Comment = '%';
                    }
                    field("Delivery Party Name"; Rec."Delivery Party Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Party Name field.', Comment = '%';
                    }
                    field("Delivery Phone Num."; Rec."Delivery Phone Num.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Phone Num. field.', Comment = '%';
                    }
                    field("Delivery Postal Code"; Rec."Delivery Postal Code")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Delivery Postal Code field.', Comment = '%';
                    }
                }

            }
            part(OrderLines; "HD EDI Order Line List")
            {
                ApplicationArea = all;
                // Editable = IsSalesLinesEditable;
                // Enabled = IsSalesLinesEditable;
                SubPageLink = "Header ID" = field("ID");
                UpdatePropagation = Both;
            }
            Group(Totals)
            {
                ShowCaption = false;
                field("Sum Before VAT"; Rec."Sum Before VAT")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sum Before VAT field.', Comment = '%';
                }
                field("Total Sum"; Rec."Total Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Sum field.', Comment = '%';
                }
                field("Total VAT Sum"; Rec."Total VAT Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total VAT Sum field.', Comment = '%';
                }

            }

            Group(New_Fields)
            {
                field("SenderPeppolID"; Rec."SenderPeppolID")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SenderPeppolID field.', Comment = '%';
                }

                field("ReceiverPeppolID"; Rec."ReceiverPeppolID")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ReceiverPeppolID field.', Comment = '%';
                }

                field("SellerPartyPeppolId"; Rec."SellerPartyPeppolId")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SellerPartyPeppolId field.', Comment = '%';
                }

                field("BuyerPartyPeppolId"; Rec."BuyerPartyPeppolId")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BuyerPartyPeppolId field.', Comment = '%';
                }

                field("File Base64 Content"; Rec."File Base64 Content")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Base64 Content field.', Comment = '%';
                }

                field("File Encryption"; Rec."File Encryption")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Encryption field.', Comment = '%';
                }

                field("File Size"; Rec."File Size")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the File Size field.', Comment = '%';
                }

                field("Document UID"; Rec."Document UID")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document UID field.', Comment = '%';
                }

                field("Balance Date"; Rec."Balance Date")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance Date field.', Comment = '%';
                }

                field("Balance Begin"; Rec."Balance Begin")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance Begin field.', Comment = '%';
                }

                field("Document Sum"; Rec."Document Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Sum field.', Comment = '%';
                }

                field("Sum Group Before VAT"; Rec."Sum Group Before VAT")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sum Group Before VAT field.', Comment = '%';
                }

                field("VAT Sum Group Rate"; Rec."VAT Sum Group Rate")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Sum Group Rate field.', Comment = '%';
                }

                field("VAT Sum Group Sum"; Rec."VAT Sum Group Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Sum Group Sum field.', Comment = '%';
                }

                field("VAT Sum Group Currency"; Rec."VAT Sum Group Currency")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Sum Group Currency field.', Comment = '%';
                }

                field("Sum Group Currency"; Rec."Sum Group Currency")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sum Group Currency field.', Comment = '%';
                }

                field("Item Description"; Rec."Item Description")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Description field.', Comment = '%';
                }

                field("Base Unit"; Rec."Base Unit")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Unit field.', Comment = '%';
                }

                field("Amount Invoiced"; Rec."Amount Invoiced")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Invoiced field.', Comment = '%';
                }

                field("Item Price"; Rec."Item Price")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Price field.', Comment = '%';
                }

                field("Item Sum"; Rec."Item Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Sum field.', Comment = '%';
                }

                field("VAT Rate"; Rec."VAT Rate")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Rate field.', Comment = '%';
                }

                field("VAT Sum"; Rec."VAT Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Sum field.', Comment = '%';
                }

                field("Item Total"; Rec."Item Total")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item Total field.', Comment = '%';
                }

                field("Payment Description"; Rec."Payment Description")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Description field.', Comment = '%';
                }

                field("Payable"; Rec."Payable")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payable field.', Comment = '%';
                }

                field("Pay Due Date"; Rec."Pay Due Date")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Due Date field.', Comment = '%';
                }

                field("Payment Total Sum"; Rec."Payment Total Sum")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Total Sum field.', Comment = '%';
                }

                field("Payer Name"; Rec."Payer Name")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payer Name field.', Comment = '%';
                }

                field("Payment ID"; Rec."Payment ID")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment ID field.', Comment = '%';
                }

                field("Pay To Account"; Rec."Pay To Account")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay To Account field.', Comment = '%';
                }

                field("Pay To Name"; Rec."Pay To Name")
                {
                    editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay To Name field.', Comment = '%';
                }

            }

        }
    }


    actions
    {
        area(Processing)
        {
            action(ShowBase64Content)
            {
                ApplicationArea = All;
                Caption = 'Show Base64 Content';
                Image = Information;

                trigger OnAction()
                var
                    BlobText: Text;
                    MyInStream: InStream;
                begin
                    if Rec."File Base64 Content".HasValue() then begin
                        Rec."File Base64 Content".CreateInStream(MyInStream);
                        MyInStream.ReadText(BlobText);
                        Message('Base64 Content: %1', BlobText);
                    end else begin
                        Message('Blob field is empty.');
                    end;
                end;
            }

            action("FillBlob")
            {
                ApplicationArea = All;
                Caption = 'FillBlob';

                trigger OnAction()
                var
                    convert: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    OutStream: OutStream;
                    InStream: InStream;
                    TestText: Text;
                begin
                    TestText := 'LS1sb2wtLQ==';
                    rec."File Base64 Content".CreateOutStream(OutStream);
                    convert.FromBase64(TestText, OutStream);
                    rec."File Base64 Content".CreateInStream(InStream);
                    rec.modify(true);
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
    begin
        MessageLines.setfilter("Header ID", format(rec."ID"));
        if MessageLines.findset() then
            MessageLines.deleteall;
    end;

    var
        MessageLines: record "HD EDI Message Line";
}