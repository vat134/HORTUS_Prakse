codeunit 80050 "API Audit Logger"
{
    procedure LogAPIRequestResponse(RequestStream: InStream; RequestURLData: Text; ResponseStream: InStream; RequestStatus: Text; StatusCode: Integer)
    var
        LogRec: Record "API Audit Log";
        RequestInStream, ResponseInStream : InStream;
        OutStr: OutStream;
    begin
        LogRec.Init();
        LogRec."Date" := CurrentDateTime;
        LogRec."RequestURL" := RequestURLData;
        LogRec."Request Status" := RequestStatus;
        LogRec."Request Status Code" := StatusCode;
        LogRec.Insert(true);

        Clear(OutStr);
        LogRec.Request.CreateOutStream(OutStr);
        CopyStream(OutStr, RequestStream);
        LogRec.Modify();

        Clear(OutStr);
        LogRec.Response.CreateOutStream(OutStr);
        CopyStream(OutStr, ResponseStream);
        LogRec.Modify();
    end;
}