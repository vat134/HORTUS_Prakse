/*
codeunit 80000 MyPublisher
{
    [IntegrationEvent(false, false)]
    procedure OnCityChanged(Line: Text[100])
    begin

    end;
}

pageextension 80002 WeatherExt extends WeatherForecastPage
{
    layout
    {
        modify(City)
        {
            trigger OnBeforeValidate();

            var
                Publisher: Codeunit MyPublisher;

            begin
                Publisher.OnCityChanged(Rec.City);
            end;
        }
    }
}

codeunit 80004 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublisher, 'OnCityChanged', '', true, true)]
    local procedure CheckOnCityChanged(line: Text[100])
    begin
        if (StrPos(line, '+') > 0) then begin
            Message('you add + in to City');
        end;
    end;

}*/