page 80019 "Agreement dialog"
{
    PageType = StandardDialog;
    Caption = 'Status inputs';

    layout
    {
        area(Content)
        {
            field("Customer ID"; "Customer ID")
            {
                ApplicationArea = all;
                TableRelation = "Customer";
                trigger OnValidate()
                begin
                    if "Customer ID" = '' then
                        Error('Customer ID cannot be empty.');
                end;
            }
            field("Equipment ID"; "Equipment ID")
            {
                ApplicationArea = all;
                TableRelation = "Equipment" WHERE("Availability Status" = CONST(Available));
            }
            field("Start Date"; "Start Date")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if "Start Date" = 0D then
                        Error('Start Date cannot be empty.');
                    if "Start Date" < Today then
                        Error('Start Date cannot be in the past.');
                end;
            }
            field("End Date"; "End Date")
            {
                ApplicationArea = all;
                trigger OnValidate()
                begin
                    if "End Date" = 0D then
                        Error('End Date cannot be empty.');
                    if ("Start Date" <> 0D) and ("End Date" <= "Start Date") then
                        Error('End Date must be after Start Date.');
                end;
            }
        }
    }

    procedure getCustomerID(): Code[20]
    begin
        exit("Customer ID")
    end;

    procedure getEquipmentID(): Integer
    begin
        exit("Equipment ID")
    end;

    procedure getStartDate(): Date
    begin
        exit("Start Date")
    end;

    procedure getEndDate(): Date
    begin
        exit("End Date")
    end;

    var
        "Customer ID": Code[20];
        "Equipment ID": Integer;
        "Start Date": Date;
        "End Date": Date;
}