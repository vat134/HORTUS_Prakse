// 25022292
XmlPort 80005 "HDT Telema Invoice Export"
{
    Caption = 'HDT Telema Invoice Export';
    Encoding = UTF8;

    schema
    {
        tableelement("HD EDI Message Header"; "HD EDI Message Header")
        {
            XmlName = 'E-Document';
            textelement(Header)
            {
                // textelement(Test)
                // {
                //     MinOccurs = Zero;

                //     trigger OnBeforePassVariable()
                //     begin
                //         EDISetup.Get;
                //         if EDISetup."Test Mode" then
                //             Test := '1'
                //         else
                //             currXMLport.Skip;
                //     end;
                // }
                textelement(docdate)
                {
                    MaxOccurs = Once;
                    MinOccurs = Once;
                    XmlName = 'DateIssued';

                    trigger OnBeforePassVariable()
                    begin
                        DocDate := Format("HD EDI Message Header"."Document Date", 0, 9);
                    end;
                }
                fieldelement(SenderGLN; "HD EDI Message Header"."Seller Party GLN")
                {
                }
                fieldelement(ReceiverGLN; "HD EDI Message Header"."Delivery Party GLN")
                {
                }
            }
            textelement(Document)
            {
                fieldelement(DocumentType; "HD EDI Message Header"."Document Type")
                {
                }
                textelement(DocumentParties)
                {
                    textelement(BuyerParty)
                    {
                        textattribute(context1)
                        {
                            XmlName = 'context';

                            trigger OnBeforePassVariable()
                            begin
                                context1 := 'partner';
                            end;
                        }
                        fieldelement(PartyCode; "HD EDI Message Header"."Buyer Party Code")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(Name; "HD EDI Message Header"."Buyer Party Name")
                        {
                        }
                        fieldelement(RegNum; "HD EDI Message Header"."Buyer Party Reg. No.")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(VATRegNum; "HD EDI Message Header"."Buyer Party VAT Reg. No.")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(GLN; "HD EDI Message Header"."Buyer Party GLN")
                        {
                            MinOccurs = Zero;
                        }
                        textelement(buyercontactdata)
                        {
                            XmlName = 'ContactData';
                            fieldelement(PhoneNum; "HD EDI Message Header"."Buyer Phone Num.")
                            {
                            }
                            fieldelement(EmailAddress; "HD EDI Message Header"."Buyer Email Address")
                            {
                            }
                            textelement(buyeractualaddress)
                            {
                                XmlName = 'ActualAddress';
                                fieldelement(Address1; "HD EDI Message Header"."Buyer Address")
                                {
                                }
                                fieldelement(City; "HD EDI Message Header"."Buyer City")
                                {
                                }
                                fieldelement(PostalCode; "HD EDI Message Header"."Buyer Postal Code")
                                {
                                }
                                fieldelement(County; "HD EDI Message Header"."Buyer County")
                                {
                                }
                                fieldelement(CountryCode; "HD EDI Message Header"."Buyer Country Code")
                                {
                                }
                            }
                        }
                    }
                    textelement(deliveryparty)
                    {
                        XmlName = 'DeliveryParty';
                        textattribute(context2)
                        {
                            XmlName = 'context';

                            trigger OnBeforePassVariable()
                            begin
                                context2 := 'partner';
                            end;
                        }
                        fieldelement(PartyCode; "HD EDI Message Header"."Delivery Party Code")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(Name; "HD EDI Message Header"."Delivery Party Name")
                        {
                        }
                        fieldelement(GLN; "HD EDI Message Header"."Delivery Party GLN")
                        {
                            MinOccurs = Zero;
                        }
                        textelement(delcontactdata)
                        {
                            XmlName = 'ContactData';
                            textelement(delactualaddress)
                            {
                                XmlName = 'ActualAddress';
                                fieldelement(Address1; "HD EDI Message Header"."Delivery Address")
                                {
                                }
                                fieldelement(City; "HD EDI Message Header"."Delivery City")
                                {
                                }
                                fieldelement(PostalCode; "HD EDI Message Header"."Delivery Postal Code")
                                {
                                }
                                fieldelement(County; "HD EDI Message Header"."Delivery County")
                                {
                                }
                                fieldelement(CountryCode; "HD EDI Message Header"."Delivery Country Code")
                                {
                                }
                            }
                        }
                    }
                    textelement(sellerparty)
                    {
                        XmlName = 'SellerParty';
                        textattribute(context3)
                        {
                            XmlName = 'context';

                            trigger OnBeforePassVariable()
                            begin
                                context3 := 'self';
                            end;
                        }
                        fieldelement(PartyCode; "HD EDI Message Header"."Seller Party Code")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(Name; "HD EDI Message Header"."Seller Party Name")
                        {
                        }
                        fieldelement(RegNum; "HD EDI Message Header"."Seller Party Reg. No.")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(VATRegNum; "HD EDI Message Header"."Seller Party VAT Reg. No.")
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(GLN; "HD EDI Message Header"."Seller Party GLN")
                        {
                            MinOccurs = Zero;
                        }
                        textelement(LicenceInfo)
                        {
                            XmlName = 'LicenceInfo';
                            textattribute(Licence)
                            {
                                XmlName = 'type';

                                trigger OnBeforePassVariable()
                                begin
                                    Licence := 'alco';
                                end;
                            }
                            textelement(LicenceName)
                            {
                                MinOccurs = Zero;
                                XmlName = 'LicenceName';

                                trigger OnBeforePassVariable()
                                begin
                                    LicenceName := 'Alkohola vairumtirdzniecības licence';
                                end;
                            }
                            textelement(LicenceNum)
                            {
                                XmlName = 'LicenceNum';
                            }
                            textelement(LicenceIssuedBy)
                            {
                                XmlName = 'LicenceIssuedBy';

                                trigger OnBeforePassVariable()
                                begin
                                    LicenceIssuedBy := 'Valsts ieņēmumu dienests';
                                end;
                            }

                            // trigger OnBeforePassVariable()
                            // begin
                            //     if Location.get("HD EDI Message Header"."Location Code") then begin
                            //         if (Location."HDTLicence Type" = 0) OR (Location."HDTLicence No." = '') then
                            //             currXMLport.Skip
                            //         else
                            //             LicenceNum := Format(Location."HDTLicence Type") + ' ' + Location."HDTLicence No.";
                            //     end else
                            //         currXMLport.Skip;

                            // end;
                        }
                        textelement(selcontactdata)
                        {
                            MinOccurs = Zero;
                            XmlName = 'ContactData';
                            fieldelement(PhoneNum; "HD EDI Message Header"."Seller Phone Num.")
                            {
                                MinOccurs = Zero;
                            }
                            fieldelement(EmailAddress; "HD EDI Message Header"."Seller Email Address")
                            {
                                MinOccurs = Zero;
                            }
                            textelement(selactualaddress)
                            {
                                MinOccurs = Zero;
                                XmlName = 'ActualAddress';
                                fieldelement(Address1; "HD EDI Message Header"."Seller Address")
                                {
                                    MinOccurs = Zero;
                                }
                                fieldelement(City; "HD EDI Message Header"."Seller City")
                                {
                                    MinOccurs = Zero;
                                }
                                fieldelement(PostalCode; "HD EDI Message Header"."Seller Postal Code")
                                {
                                    MinOccurs = Zero;
                                }
                                fieldelement(County; "HD EDI Message Header"."Seller County")
                                {
                                    MinOccurs = Zero;
                                }
                                fieldelement(CountryCode; "HD EDI Message Header"."Seller Country Code")
                                {
                                    MinOccurs = Zero;
                                }
                            }
                        }
                        // textelement(licdata)
                        // {
                        //     MinOccurs = Zero;
                        //     XmlName = 'LicenceInfo';
                        //     textattribute(liccontext)
                        //     {
                        //         XmlName = 'type';

                        //         trigger OnBeforePassVariable()
                        //         begin
                        //             liccontext := 'alco';
                        //         end;
                        //     }

                        //     fieldelement(LicenceName; "HD EDI Message Header"."Seller Postal Code")
                        //     {
                        //         MinOccurs = Zero;
                        //     }
                        //     fieldelement(LicenceNum; "HD EDI Message Header"."Seller County")
                        //     {
                        //         MinOccurs = Zero;
                        //     }
                        //     fieldelement(LicenceIssuedBy; "HD EDI Message Header"."Seller Country Code")
                        //     {
                        //         MinOccurs = Zero;
                        //     }
                        // }
                    }
                }
                textelement(DocumentInfo)
                {
                    fieldelement(DocumentSubType; "HD EDI Message Header"."Document Sub Type")
                    {
                        MinOccurs = Zero;
                    }
                    textelement(documentname)
                    {
                        MinOccurs = Zero;
                        XmlName = 'DocumentName';

                        trigger OnBeforePassVariable()
                        begin
                            DocumentName := "HD EDI Message Header"."Document Name" // := 'Despatch advise'; NV ??
                        end;
                    }
                    fieldelement(DocumentNum; "HD EDI Message Header"."Document No.")
                    {
                    }
                    textelement(DateInfo)
                    {
                        textelement(InvoiceDate)
                        {
                            MinOccurs = Zero;
                            XmlName = 'InvoiceDate';

                            trigger OnBeforePassVariable()
                            begin
                                InvoiceDate := Format("HD EDI Message Header"."Invoice Date", 0, 9);
                            end;
                        }
                        textelement(DueDate)
                        {
                            MinOccurs = Zero;
                            XmlName = 'DueDate';

                            trigger OnBeforePassVariable()
                            begin
                                DueDate := Format("HD EDI Message Header"."Due Date", 0, 9);
                            end;
                        }
                        textelement(deldate)
                        {
                            MinOccurs = Zero;
                            XmlName = 'DeliveryDateActual';

                            trigger OnBeforePassVariable()
                            begin
                                DelDate := Format("HD EDI Message Header"."Delivery Date", 0, 9);
                            end;
                        }
                    }
                    textelement(RefInfo)
                    {
                        MinOccurs = Zero;
                        textelement(SourceDocument)
                        {
                            MinOccurs = Zero;
                            textattribute(type)
                            {
                                Occurrence = Optional;
                                XmlName = 'type';

                                trigger OnBeforePassVariable()
                                begin
                                    type := 'order';
                                end;
                            }
                            fieldelement(SourceDocumentNum; "HD EDI Message Header"."External No")
                            {
                                MinOccurs = Zero;
                            }
                        }
                    }
                    textelement(CreatedByContact)
                    {
                        fieldelement(EmailAddress; "HD EDI Message Header"."Sales Pers E-mail")
                        {
                        }
                    }
                }
                textelement(DocumentSumGroup)
                {
                    textelement(DocumentSum)
                    {
                        MinOccurs = Zero;
                        XmlName = 'DocumentSum';
                        trigger OnBeforePassVariable()
                        begin
                            DocumentSum := Format("HD EDI Message Header"."Sum Before VAT", 0, 9)
                        end;
                    }
                    /*tableelement("MessageLineVAT"; "HD EDI Message Line")
                    {
                        XmlName = 'VAT';
                        LinkFields = "Header ID" = field("ID");
                        LinkTable = "HD EDI Message Header";
                        SourceTableView = sorting("Line Item Num") order(ascending);
                        textattribute(vatID1)
                        {
                            Occurrence = Optional;
                            XmlName = 'vatID';

                            trigger OnBeforePassVariable()
                            begin
                                if "MessageLineVAT"."VAT rate" <> 0 then
                                    vatID1 := 'TAX'
                                else
                                    vatID1 := 'NOTTAX'
                            end;
                        }
                        textelement(SumBeforeVAT1)
                        {
                            XmlName = 'SumBeforeVAT';
                            trigger OnBeforePassVariable()
                            begin
                                SumBeforeVAT1 := Format("MessageLineVAT"."Sum Before VAT", 0, 9);
                            end;
                        }
                        textelement(VATRate1)
                        {
                            XmlName = 'VATRate';
                            trigger OnBeforePassVariable()
                            begin
                                VATRate1 := format("MessageLineVAT"."VAT rate", 0, 9);
                            end;
                        }
                        textelement(VATSum1)
                        {
                            XmlName = 'VATSum';
                            trigger OnBeforePassVariable()
                            begin
                                VATSum1 := Format("MessageLineVAT"."VAT Sum", 0, 9);
                            end;
                        }
                    }*/


                    tableelement("MessageLineVAT"; "HD EDI Message Line")
                    {
                        XmlName = 'VAT';

                        LinkFields = "Header ID" = field("ID");
                        LinkTable = "HD EDI Message Header";
                        SourceTableView = sorting("Line Item Num") order(ascending);

                        trigger OnAfterGetRecord()
                        begin
                            TempVATGroup.setrange("VAT rate", MessageLineVAT."VAT rate");
                            if TempVATGroup.findset() then begin
                                TempVATGroup."Sum Before VAT" += MessageLineVAT."Sum Before VAT";
                                TempVATGroup."VAT Sum" += MessageLineVAT."VAT Sum";
                                TempVATGroup.modify;
                            end else begin
                                TempVATGroup.Init();
                                TempVATGroup.ID := random(9999);
                                TempVATGroup."VAT rate" := MessageLineVAT."VAT rate";
                                TempVATGroup."Sum Before VAT" := MessageLineVAT."Sum Before VAT";
                                TempVATGroup."VAT Sum" := MessageLineVAT."VAT Sum";
                                TempVATGroup.Insert();
                            end;
                            currXMLport.skip;
                        end;
                    }
                    textelement(TempVATGroup21)
                    {
                        xmlname = 'VAT';
                        MaxOccurs = Unbounded;
                        textattribute(vatID21)
                        {
                            XmlName = 'vatID';
                            Occurrence = Optional;
                        }
                        textelement(SumBeforeVAT21)
                        {
                            XmlName = 'SumBeforeVAT';
                            MaxOccurs = Unbounded;

                        }
                        textelement(VATRate21)
                        {
                            XmlName = 'VATRate';
                            MaxOccurs = Unbounded;

                        }
                        textelement(VATSum21)
                        {
                            XmlName = 'VATSum';
                            MaxOccurs = Unbounded;

                        }
                        trigger OnBeforePassVariable()
                        var
                            counter: integer;
                        begin
                            TempVATGroup.SETFILTER("VAT Rate", '21');
                            if TempVATGroup.findset() then begin

                                SumBeforeVAT21 := Format(TempVATGroup."Sum Before VAT", 0, 9);
                                VATRate21 := Format(TempVATGroup."VAT rate", 0, 9);
                                VATSum21 := Format(TempVATGroup."VAT Sum", 0, 9);

                                if TempVATGroup."VAT rate" <> 0 then
                                    vatID21 := 'TAX'
                                else
                                    vatID21 := 'NOTTAX';

                            end else
                                currXMLport.Skip;
                        end;
                    }
                    textelement(TempVATGroup0)
                    {
                        xmlname = 'VAT';
                        MaxOccurs = Unbounded;
                        textattribute(vatID0)
                        {
                            XmlName = 'vatID';
                            Occurrence = Optional;
                        }
                        textelement(SumBeforeVAT0)
                        {
                            XmlName = 'SumBeforeVAT';
                            MaxOccurs = Unbounded;

                        }
                        textelement(VATRate0)
                        {
                            XmlName = 'VATRate';
                            MaxOccurs = Unbounded;

                        }
                        textelement(VATSum0)
                        {
                            XmlName = 'VATSum';
                            MaxOccurs = Unbounded;

                        }
                        trigger OnBeforePassVariable()
                        var
                            counter: integer;
                        begin
                            TempVATGroup.SETFILTER("VAT Rate", '0');
                            if TempVATGroup.findset() then begin
                                SumBeforeVAT0 := Format(TempVATGroup."Sum Before VAT", 0, 9);
                                VATRate0 := Format(TempVATGroup."VAT rate", 0, 9);
                                VATSum0 := Format(TempVATGroup."VAT Sum", 0, 9);

                                if TempVATGroup."VAT rate" <> 0 then
                                    vatID0 := 'TAX'
                                else
                                    vatID0 := 'NOTTAX';

                            end else
                                currXMLport.Skip;
                        end;
                    }
                    textelement(TotalVATSum)
                    {
                        MinOccurs = Zero;
                        XmlName = 'TotalVATSum';
                        trigger OnBeforePassVariable()
                        begin
                            TotalVATSum := Format("HD EDI Message Header"."Total VAT Sum", 0, 9)
                        end;
                    }
                    textelement(TotalSum)
                    {
                        trigger OnBeforePassVariable()
                        begin
                            TotalSum := Format("HD EDI Message Header"."Total Sum", 0, 9)
                        end;
                    }
                    fieldelement(Currency; "HD EDI Message Header"."Currency")
                    {
                    }
                }
                textelement(DocumentItem)
                {
                    tableelement("HD EDI Message Line"; "HD EDI Message Line")
                    {
                        LinkFields = "Header ID" = field("ID");
                        LinkTable = "HD EDI Message Header";
                        XmlName = 'ItemEntry';
                        SourceTableView = sorting("Line Item Num") order(ascending);
                        fieldelement(LineItemNum; "HD EDI Message Line"."Line Item Num")
                        {
                        }
                        fieldelement(SellerItemCode; "HD EDI Message Line"."Seller Item Code")
                        {
                        }
                        fieldelement(GTIN; "HD EDI Message Line".GTIN)
                        {
                        }
                        fieldelement(ItemDescription; "HD EDI Message Line"."Item Description")
                        {
                        }
                        textelement(ItemUnitRecord)
                        {
                            textelement(ItemUnit)
                            {

                                trigger OnBeforePassVariable()
                                begin
                                    if "HD EDI Message Line"."Item Unit" <> '' then
                                        ItemUnit := "HD EDI Message Line"."Item Unit"
                                    else
                                        ItemUnit := 'PCS';
                                end;
                            }
                        }
                        textelement(BaseUnit)
                        {

                            trigger OnBeforePassVariable()
                            begin
                                if "HD EDI Message Line"."Base Unit" <> '' then
                                    BaseUnit := "HD EDI Message Line"."Base Unit"
                                else
                                    BaseUnit := 'PCS';
                            end;
                        }
                        textelement(amountdespatched)
                        {
                            XmlName = 'AmountDespatched';

                            trigger OnBeforePassVariable()
                            begin
                                AmountDespatched := Format("HD EDI Message Line"."Amount Despatched", 0, 9);
                            end;
                        }
                        textelement(amountordered)
                        {
                            MaxOccurs = Unbounded;
                            MinOccurs = Zero;
                            XmlName = 'AmountOrdered';

                            trigger OnBeforePassVariable()
                            begin
                                AmountOrdered := Format("HD EDI Message Line"."Amount Ordered", 0, 9);
                            end;
                        }
                        textelement(AmountInvoiced)
                        {
                            XmlName = 'AmountInvoiced';

                            trigger OnBeforePassVariable()
                            begin
                                AmountInvoiced := Format("HD EDI Message Line"."Amount Invoiced", 0, 9);
                            end;
                        }
                        textelement(itemprice)
                        {
                            XmlName = 'ItemPrice';

                            trigger OnBeforePassVariable()
                            begin
                                ItemPrice := Format("HD EDI Message Line"."Item Price Ordered", 0, 9);
                            end;
                        }
                        textelement(ItemTotal)
                        {
                            XmlName = 'ItemTotal';

                            trigger OnBeforePassVariable()
                            begin
                                ItemTotal := Format("HD EDI Message Line"."Item Total", 0, 9);
                            end;
                        }
                        textelement(ItemSum)
                        {
                            XmlName = 'ItemSum';

                            trigger OnBeforePassVariable()
                            begin
                                ItemSum := Format("HD EDI Message Line"."Sum Before VAT", 0, 9);
                            end;
                        }
                        textelement(VAT2)
                        {
                            XmlName = 'VAT';
                            textattribute(vatID2)
                            {
                                Occurrence = Optional;
                                XmlName = 'vatID';

                                trigger OnBeforePassVariable()
                                begin
                                    if "HD EDI Message Line"."VAT rate" <> 0 then
                                        vatID2 := 'TAX'
                                    else
                                        vatID2 := 'NOTTAX'
                                end;
                            }
                            textelement(SumBeforeVAT)
                            {
                                XmlName = 'SumBeforeVAT';
                                trigger OnBeforePassVariable()
                                begin
                                    SumBeforeVAT := Format("HD EDI Message Line"."Sum Before VAT", 0, 9)
                                end;
                            }
                            textelement(VATRate)
                            {
                                XmlName = 'VATRate';
                                trigger OnBeforePassVariable()
                                begin
                                    VATRate := Format("HD EDI Message Line"."VAT rate", 0, 9)
                                end;
                            }
                            textelement(VATSum)
                            {
                                XmlName = 'VATSum';
                                trigger OnBeforePassVariable()
                                begin
                                    VATSum := Format("HD EDI Message Line"."VAT Sum", 0, 9)
                                end;
                            }
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if "HD EDI Message Line"."Amount Despatched" = 0 then
                                currXMLport.Skip;
                        end;

                        trigger OnPreXmlItem()
                        begin
                            if "HD EDI Message Line"."Amount Despatched" = 0 then
                                currXMLport.Skip;
                        end;
                    }
                }
                // textelement(AdditionalInfo)
                // {
                //     textelement(Extension)
                //     {
                //         textattribute(extensionId)
                //         {
                //         }
                //         textelement(InfoName)
                //         {
                //         }
                //         fieldelement(InfoContent; "HD EDI Message Header"."Additional Info 1")
                //         {
                //         }
                //     }
                // }
                textelement(AdditionalInfo)
                {
                    MinOccurs = Zero;
                    textelement(Extension)
                    {
                        MinOccurs = Zero;
                        textattribute(extensionId)
                        {
                            Occurrence = Optional;
                        }
                        textelement(InfoName)
                        {
                            MinOccurs = Zero;
                        }
                        fieldelement(InfoContent; "HD EDI Message Header"."Additional Info 1")
                        {
                            MinOccurs = Zero;
                        }
                    }
                }
            }

            trigger OnBeforeInsertRecord()
            begin
                "HD EDI Message Header"."Created DateTime" := CurrentDatetime();
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        Location: record "Location";

        TempVATGroup: Record "HD EDI Message Line" temporary;
        TestInt: integer;


    procedure ConvertDecimal(var ADecimal: Decimal) RetDecimal: Text[80]
    begin
        //IF EVALUATE(RetDecimal,CONVERTSTR(ADecimal, '.', ',')) THEN
        //  EXIT(RetDecimal);

        //IF EVALUATE(RetDecimal,ADecimal) THEN
        //EXIT(RetDecimal);


    end;


}
