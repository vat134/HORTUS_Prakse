Table 80007 "HD EDI Message Header"
{

    fields
    {
        field(1; ID; BigInteger)
        {
            AutoIncrement = TRUE;
        }
        field(2; Direction; Option)
        {
            OptionMembers = "In",Out;
        }
        field(3; "Internal No"; Code[20])
        {
        }
        field(4; "Document Date"; Date)
        {
        }
        field(5; Status; Option)
        {
            OptionMembers = " ",Received,"In processing",Completed,Error;
        }
        field(6; Lines; Integer)
        {
            CalcFormula = count("HD EDI Message Line" where("Document Type" = field("Document Type"),
                                                             "External No" = field("External No")));
            FieldClass = FlowField;
        }
        field(7; "File Name"; Text[250])
        {
        }
        field(8; "Document Type"; Text[10])
        {
        }
        field(9; "External No"; Text[100])
        {
        }
        field(11; "Sender ID"; Text[100])
        {
        }
        field(12; "Receiver ID"; Text[100])
        {
        }
        field(13; "Buyer Party GLN"; Text[30])
        {
        }
        field(14; "Delivery Party GLN"; Text[30])
        {
        }
        field(15; "Seller Party GLN"; Text[30])
        {
        }
        field(16; "Additional Info 1"; Text[250])
        {
        }
        field(17; "Additional Info 2"; Text[250])
        {
        }
        field(18; "Sum Before VAT"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(19; "Total VAT Sum"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(20; "Total Sum"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(21; "Document Sub Type"; Text[80])
        {
        }
        field(22; "Order Date"; Date)
        {
        }
        field(23; "Invoice Date"; Date)
        {
        }
        field(24; "Due Date"; Date)
        {
        }
        field(25; "Document No."; Text[100])
        {
        }
        field(26; "Delivery Date"; Date)
        {
        }
        field(27; "Buyer Party Name"; Text[70])
        {
        }
        field(28; "Buyer Party Reg. No."; Text[15])
        {
        }
        field(29; "Buyer Party VAT Reg. No."; Text[15])
        {
        }
        field(30; "Delivery Party Code"; Text[100])
        {
        }
        field(31; "Delivery Party Name"; Text[70])
        {
        }

        field(32; "Seller Party Code"; Text[100])
        {
        }
        field(33; "Seller Party Name"; Text[70])
        {
        }
        field(34; "Seller Party Reg. No."; Text[15])
        {
        }
        field(35; "Seller Party VAT Reg. No."; Text[15])
        {
        }
        field(36; "Seller Phone Num."; Text[70])
        {
        }
        field(37; "Seller Email Address"; Text[80])
        {
        }
        field(38; "Seller Address"; Text[100])
        {
        }
        field(39; "Seller City"; Text[100])
        {
        }
        field(40; "Seller Postal Code"; Text[10])
        {
        }
        field(41; "Seller County"; Text[70])
        {
        }
        field(42; "Seller Country Code"; Text[2])
        {
        }
        field(43; "Buyer Phone Num."; Text[70])
        {
        }
        field(44; "Buyer Email Address"; Text[80])
        {
        }
        field(45; "Delivery Phone Num."; Text[70])
        {
        }
        field(46; "Delivery Email Address"; Text[50])
        {
        }
        field(47; "Delivery Address"; Text[100])
        {
        }
        field(48; "Delivery City"; Text[100])
        {
        }
        field(49; "Delivery Postal Code"; Text[10])
        {
        }
        field(50; "Delivery County"; Text[70])
        {
        }
        field(51; "Delivery Country Code"; Text[2])
        {
        }
        field(52; Currency; Code[3])
        {
        }
        field(53; "Document Name"; Text[30])
        {
        }
        field(54; AccountNum; Text[35])
        {
        }
        field(55; Iban; Text[35])
        {
        }
        field(56; BIC; Text[11])
        {
        }
        field(57; BankName; Text[100])
        {
        }
        field(58; "Sales Pers E-mail"; Text[250])
        {
        }
        field(59; "Buyer Party Code"; Text[100])
        {
        }
        field(60; "Buyer Address"; Text[100])
        {
        }
        field(61; "Buyer City"; Text[50])
        {
        }
        field(62; "Buyer Postal Code"; Text[10])
        {
        }
        field(63; "Buyer County"; Text[50])
        {
        }
        field(64; "Buyer Country Code"; Text[2])
        {
        }
        field(65; Completed; Boolean)
        {
        }
        field(100; "Error Message"; Text[250])
        {
        }
        field(101; "Created DateTime"; DateTime)
        {
        }
        field(102; "Document Flow Type"; Code[10])
        {
        }
        field(103; "Released SO"; Boolean)
        {
            Caption = 'Released SO';
        }
        field(104; "File Format"; Code[50])
        {
            Caption = 'File Format';
        }
        field(106; Transporter; Option)
        {
            Caption = 'Transporter';
            OptionMembers = Company,Customer,Vendor;
            OptionCaption = 'Company,Customer,Vendor';
            DataClassification = CustomerContent;
        }
        field(107; "Transporter Vendor Code"; Code[20])
        {
            Caption = 'Transporter Vendor Code';
            DataClassification = CustomerContent;
        }
        field(108; "Driver Code"; Code[20])
        {
            Caption = 'Driver Code';
        }
        field(109; "RV Code"; Code[20])
        {
            Caption = 'RV Code';
        }
        field(110; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
        }

        //-----------------------------------------------------------------------------NEW-----------------------------------------------------------------------------
        field(111; "SenderPeppolID"; Text[100])
        {
            Caption = 'SenderPeppolID';
        }
        field(112; "ReceiverPeppolID"; Text[100])
        {
            Caption = 'ReceiverPeppolID';
        }
        field(113; "SellerPartyPeppolId"; Text[100])
        {
            Caption = 'PartyPeppolId';
        }
        field(114; "BuyerPartyPeppolId"; Text[100])
        {
            Caption = 'BuyerPartyPeppolId';
        }
        field(115; "File Base64 Content"; Blob)
        {
            Caption = 'File Base64 Content';
        }
        field(116; "File Encryption"; Text[10])
        {
            Caption = 'File Encryption';
        }
        field(117; "File Size"; Integer)
        {
            Caption = 'File Size';
        }
        field(118; "Document UID"; Text[100])
        {
            Caption = 'Document UID';
        }
        field(119; "Balance Date"; Date)
        {
            Caption = 'Balance Date';
        }
        field(120; "Balance Begin"; Decimal)
        {
            Caption = 'Balance Begin';
        }
        field(121; "Document Sum"; Decimal)
        {
            Caption = 'Document Sum';
        }
        field(122; "Sum Group Before VAT"; Decimal)
        {
            Caption = 'Sum Group Before VAT';
        }
        field(123; "VAT Sum Group Rate"; Integer)
        {
            Caption = 'VAT Sum Group Rate';
        }
        field(124; "VAT Sum Group Sum"; Decimal)
        {
            Caption = 'VAT Sum Group Sum';
        }
        field(125; "VAT Sum Group Currency"; Text[10])
        {
            Caption = 'VAT Sum Group Currency';
        }
        field(126; "Sum Group Currency"; Text[10])
        {
            Caption = 'Sum Group Currency';
        }
        field(127; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
        }
        field(128; "Base Unit"; Text[10])
        {
            Caption = 'Base Unit';
        }
        field(129; "Amount Invoiced"; Integer)
        {
            Caption = 'Amount Invoiced';
        }
        field(130; "Item Price"; Decimal)
        {
            Caption = 'Item Price';
        }
        field(131; "Item Sum"; Decimal)
        {
            Caption = 'Item Sum';
        }
        field(132; "VAT Rate"; Integer)
        {
            Caption = 'VAT Rate';
        }
        field(133; "VAT Sum"; Decimal)
        {
            Caption = 'VAT Sum';
        }
        field(134; "Item Total"; Decimal)
        {
            Caption = 'Item Total';
        }
        field(135; "Payment Description"; Text[100])
        {
            Caption = 'Payment Description';
        }
        field(136; "Payable"; Text[10])
        {
            Caption = 'Payable';
        }
        field(137; "Pay Due Date"; Date)
        {
            Caption = 'Pay Due Date';
        }
        field(138; "Payment Total Sum"; Decimal)
        {
            Caption = 'Payment Total Sum';
        }
        field(139; "Payer Name"; Text[100])
        {
            Caption = 'Payer Name';
        }
        field(140; "Payment ID"; Text[100])
        {
            Caption = 'Payment ID';
        }
        field(141; "Pay To Account"; Text[100])
        {
            Caption = 'Pay To Account';
        }
        field(142; "Pay To Name"; Text[100])
        {
            Caption = 'Pay To Name';
        }
    }

    keys
    {
        key(Key1; "ID")
        {
            Clustered = true;
        }
        key(Key2; "Document Date")
        {
        }
        key(Key3; "Created DateTime")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick; "ID", "Internal No", "Status")
        {
        }
    }

    trigger OnDelete()
    begin
        EDIMessLines.Reset;
        EDIMessLines.SetRange("Header ID", "ID");
        if EDIMessLines.findset() then
            EDIMessLines.DeleteAll;

        // EDIMessVAT.Reset;
        // EDIMessVAT.SetRange("External No", "External No");
        // EDIMessVAT.DeleteAll;
    end;

    var
        EDIMessLines: Record "HD EDI Message Line";
    // EDIMessVAT: Record UnknownRecord25022422;
}
