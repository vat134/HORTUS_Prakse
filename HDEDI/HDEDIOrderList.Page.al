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
            action("XMLPortImport")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = xmlport "Xml Port Import";
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

xmlport 80006 "Xml Port Import"
{
    Format = Xml;
    UseRequestPage = false;

    schema
    {
        tableelement("E-Document"; "HD EDI Message Header")
        {
            textelement(Header)
            {
                fieldelement(DateIssued; "E-Document"."Document Date") { }
                fieldelement(SenderID; "E-Document"."Sender ID") { }
                fieldelement(SenderPeppolID; "E-Document".SenderPeppolID) { }
                fieldelement(ReceiverPeppolID; "E-Document".ReceiverPeppolID) { }
                fieldelement(ReceiverRegNum; "E-Document"."Buyer Party Reg. No.") { }
                fieldelement(ReceiverCountryCode; "E-Document"."Buyer Country Code") { }
                fieldelement(ReceiverEAddress; "E-Document"."Buyer Email Address") { }
            }

            textelement(Document)
            {
                fieldelement(DocumentType; "E-Document"."Document Type") { }
                textelement(DocumentParties)
                {
                    textelement(SellerParty)
                    {
                        textattribute(context1)
                        {
                            XmlName = 'context';

                            trigger OnBeforePassVariable()
                            begin
                                context1 := 'partner';
                            end;
                        }
                        fieldelement(PartyCode; "E-Document"."Seller Party Code") { }
                        textelement(SellerAdditionalPartyReferences)
                        {
                            xmlname = 'AdditionalPartyReferences';
                            fieldelement(SellerAdditionalPartyReference; "E-Document"."Additional Info 1")
                            {
                                xmlname = 'AdditionalPartyReference';
                                textattribute(schemeId1)
                                {
                                    XmlName = 'schemeId';

                                    trigger OnBeforePassVariable()
                                    begin
                                        schemeId1 := 'LV_EADDRESS';
                                    end;
                                }
                            }
                        }
                        fieldelement(PartyPeppolId; "E-Document".SellerPartyPeppolId) { }
                        fieldelement(Name; "E-Document"."Seller Party Name") { }
                        fieldelement(RegNum; "E-Document"."Seller Party Reg. No.") { }
                        fieldelement(VATRegNum; "E-Document"."Seller Party VAT Reg. No.") { }
                        textelement(SellerContactData)
                        {
                            XmlName = 'ContactData';
                            textelement(SellerActualAddress)
                            {
                                XmlName = 'ActualAddress';
                                fieldelement(Address1; "E-Document"."Seller Address") { }
                                fieldelement(City; "E-Document"."Seller City") { }
                                fieldelement(PostalCode; "E-Document"."Seller Postal Code") { }
                                fieldelement(Country; "E-Document"."Seller County") { }
                                fieldelement(CountryCode; "E-Document"."Seller Country Code") { }
                            }
                        }
                        textelement(AccountInfo)
                        {
                            fieldelement(AccountNum; "E-Document".AccountNum) { }
                            fieldelement(BankName; "E-Document".BankName) { }
                        }
                    }

                    textelement(BuyerParty)
                    {
                        textattribute(context2)
                        {
                            XmlName = 'context';

                            trigger OnBeforePassVariable()
                            begin
                                context2 := 'partner';
                            end;
                        }
                        fieldelement(PartyCode; "E-Document"."Buyer Party Code") { }
                        textelement(BuyerAdditionalPartyReferences)
                        {
                            xmlname = 'AdditionalPartyReferences';
                            fieldelement(BuyerAdditionalPartyReference; "E-Document"."Additional Info 2")
                            {
                                xmlname = 'AdditionalPartyReference';
                                textattribute(schemeId2)
                                {
                                    XmlName = 'schemeId';

                                    trigger OnBeforePassVariable()
                                    begin
                                        schemeId2 := 'LV_EADDRESS';
                                    end;
                                }
                            }
                        }
                        fieldelement(PartyPeppolId; "E-Document".BuyerPartyPeppolId) { }
                        fieldelement(Name; "E-Document"."Buyer Party Name") { }
                        fieldelement(RegNum; "E-Document"."Buyer Party Reg. No.") { }
                        fieldelement(VATRegNum; "E-Document"."Buyer Party VAT Reg. No.") { }
                        textelement(BuyerContactData)
                        {
                            XmlName = 'ContactData';
                            textelement(BuyerActualAddress)
                            {
                                XmlName = 'ActualAddress';
                                fieldelement(Address1; "E-Document"."Buyer Address") { }
                                fieldelement(City; "E-Document"."Buyer City") { }
                                fieldelement(PostalCode; "E-Document"."Buyer Postal Code") { }
                                fieldelement(Country; "E-Document"."Buyer County") { }
                                fieldelement(CountryCode; "E-Document"."Buyer Country Code") { }
                            }
                        }
                    }
                }

                textelement(DocumentInfo)
                {
                    fieldelement(DocumentSubType; "E-Document"."Document Sub Type") { }
                    fieldelement(DocumentName; "E-Document"."Document Name") { }
                    fieldelement(DocumentNum; "E-Document"."Document No.") { }

                    textelement(DateInfo)
                    {
                        fieldelement(InvoiceDate; "E-Document"."Invoice Date") { }
                        fieldelement(DueDate; "E-Document"."Due Date") { }
                    }

                    textelement(Attachments)
                    {
                        textelement(FileElement)
                        {
                            XmlName = 'File';
                            fieldelement(FileName; "E-Document"."File Name") { }
                            fieldelement(FileType; "E-Document"."File Format") { }

                            textelement(FileBase64)
                            {
                                XmlName = 'FileBase64';

                                trigger OnBeforePassVariable()
                                var
                                    MainInStream: InStream;
                                    TableOutStr: OutStream;
                                    TestText: Text;

                                    TempBlob: Codeunit "Temp Blob";
                                    Base64Convert: Codeunit "Base64 Convert";
                                begin
                                    //TestText := 'LS1sb2wtLQ==';

                                    "E-Document"."File Base64 Content".CreateOutStream(TableOutStr);
                                    Base64Convert.FromBase64(FileBase64, TableOutStr);
                                    "E-Document"."File Base64 Content".CreateInStream(MainInStream);
                                    "E-Document".Modify(true);
                                end;
                            }

                            fieldelement(FileEncryption; "E-Document"."File Encryption") { }
                            fieldelement(FileSize; "E-Document"."File Size") { }
                        }
                    }

                    fieldelement(DocumentUID; "E-Document"."Document UID") { }
                }

                textelement(DocumentSumGroup)
                {
                    textelement(Balance)
                    {
                        fieldelement(BalanceDate; "E-Document"."Balance Date") { }
                        textelement(BalanceBegin)
                        {
                            XmlName = 'BalanceBegin';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                BalanceBegin := Format(tableRec."Balance Begin");
                            end;
                        }
                    }

                    textelement(DocumentSum)
                    {
                        XmlName = 'DocumentSum';

                        trigger OnBeforePassVariable()
                        var
                            tableRec: Record "HD EDI Message Header";
                        begin
                            DocumentSum := Format(tableRec."Document Sum");
                        end;
                    }

                    textelement(VATSumGroup)
                    {
                        XmlName = 'VAT';
                        textattribute(vatIDGroup)
                        {
                            XmlName = 'vatID';
                        }
                        textelement(SumBeforeVAT1)
                        {
                            XmlName = 'SumBeforeVAT';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                SumBeforeVAT1 := Format(tableRec."Sum Before VAT");
                            end;
                        }
                        fieldelement(VATRate; "E-Document"."VAT Sum Group Rate") { }
                        textelement(VATSum1)
                        {
                            XmlName = 'VATSum';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                VATSum1 := Format(tableRec."VAT Sum Group Sum");
                            end;
                        }
                        fieldelement(Currency; "E-Document"."VAT Sum Group Currency") { }
                    }

                    textelement(TotalSum)
                    {
                        XmlName = 'TotalSum';

                        trigger OnBeforePassVariable()
                        var
                            tableRec: Record "HD EDI Message Header";
                        begin
                            TotalSum := Format(tableRec."Total Sum");
                        end;
                    }
                    fieldelement(Currency; "E-Document"."Sum Group Currency") { }
                }

                textelement(DocumentItem)
                {
                    textelement(ItemEntry)
                    {
                        fieldelement(ItemDescription; "E-Document"."Item Description") { }
                        fieldelement(BaseUnit; "E-Document"."Base Unit") { }
                        fieldelement(AmountInvoiced; "E-Document"."Amount Invoiced") { }
                        textelement(ItemPrice)
                        {
                            XmlName = 'ItemPrice';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                ItemPrice := Format(tableRec."Item Price");
                            end;
                        }
                        textelement(ItemSum)
                        {
                            XmlName = 'ItemSum';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                ItemSum := Format(tableRec."Item Sum");
                            end;
                        }

                        textelement(VAT)
                        {
                            textattribute(vatID)
                            {
                                XmlName = 'vatID';
                            }
                            textelement(SumBeforeVAT)
                            {
                                XmlName = 'SumBeforeVAT';

                                trigger OnBeforePassVariable()
                                var
                                    tableRec: Record "HD EDI Message Header";
                                begin
                                    SumBeforeVAT := Format(tableRec."Sum Before VAT");
                                end;
                            }
                            fieldelement(VATRate; "E-Document"."VAT Rate") { }
                            textelement(VATSum)
                            {
                                XmlName = 'VATSum';

                                trigger OnBeforePassVariable()
                                var
                                    tableRec: Record "HD EDI Message Header";
                                begin
                                    VATSum := Format(tableRec."VAT Sum");
                                end;
                            }
                        }

                        textelement(ItemTotal)
                        {
                            XmlName = 'ItemTotal';

                            trigger OnBeforePassVariable()
                            var
                                tableRec: Record "HD EDI Message Header";
                            begin
                                ItemTotal := Format(tableRec."Item Total");
                            end;
                        }
                    }
                }

                textelement(PaymentInfo)
                {
                    fieldelement(Currency; "E-Document"."Currency") { }
                    fieldelement(PaymentDescription; "E-Document"."Payment Description") { }
                    fieldelement(Payable; "E-Document"."Payable") { }
                    fieldelement(PayDueDate; "E-Document"."Pay Due Date") { }
                    textelement(PaymentTotalSum)
                    {
                        XmlName = 'PaymentTotalSum';

                        trigger OnBeforePassVariable()
                        var
                            tableRec: Record "HD EDI Message Header";
                        begin
                            PaymentTotalSum := Format(tableRec."Payment Total Sum");
                        end;
                    }
                    fieldelement(PayerName; "E-Document"."Payer Name") { }
                    fieldelement(PaymentID; "E-Document"."Payment ID") { }
                    fieldelement(PayToAccount; "E-Document"."Pay To Account") { }
                    fieldelement(PayToName; "E-Document"."Pay To Name") { }
                }
            }
        }
    }
}