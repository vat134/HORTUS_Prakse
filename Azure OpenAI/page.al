page 80000 "Azure OpenAI Chat"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Azure OpenAI Chat';
    UsageCategory = Lists;
    SourceTable = MyTable;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Prompt; Prompt)
                {
                    ApplicationArea = All;
                    Caption = 'Enter Prompt';
                }


            }
            group(Response)
            {
                field("Rich Text Editor"; RichText)
                {
                    Caption = 'AI Response';
                    ExtendedDataType = RichContent;
                    MultiLine = true;
                    Editable = false;
                }
            }
        }

    }

    actions
    {
        area(processing)
        {
            action(SendToAI)
            {
                ApplicationArea = All;
                Caption = 'Send to AI';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    HttpClient: HttpClient;
                    HttpResponse: HttpResponseMessage;
                    HttpContent: HttpContent;
                    JsonBody: Text;
                    Content: Text[100000];
                    Headers: HttpHeaders;
                    JsonObject: JsonObject;
                    JsonToken: JsonToken;
                begin
                    Content := 'Something went wrong';

                    JsonBody := '{' +
                        '"data_sources": [' +
                            '{' +
                                '"type": "azure_search",' +
                                '"parameters": {' +
                                    '"endpoint": "https://hortus-ai-searchservice.search.windows.net/",' +
                                    '"index_name": "hungry-chicken-jrb3m9kxfc",' +
                                    '"authentication": {' +
                                        '"type": "api_key",' +
                                        '"key": "ucKy9MoXqBqcWee668FJGUGwSQvuv769lRGMgqUYrGAzSeCOEyVU"' +
                                    '}' +
                                '}' +
                            '}' +
                        '],' +
                        '"messages": [' +
                            '{' +
                                '"role": "system",' +
                                '"content": "your intelligent helper from HORTUS DIGITAL, specializing in guidance, answering questions, troubleshooting, and providing solutions using our documentation"' +
                            '},' +
                            '{' +
                                '"role": "user",' +
                                '"content": "' + Prompt + '"' +
                            '}' +
                        ']' +
                    '}';

                    HttpContent.WriteFrom(JsonBody);

                    HttpContent.GetHeaders(Headers);
                    Headers.Clear();
                    Headers.Add('Content-Type', 'application/json');
                    Headers.Add('api-key', '1okbmD3zwWJMGX3PbThU8Po0SEGwdXM2W3aPBCDWjdCBl20B3x0XJQQJ99BAACHYHv6XJ3w3AAAAACOGRafn');

                    HttpClient.Post('https://ai-niksveidemanis4674ai845494808596.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview', HttpContent, HttpResponse);

                    if HttpResponse.IsSuccessStatusCode() then begin
                        HttpResponse.Content().ReadAs(Content);
                        JsonObject.ReadFrom(Content);

                        if JsonObject.Get('choices', JsonToken) then begin
                            if JsonToken.AsArray().Get(0, JsonToken) then begin
                                if JsonToken.AsObject().Get('message', JsonToken) then begin
                                    if JsonToken.AsObject().Get('content', JsonToken) then begin
                                        Content := JsonToken.AsValue().AsText();
                                        Rec.SaveRichText(Content);
                                        RichText := Rec.GetRichText();
                                        //Message('Message: %1', Content);
                                    end else
                                        Error('Failed to find content in the response.');
                                end else
                                    Error('Failed to find message in the response.');
                            end else
                                Error('Failed to retrieve the first choice from the response.');
                        end else
                            Error('Failed to retrieve choices from the response.');
                    end else begin
                        Error('HTTP request failed. Status: %1', HttpResponse.HttpStatusCode);
                    end;


                end;
            }
        }

    }

    trigger OnOpenPage()
    var
        MyTableRec: Record 80000;
    begin
        if MyTableRec.FindFirst() then
            exit;

        MyTableRec.Init();
        MyTableRec.Insert();
    end;

    var
        Prompt: Text[250];
        RichText: Text;
}
