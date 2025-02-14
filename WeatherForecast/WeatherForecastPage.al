page 80009 WeatherForecastPage
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = WeatherForecast;
    Caption = 'Weather Forecast';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }

                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = All;
                }

                field("City"; Rec."City")
                {
                    ApplicationArea = All;
                }

                field("Temperature (C)"; Rec."Temperature (C)")
                {
                    ApplicationArea = All;
                }

                field("Wind Speed (m/s)"; Rec."Wind Speed (m/s)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CheckTheWeather)
            {
                Caption = 'Check the weather';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
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
                    WeatherDialogPage: Page "Weather dialog";
                    City: Text[100];


                begin
                    if WeatherDialogPage.RunModal() = Action::OK then begin
                        City := WeatherDialogPage.getCity();
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
                                Message('Temperature: ' + Format(Temperature) + '°C' + ' | Wind Speed: ' + Format(WindSpeed) + ' m/s');
                            end else begin
                                Message('Wrong city name');
                            end;
                        end else begin
                            Message('Failed to get weather data');
                        end;
                    end;
                end;
            }
        }
    }
}