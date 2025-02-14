page 80010 WeatherForecastCardPart
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = WeatherForecast;
    Caption = 'Latest Weather Update';

    layout
    {
        area(content)
        {
            group(WeatherInfo)
            {
                field("Request Time"; Rec."Request Time")
                {
                    Caption = 'Request Time';
                    ApplicationArea = All;
                }

                field("City"; Rec."City")
                {
                    Caption = 'City';
                    ApplicationArea = All;
                }

                field("Temperature (C)"; Rec."Temperature (C)")
                {
                    Caption = 'Temperature (C)';
                    ApplicationArea = All;
                }

                field("Wind Speed (m/s)"; Rec."Wind Speed (m/s)")
                {
                    Caption = 'Wind Speed (m/s)';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        LastWeather: Record WeatherForecast;
        CurrentTime: DateTime;
        TimeDiff: Duration;
    begin
        if LastWeather.FindLast() then
            Rec := LastWeather;

        CurrentTime := CurrentDateTime();

        if LastWeather.FindLast() then begin
            TimeDiff := CurrentTime - LastWeather."Request Time";
            Message('CurrentTime: %1, LastWeather."Request Time": %2, TimeDiff: %3', CurrentTime, LastWeather."Request Time", (TimeDiff / 1000));
            if (TimeDiff / 1000) > 900 then begin
                UpdateWeather(LastWeather."City");
                if LastWeather.FindLast() then
                    Rec := LastWeather;
            end;
        end
        else
            Message('No weather data available.');
    end;

    local procedure UpdateWeather(City: Text[50])
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        APIKey: Text[50];
        BaseUrl: Text[250];
        FullUrl: Text[500];

        JsonResponse: Text;
        JsonObject: JsonObject;
        MainObject: JsonToken;
        WindObject: JsonToken;
        cod: JsonToken;

        Temperature: JsonToken;
        WindSpeed: JsonToken;
        DateTimeRequest: DateTime;

        WeatherForecastRecord: Record WeatherForecast;
    begin
        APIKey := '90464553dc599d72985ac252fdfc216b';
        BaseUrl := 'https://api.openweathermap.org/data/2.5/weather';
        FullUrl := BaseUrl + '?q=' + City + '&units=metric&appid=' + APIKey;

        if HttpClient.Get(FullUrl, HttpResponseMessage) then begin
            HttpResponseMessage.Content().ReadAs(JsonResponse);
            JsonObject.ReadFrom(JsonResponse);

            JsonObject.Get('cod', cod);
            if (Format(cod) = '200') then begin
                JsonObject.Get('main', MainObject);
                MainObject.AsObject().Get('temp', Temperature);
                JsonObject.Get('wind', WindObject);
                WindObject.AsObject().Get('speed', WindSpeed);
                DateTimeRequest := CurrentDateTime();

                WeatherForecastRecord.Init();
                WeatherForecastRecord."Request Time" := DateTimeRequest;
                WeatherForecastRecord."City" := City;
                WeatherForecastRecord."Temperature (C)" := Format(Temperature);
                WeatherForecastRecord."Wind Speed (m/s)" := Format(WindSpeed);
                WeatherForecastRecord.Insert();
            end else begin
                Message('Failed to fetch weather data for %1', City);
            end;
        end else begin
            Message('Failed to connect to weather API.');
        end;
    end;
}
