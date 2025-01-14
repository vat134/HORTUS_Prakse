controladdin ResponseShow
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 1000;
    RequestedWidth = 800;
    MinimumWidth = 800;
    MaximumWidth = 800;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    StartupScript = 'src\Azure OpenAI\start.js';

    event Ready()

    event getResponse()

    procedure ResponseData(InvData: JsonObject)
}