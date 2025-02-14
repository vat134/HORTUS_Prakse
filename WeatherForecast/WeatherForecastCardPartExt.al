pageextension 80011 BusinessManagerRoleCenterExt extends "Business Manager Role Center"
{
    layout
    {
        addlast(RoleCenter)
        {
            part(WeatherForecast; WeatherForecastCardPart)
            {
                Caption = 'Latest Weather';
                ApplicationArea = All;
            }
        }
    }
}