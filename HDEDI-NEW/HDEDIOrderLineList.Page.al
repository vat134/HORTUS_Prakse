Page 80004 "HD EDI Order Line List"
{
    Caption = 'EDi Order Line List Telema';
    PageType = ListPart;
    SourceTable = "HD EDI Message Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Skip this line"; REC."Skip this line")
                {
                    ApplicationArea = Basic;
                }
                field(ID; REC.ID)
                {
                    visible = false;
                    ApplicationArea = Basic;
                }
                field("Header ID"; REC."Header ID")
                {
                    visible = false;
                    ApplicationArea = Basic;
                }
                field("External No"; REC."External No")
                {
                    visible = false;
                    ApplicationArea = Basic;
                }
                field("Line Item Num"; REC."Line Item Num")
                {
                    visible = false;
                    ApplicationArea = Basic;
                }
                field("Sales Line No."; REC."Sales Line No.")
                {
                    visible = false;
                    // ???
                    ApplicationArea = Basic;
                }
                field("Document Type"; REC."Document Type")
                {
                    visible = false;
                    ApplicationArea = Basic;
                }
                field("Seller Item Code"; REC."Seller Item Code")
                {
                    ApplicationArea = Basic;
                }
                field("Item Description"; REC."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field(GTIN; REC.GTIN)
                {
                    ApplicationArea = Basic;
                }
                field("Item Unit"; REC."Item Unit")
                {
                    ApplicationArea = Basic;
                }
                field("Base Unit"; REC."Base Unit")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Ordered"; REC."Amount Ordered")
                {
                    ApplicationArea = Basic;
                }
                field("Sellers Price"; REC."Sellers Price")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Actual"; REC."Amount Actual")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; REC."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Item Price Ordered"; REC."Item Price Ordered")
                {
                    ApplicationArea = Basic;
                }
                field("Item Base Price Ordered"; REC."Item Base Price Ordered")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Despatched"; REC."Amount Despatched")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Accepted"; REC."Amount Accepted")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Invoiced"; REC."Amount Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field("Item Sum"; REC."Item Sum")
                {
                    ApplicationArea = Basic;
                }
                field("VAT VatID"; REC."VAT VatID")
                {
                    ApplicationArea = Basic;
                }
                field("Sum Before VAT"; REC."Sum Before VAT")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Rate"; REC."VAT Rate")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Sum"; REC."VAT Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Item Total"; REC."Item Total")
                {
                    ApplicationArea = Basic;
                }
                field("Info Name"; REC."Info Name")
                {
                    ApplicationArea = Basic;
                }
                field("Info Content"; REC."Info Content")
                {
                    ApplicationArea = Basic;
                }
                field("Error message"; REC."Error message")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
