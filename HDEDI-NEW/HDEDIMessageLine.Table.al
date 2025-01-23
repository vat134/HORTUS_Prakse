Table 80006 "HD EDI Message Line"
{

    fields
    {
        field(1; ID; BigInteger)
        {
            AutoIncrement = true;
        }
        field(2; "Header ID"; BigInteger)
        {
        }
        field(3; "Sellers Price"; Decimal)
        {
        }
        field(46; "Amount Actual"; Decimal)
        {
        }
        field(47; "Sales Line No."; Integer)
        {
        }
        field(48; "Document Type"; Text[10])
        {
        }
        field(49; "Document No."; Text[100])
        {
        }
        field(50; "Line Item Num"; Integer)
        {
        }
        field(51; "Seller Item Code"; Text[80])
        {
        }
        field(52; GTIN; Code[20])
        {
        }
        field(53; "Item Description"; Text[250])
        {
        }
        field(54; "Item Unit"; Text[80])
        {
        }
        field(55; "Base Unit"; Text[80])
        {
        }
        field(56; "Amount Ordered"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(57; "Item Price Ordered"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(58; "Item Base Price Ordered"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(59; "Amount Despatched"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(60; "Amount Accepted"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(61; "Amount Invoiced"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(62; "Item Sum"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(63; "VAT VatID"; Code[6])
        {
        }
        field(64; "Sum Before VAT"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(65; "VAT Rate"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(66; "VAT Sum"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(67; "Item Total"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(68; "Info Name"; Text[70])
        {
        }
        field(69; "Info Content"; Text[250])
        {
        }
        field(70; "External No"; Text[100])
        {
        }
        field(71; "Error message"; Text[250])
        {
        }
        field(72; "Skip this line"; Boolean)
        {
        }
        field(100; "Document Date"; Date)
        {
        }
        field(101; "Order Date"; Date)
        {
        }
        field(102; "Invoice Date"; Date)
        {
        }
        field(103; "Due Date"; Date)
        {
        }
        field(104; "Delivery Date"; Date)
        {
        }
        field(110; "Extra Line"; Boolean)
        {
            Caption = 'Extra Line';
        }
        field(111; "Package Line"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; ID, "Header ID", "Document Type", GTIN, "Line Item Num")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
