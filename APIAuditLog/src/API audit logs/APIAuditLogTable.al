table 80050 "API Audit Log"
{
    Caption = 'API Audit Log';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Date"; DateTime)
        {
            Caption = 'Date and Time';
            DataClassification = SystemMetadata;
        }
        field(3; "Request"; Blob)
        {
            Caption = 'Request';
            DataClassification = ToBeClassified;
        }
        field(4; "RequestURL"; Text[2048])
        {
            Caption = 'Request URL';
            DataClassification = SystemMetadata;
        }
        field(5; "Response"; Blob)
        {
            Caption = 'Response';
            DataClassification = SystemMetadata;
        }
        field(6; "Request Status"; Text[50])
        {
            Caption = 'Request Status';
            DataClassification = SystemMetadata;
        }
        field(7; "Request Status Code"; Integer)
        {
            Caption = 'Request Status Code';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure DownloadRequest()
    var
        Instr: InStream;
        FileName: Text;
    begin
        if not rec.Request.HasValue then
            exit;
        Rec.SetAutoCalcFields(Request);
        Rec.Request.CreateInStream(Instr);
        FileName := 'Entry No. ' + Format(Rec."Entry No.") + '   ' + Format(Rec."Date") + '.json';
        DownloadFromStream(Instr, 'Export Request', '', 'Json Files (*.json)|*.json', FileName);
    end;

    procedure DownloadResponse()
    var
        Instr: InStream;
        FileName: Text;
    begin
        if not rec.Response.HasValue then
            exit;
        Rec.SetAutoCalcFields(Response);
        Rec.Response.CreateInStream(Instr);
        FileName := 'Entry No. ' + Format(Rec."Entry No.") + '   ' + Format(Rec."Date") + '.json';
        DownloadFromStream(Instr, 'Export Response', '', 'Json Files (*.json)|*.json', FileName);
    end;
}
