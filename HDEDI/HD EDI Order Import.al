codeunit 80001 "HD EDI Order Import"
{
    procedure Import()
    var
        InS: InStream;
        FileName: Text;
        XmlDoc: XmlDocument;
        Root: XmlElement;
        Records: XmlNodeList;
        Node: XmlNode;
        e: XmlElement;
        Data: Record "HD EDI Message Header";
        ItemData: Record "HD EDI Message Line";
        MainData: Record "HD EDI Message Header";
        NextID: BigInteger;
        NextTEMPKEY: BigInteger;
        fieldnode: XmlNode;
        field: XmlElement;
        fieldnode2: XmlNode;
        field2: XmlElement;
        Ref: RecordRef;
        FieldRef: FieldRef;
        i: Integer;
        attributeValue: Text;
        Attr: XmlAttribute;
        vatCount: Integer;
        itemCount: Integer;
        convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        OutStream1: OutStream;
        InStream1: InStream;
        TestText: Text;
        itemNode: XmlNode;
        itemElement: XmlElement;
    begin
        if UploadIntoStream('Upload XML', '', '', FileName, InS) then
            if XmlDocument.ReadFrom(InS, XmlDoc) then begin
                XmlDoc.GetRoot(Root);
                Records := Root.GetChildElements('Document');
                foreach Node in Records do begin
                    e := Node.AsXmlElement();

                    Data.Init();
                    Data.Insert(true);
                    vatCount := 1;
                    itemCount := 1;

                    // *** Header ***
                    foreach fieldnode in Root.GetChildNodes() do begin
                        if fieldnode.IsXmlElement() then begin
                            field := fieldnode.AsXmlElement();
                            if field.Name = 'Header' then
                                foreach fieldnode in field.GetChildNodes() do begin
                                    if fieldnode.IsXmlElement() then begin
                                        field := fieldnode.AsXmlElement();
                                        case field.Name of
                                            'DateIssued':
                                                Evaluate(Data."Document Date", field.InnerText, 9);
                                            'SenderID':
                                                Data."Sender ID" := field.InnerText;
                                            'SenderPeppolID':
                                                Data.SenderPeppolID := field.InnerText;
                                            'ReceiverPeppolID':
                                                Data.ReceiverPeppolID := field.InnerText;
                                            'ReceiverRegNum':
                                                Data."Buyer Party Reg. No." := field.InnerText;
                                            'ReceiverCountryCode':
                                                Data."Buyer Country Code" := field.InnerText;
                                            'ReceiverEAddress':
                                                Data."Buyer Email Address" := field.InnerText;
                                        end;
                                    end;
                                end;
                        end;
                    end;


                    // *** Document Part ***

                    foreach fieldnode in e.GetChildNodes() do begin
                        if fieldnode.IsXmlElement() then begin
                            field := fieldnode.AsXmlElement();

                            if field.Name = 'DocumentType' then
                                Data."Document Type" := field.InnerText;

                            if field.Name = 'DocumentParties' then
                                foreach fieldnode in field.GetChildNodes() do begin
                                    if fieldnode.IsXmlElement() then begin
                                        field := fieldnode.AsXmlElement();
                                        if field.Name = 'SellerParty' then begin
                                            if field.HasAttributes() then begin
                                                foreach Attr in field.Attributes() do begin
                                                    attributeValue := Attr.Value;
                                                    case Attr.Name of
                                                        'context':
                                                            if attributeValue = 'partner' then begin
                                                                foreach fieldnode2 in field.GetChildNodes() do begin
                                                                    if fieldnode2.IsXmlElement() then begin
                                                                        field2 := fieldnode2.AsXmlElement();
                                                                        if field2.Name = 'PartyCode' then
                                                                            Data."Seller Party Code" := field2.InnerText;
                                                                    end;
                                                                end;
                                                            end;
                                                    end;
                                                end;
                                            end;
                                            foreach fieldnode in field.GetChildNodes() do
                                                if fieldnode.IsXmlElement() then begin
                                                    field := fieldnode.AsXmlElement();
                                                    case field.Name of
                                                        'AdditionalPartyReferences':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    if field.Name = 'AdditionalPartyReference' then
                                                                        Data."Additional Info 1" := field.InnerText;
                                                                end;
                                                        'PartyPeppolId':
                                                            Data.SellerPartyPeppolId := field.InnerText;
                                                        'Name':
                                                            Data."Seller Party Name" := field.InnerText;
                                                        'RegNum':
                                                            Data."Seller Party Reg. No." := field.InnerText;
                                                        'VATRegNum':
                                                            Data."Seller Party VAT Reg. No." := field.InnerText;
                                                        'ContactData':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    if field.Name = 'ActualAddress' then
                                                                        foreach fieldnode in field.GetChildNodes() do
                                                                            if fieldnode.IsXmlElement() then begin
                                                                                field := fieldnode.AsXmlElement();
                                                                                case field.Name of
                                                                                    'Address1':
                                                                                        Data."Seller Address" := field.InnerText;
                                                                                    'City':
                                                                                        Data."Seller City" := field.InnerText;
                                                                                    'PostalCode':
                                                                                        Data."Seller Postal Code" := field.InnerText;
                                                                                    'Country':
                                                                                        Data."Seller County" := field.InnerText;
                                                                                    'CountryCode':
                                                                                        Data."Seller Country Code" := field.InnerText;
                                                                                end;
                                                                            end;
                                                                end;
                                                        'AccountInfo':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    case field.Name of
                                                                        'AccountNum':
                                                                            Data.AccountNum := field.InnerText;
                                                                        'BankName':
                                                                            Data.BankName := field.InnerText;
                                                                    end;
                                                                end;
                                                    end;
                                                end;
                                        end;

                                        if field.Name = 'BuyerParty' then begin
                                            if field.HasAttributes() then begin
                                                foreach Attr in field.Attributes() do begin
                                                    attributeValue := Attr.Value;
                                                    case Attr.Name of
                                                        'context':
                                                            if attributeValue = 'partner' then begin
                                                                foreach fieldnode2 in field.GetChildNodes() do begin
                                                                    if fieldnode2.IsXmlElement() then begin
                                                                        field2 := fieldnode2.AsXmlElement();
                                                                        if field2.Name = 'PartyCode' then
                                                                            Data."Buyer Party Code" := field2.InnerText;
                                                                    end;
                                                                end;
                                                            end;
                                                    end;
                                                end;
                                            end;
                                            foreach fieldnode in field.GetChildNodes() do
                                                if fieldnode.IsXmlElement() then begin
                                                    field := fieldnode.AsXmlElement();
                                                    case field.Name of
                                                        'AdditionalPartyReferences':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    if field.Name = 'AdditionalPartyReference' then
                                                                        Data."Additional Info 2" := field.InnerText;
                                                                end;
                                                        'PartyPeppolId':
                                                            Data.BuyerPartyPeppolId := field.InnerText;
                                                        'Name':
                                                            Data."Buyer Party Name" := field.InnerText;
                                                        'RegNum':
                                                            Data."Buyer Party Reg. No." := field.InnerText;
                                                        'VATRegNum':
                                                            Data."Buyer Party VAT Reg. No." := field.InnerText;
                                                        'ContactData':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    if field.Name = 'ActualAddress' then
                                                                        foreach fieldnode in field.GetChildNodes() do
                                                                            if fieldnode.IsXmlElement() then begin
                                                                                field := fieldnode.AsXmlElement();
                                                                                case field.Name of
                                                                                    'Address1':
                                                                                        Data."Buyer Address" := field.InnerText;
                                                                                    'City':
                                                                                        Data."Buyer City" := field.InnerText;
                                                                                    'PostalCode':
                                                                                        Data."Buyer Postal Code" := field.InnerText;
                                                                                    'Country':
                                                                                        Data."Buyer County" := field.InnerText;
                                                                                    'CountryCode':
                                                                                        Data."Buyer Country Code" := field.InnerText;
                                                                                end;
                                                                            end;
                                                                end;
                                                    end;
                                                end;
                                        end;
                                    end;
                                end;

                            // *** DocumentInfo ***
                            if field.Name = 'DocumentInfo' then
                                foreach fieldnode in field.GetChildNodes() do
                                    if fieldnode.IsXmlElement() then begin
                                        field := fieldnode.AsXmlElement();
                                        case field.Name of
                                            'DocumentSubType':
                                                Data."Document Sub Type" := field.InnerText;
                                            'DocumentName':
                                                Data."Document Name" := field.InnerText;
                                            'DocumentNum':
                                                Data."Document No." := field.InnerText;
                                            'DateInfo':
                                                foreach fieldnode in field.GetChildNodes() do
                                                    if fieldnode.IsXmlElement() then begin
                                                        field := fieldnode.AsXmlElement();
                                                        case field.Name of
                                                            'InvoiceDate':
                                                                Evaluate(Data."Invoice Date", field.InnerText, 9);
                                                            'DueDate':
                                                                Evaluate(Data."Due Date", field.InnerText, 9);
                                                        end;
                                                    end;
                                            'Attachments':
                                                foreach fieldnode in field.GetChildNodes() do
                                                    if fieldnode.IsXmlElement() then begin
                                                        field := fieldnode.AsXmlElement();
                                                        if field.Name = 'File' then
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    case field.Name of
                                                                        'FileName':
                                                                            Data."File Name" := field.InnerText;
                                                                        'FileType':
                                                                            Data."File Format" := field.InnerText;
                                                                        'FileBase64':
                                                                            begin
                                                                                Data."File Base64 Content".CreateOutStream(OutStream1);
                                                                                //Message('Base64test: %1', field.InnerText);
                                                                                //convert.FromBase64(field.InnerText, OutStream1);
                                                                                OutStream1.WriteText(field.InnerText);
                                                                                Data."File Base64 Content".CreateInStream(InStream1);
                                                                            end;
                                                                        'FileEncryption':
                                                                            Data."File Encryption" := field.InnerText;
                                                                        'FileSize':
                                                                            Evaluate(Data."File Size", field.InnerText, 9);
                                                                    end;
                                                                end;
                                                    end;
                                            'DocumentUID':
                                                Data."Document UID" := field.InnerText;

                                        end;
                                    end;
                            // *** DocumentSumGroup ***
                            if field.Name = 'DocumentSumGroup' then
                                foreach fieldnode in field.GetChildNodes() do
                                    if fieldnode.IsXmlElement() then begin
                                        field := fieldnode.AsXmlElement();
                                        case field.Name of
                                            'Balance':
                                                foreach fieldnode in field.GetChildNodes() do
                                                    if fieldnode.IsXmlElement() then begin
                                                        field := fieldnode.AsXmlElement();
                                                        case field.Name of
                                                            'BalanceDate':
                                                                Evaluate(Data."Balance Date", field.InnerText, 9);
                                                            'BalanceBegin':
                                                                Evaluate(Data."Balance Begin", field.InnerText, 9);
                                                        end;
                                                    end;
                                            'DocumentSum':
                                                Evaluate(Data."Document Sum", field.InnerText, 9);
                                            'VAT':
                                                foreach fieldnode in field.GetChildNodes() do
                                                    if fieldnode.IsXmlElement() then begin
                                                        field := fieldnode.AsXmlElement();
                                                        case field.Name of
                                                            'SumBeforeVAT':
                                                                Evaluate(Data."Sum Group Before VAT", field.InnerText, 9);
                                                            'VATRate':
                                                                Evaluate(Data."VAT Sum Group Rate", field.InnerText, 9);
                                                            'VATSum':
                                                                Evaluate(Data."VAT Sum Group Sum", field.InnerText, 9);
                                                            'Currency':
                                                                Data."VAT Sum Group Currency" := field.InnerText;
                                                        end;
                                                    end;
                                            'TotalSum':
                                                Evaluate(Data."Total Sum", field.InnerText, 9);
                                            'Currency':
                                                Data."Sum Group Currency" := field.InnerText;
                                        end;
                                    end;

                            // *** DocumentItem ***
                            if field.Name = 'DocumentItem' then begin
                                foreach itemNode in field.GetChildNodes() do begin
                                    if itemNode.IsXmlElement() then begin
                                        itemElement := itemNode.AsXmlElement();
                                        if itemElement.Name = 'ItemEntry' then begin
                                            ItemData.Init();
                                            if MainData.FindLast() then begin
                                                NextID := MainData.ID;
                                            end else begin
                                                NextID := 1;
                                            end;
                                            Message('NEXTID: %1', NextID);
                                            ItemData.ID := NextID;

                                            if ItemData.FindLast() then begin
                                                NextTEMPKEY := ItemData.TEMPKEY + 1;
                                            end else begin
                                                NextTEMPKEY := 1;
                                            end;
                                            ItemData.TEMPKEY := NextTEMPKEY;

                                            foreach fieldnode in itemElement.GetChildNodes() do
                                                if fieldnode.IsXmlElement() then begin
                                                    field := fieldnode.AsXmlElement();
                                                    case field.Name of
                                                        'ItemDescription':
                                                            //Data."Item Description" := field.InnerText;
                                                            ItemData."Item Description" := field.InnerText;
                                                        'BaseUnit':
                                                            //Data."Base Unit" := field.InnerText;
                                                            ItemData."Base Unit" := field.InnerText;
                                                        'AmountInvoiced':
                                                            //Evaluate(Data."Amount Invoiced", field.InnerText, 9);
                                                            Evaluate(ItemData."Amount Invoiced", field.InnerText, 9);
                                                        'ItemPrice':
                                                            //Evaluate(Data."Item Price", field.InnerText, 9);
                                                            Evaluate(ItemData."Item Price Ordered", field.InnerText, 9);
                                                        'ItemSum':
                                                            //Evaluate(Data."Item Sum", field.InnerText, 9);
                                                            Evaluate(ItemData."Item Sum", field.InnerText, 9);
                                                        'VAT':
                                                            foreach fieldnode in field.GetChildNodes() do
                                                                if fieldnode.IsXmlElement() then begin
                                                                    field := fieldnode.AsXmlElement();
                                                                    case field.Name of
                                                                        'SumBeforeVAT':
                                                                            // Evaluate(Data."Sum Before VAT", field.InnerText, 9);
                                                                            Evaluate(ItemData."Sum Before VAT", field.InnerText, 9);
                                                                        'VATRate':
                                                                            //Evaluate(Data."VAT Rate", field.InnerText, 9);
                                                                            Evaluate(ItemData."VAT Rate", field.InnerText, 9);
                                                                        'VATSum':
                                                                            //Evaluate(Data."VAT Sum", field.InnerText, 9);
                                                                            Evaluate(ItemData."VAT Sum", field.InnerText, 9);
                                                                    end;
                                                                end;
                                                        'ItemTotal':
                                                            //Evaluate(Data."Item Total", field.InnerText, 9);
                                                            Evaluate(ItemData."Item Total", field.InnerText, 9);
                                                    end;
                                                end;
                                            ItemData.Insert()
                                        end;
                                    end;
                                end;
                            end;



                            // *** PaymentInfo ***
                            if field.Name = 'PaymentInfo' then
                                foreach fieldnode in field.GetChildNodes() do begin
                                    if fieldnode.IsXmlElement() then begin
                                        field := fieldnode.AsXmlElement();
                                        case field.Name of
                                            'Currency':
                                                Data.Currency := field.InnerText;
                                            'PaymentDescription':
                                                Data."Payment Description" := field.InnerText;
                                            'Payable':
                                                Data.Payable := field.InnerText;
                                            'PayDueDate':
                                                Evaluate(Data."Pay Due Date", field.InnerText, 9);
                                            'PaymentTotalSum':
                                                Evaluate(Data."Payment Total Sum", field.InnerText, 9);
                                            'PayerName':
                                                Data."Payer Name" := field.InnerText;
                                            'PaymentID':
                                                Data."Payment ID" := field.InnerText;
                                            'PayToAccount':
                                                Data."Pay To Account" := field.InnerText;
                                            'PayToName':
                                                Data."Pay To Name" := field.InnerText;
                                        end;
                                    end;
                                end;
                        end;
                    end;
                    Data.Modify(true);
                end;
            end;
    end;
}