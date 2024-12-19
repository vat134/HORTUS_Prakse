page 80008 "Gemini dialogue"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group("User Input")
            {
                field("Input Text"; InputText)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter text here.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send")
            {
                Caption = 'Send';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ResponseText: Text[10000];
                begin
                    if InputText = '' then
                        Message('Please enter some text.')
                    else
                        ResponseText := MakeGeminiRequest(InputText);
                    Message(ResponseText);
                end;
            }
        }
    }

    local procedure MakeGeminiRequest(UserInput: Text[1000]): Text[10000]
    var
        HttpClient: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        JsonObject: JsonObject;
        JsonRequest: Text;
        JsonResponse: Text;
        APIUrl: Text;
        RequestBody: Text;
        RequestContent: HttpContent;
        ResponseText: Text;
        JsonToken: JsonToken;
        Headers: HttpHeaders;
        GeminiSettings: Record "Gemini Settings";

        APIAuditLogger: Codeunit "API Audit Logger";
        RequestStatus: Text[50];
        Status: Text[50];
        RequestInStream, ResponseInStream : InStream;
        MainSource: Text;
        Promt: Text;
    begin
        ResponseText := 'Something went wrong';
        Status := 'Unsuccessful';

        MainSource := 'Algu aprēķinsInga Ceļmillere15.01.2024.Autortiesības © 2011 HORTUS Digital, SIA. Visas tiesības rezervētas. Šis dokuments irkonfidenciāls un to atļauts lietot tikai klienta uzņēmuma ietvaros. Bez autora atļaujas dokumentuvai tā saturošo informāciju aizliegts nodot jebkurai citai organizācijai, pavairot vai publicētjebkurā drukātā vai elektroniskā formā kopumā vai daļēji.Hortus Digital SIAClick here to enter text.SatursUzstādījumi ....................................................................................................................................... 3Algas komponentes ........................................................................................................................... 7Darbinieki ......................................................................................................................................... 9Darba līgumi un pieņemšana darbā................................................................................................. 15Darbinieku prombūtnes (kavējumu) reģistrācija ............................................................................ 21Darba laika uzskaite ........................................................................................................................ 22Algu aprēķināšana ........................................................................................................................... 23Algas aprēķina dokumenta karte ..................................................................................................... 24Algu grāmatošana ........................................................................................................................... 26EDS uzstādījumi ............................................................................................................................. 27Algu aprēķins2Hortus Digital SIAUzstādījumiAlgu iestatījumi.Meklētājā jāraksta- Algas uzstādījumi vai arī jāizvēlās galvenajā logā Algu uzstādījumos.Visp.infoAktivizē Integrācija ar personālu vadības moduli.Izveido Bāzes darba grafiku, pievieno uzstādījumosAlgu aprēķins3Hortus Digital SIASadaļā Uzstādījumi -> Aizpilda darba grafika rindas pa dienām: pirmdiena-1 8 sundas; otrdiena-28stundas,utt.sestdiena-svētdiena-0st.Algu aprēķins4Hortus Digital SIAIzveido pamatkalendāru:1. Aizpilda pamatkalendārā brīvdienas2. Aizpilda svētku dienas un pārceltās dienas(Nepieciešams, lai pirmssvētku dienās pie darba laika tabeles veidošanas uzģenerētos 7 stundu darbadiena.)Atrodoties Pamatkalendāra skata tabulā, sadaļā DARBĪBAS lieto funkciju Uzturēt pamatkalendāraizmaiņasAlgu aprēķins5Hortus Digital SIAAtzīmē svētku dienas un pārceltajās darba dienās norāda, kāda nedēļas diena ir pārceltaPeriodiskuma sistēma:•••Tukšums-svētki, kas katru gadu ir citā datumā. Piem: Lieldienas.Gada periods-svētki ir katru gadu vienā un tajā pašā datumā.Nedēļas periods-brīvdienas, kas atkārtojas nedēļas robežās. Piem.sestdiena, svētdiena.Aizpilda pārējos nepieciešamos laukusAlgu aprēķins6Hortus Digital SIANumerācijaPievieno izveidotās num.sērijas (izveidošanu skat. instrukcijā „Numuru sēriju izveidošana”)! Sērijas numuri algas buferim un apr.dokumentam var būt viens un tas pats, vai dažādi.Pēc noklusējumaNorāda bankas kontu, no kura tiks veiktas Algas izmaksasAlgas komponentesAlgas -> Uzstādījumi -> Algu komponentu saraksts vai arī raksta meklētājā.Izveido algas komponentes (piemēram:101-Alga- mēnešalga proporc.dienām, 102-Alga-stundu likme,utt. )Algu aprēķins7Hortus Digital SIASadaļā Karte aizpilda obligātos laukus, sadaļās vērtības un kontējuma grupas pievienonepieciešamās.Piezīme! Dažādām komponentēm tie būs atšķirīgi.Visp.infoAprēķinsAlgu aprēķins8Hortus Digital SIAGrāmatošanaDarbiniekiDarbinieka kartes izveidošana.Pavisam ir trīs darbinieku kartes.1- Darbinieki; izmanto lai aizpildītu pamatdatus par darbinieku;2- Darbinieki -> Darbinieks -> Darbinieka personāla karte; pieejama informācija paratvaļinājumu periodiem un izmantoto/neizmantoto atvaļinājumu;Algu aprēķins9Hortus Digital SIA3- Darbinieki -> Darbinieks -> Darbinieka algas karte; papildina pamatdatus pievienojotinformāciju:Algas aprēķinam nepieciešams aizpildīt Darbinieka algas karte:Tab.Visp.info – Aizpilda: Nr., vārds, uzvārds, personas kods, dzimums, statuss, deklarētā dzīves vieta,pases dati(nepieciešamie), pārējā informācija pēc nepieciešamībasTab.Sakari – aizpilda nepieciešamos.Algu aprēķins10Hortus Digital SIATab.Darba datiPiezīme! Lai varētu reģistrēt rīkojumu par pieņemšanu darbinieka statusam jābūt Neaktīvs- tasnomainīsies uz Aktīvs pēc rīkojuma par pieņemšanu reģistrēšanas, un uz Izbeigts pēc rīkojuma paratbrīvošanu reģistrēšanas.Tab.Alga – Aizpilda visus nepieciešamos laukus.Algu aprēķins11Hortus Digital SIAPiezīme! Laukā-Algu aprēķina veidnes kods- norāda viedni, pēc kura tiks aprēķināta alga konkrētajamdarbiniekam. Laukā- Algas kontējuma grupas kods- tiek piesaistīta kontējumu grupa, pēc kuras tiksveikti aprēķinātās algas grāmatojumi virsgrāmatā.Tab.CitsAizpilda Atvaļinājuma kategorijas kods: piesaista katram darbiniekam atkarībā no tā ir vai navpapilddienas. Ieliek atzīmi , ja Ir parakstīšanas tiesības, pārējā informācija pēc nepieciešamības.Algu aprēķins12Hortus Digital SIASadaļā Darbības:Izvēlas funkciju Algas komponentesAizpilda rindas ar nepieciešamajām algas komponentēmAprēķinātās algas komponentei (komp.101 vai 102) ieliek atzīmi, ka šo komponenti izmantos darbalaika reģistrācijai, kā arī, ka šī ir Bāzes komponente.Algu aprēķins13Hortus Digital SIASarakstā Darbinieki > Atskaites ir iespējams ieimportēt neapliekamos minimumus un apgādājamoskā arī nosūtīt atskaiti Ziņas par darba ņēmējiem uz EDS.Importējot neapliekamo minimumu vai apgādājamos, norāda periodu par kuru importē unkomponentes kodu, ar kuru jaunajai informācijai jāierakstās pie darbinieku komponentēm.EDS uzstādījumiMeklētājā ieraksta EDSAlgu aprēķins14Hortus Digital SIAŠajos uzstādījumos definē sasaisti ar EDS.Katram lietotājam tiek pievienota Api atslēga no EDS , ievadīts EDS lietotājvārds un parole.Darba līgumi un pieņemšana darbāAlgu aprēķins15Hortus Digital SIAPieņemot darbā jaunu darbinieku sākotnēji tiek ievadīts Darbinieks, kur tiek norādīta visanepieciešamā pamatinformācija.Mēklētāja ieraksta Darbinieki =< izvēlas Jauns un savada visu nepieciešamo informāciju.Laukā Statuss – atstāj Neaktīvs, tas nomainīsies uz Aktīvs automātiski, tiklīdz darbinieks tikspieņemts darbā, reģistrējot pieņemšanas rīkojumu.Darba līguma izveidošanaMeklētāja ieraksts Darba līgumu saraksts un atver to. Izvēlas Jauns.Tab.Visp.info – aizpilda visus laukus.Nr. – ievada manuāli vai nospiežot Enter tas ielec automātiski, ja tam ir izveidota Num.Sērija;Līguma Nr. – norāda esošo līguma Nr.(parakstīto);Līguma tipa kods – izvēlamies no filtra;Štata vietas kods un Štata struktūrvienība- var neaizpildīt, ja uzņēmumā netiek plānots darbiniekuskaits uz konkrēto amatu un nav jāveic kontrole pieņemtajiem darbiniekiem pret štata vietām.Amata kods- klasifikatorā jāievada kods no profesiju klasifikatora.Algu aprēķins16Hortus Digital SIATab.Cits – aizpilda gadījumos, kad esošais darbinieks aizvieto kādu citu darbinieku, kurš atrodasprombūtnē uz noteiktu laiku.(šajā gadījumā Sadaļā Visp.info – Līguma tipa kods jānorāda LĪG un jānorāda līguma darbības laiks - no kura līdz kuram datumam.)Kad visi nepieciešamie lauki aizpildīti, darba līgumu reģistrē.Algu aprēķins17Hortus Digital SIAVisus darbiniekam reģistrētos līgumus, kā arī to pielikumus, var apskatīt Darbinieki =>Darbiniekapersonāla karte => Darba līgumiKad izveidots darbinieks un reģistrēts darba līgums, tad jāizveido rīkojums par pieņemšanu darbā–Meklētājā ieraksta Personāla rīkojumu/pavēļu sarakstsIzveido Jauns => Notikumu sarakstā izvēlas Pieņemšana.Atveras Rīkojumu/pavēles karte, aizpilda Tab.Visp.info:Algu aprēķins18Hortus Digital SIANr. – norāda manuāli, vai arī, ja ir izveidota Num.Sērija, nospiežot Enter, tas ielasīsies automātiski;Dokumenta veids: RīkojumsDokumenta Nr.: Ievada rīkojuma Nr., ja uzņēmumā ir kāda iekšējā numerācija;Dokumenta datums: rīkojuma datumsDokumenta reģistra kods: Personāla rīkojumiReģistrācijas datums: datums, kad tiek reģistrēts dokumentsStruktūrvienības kods: izvēlas attiecīgo, ja tāda tiek definēta;Parakstītāja Nr.: izvēlas no saraksta paraksttiesīgo personu, kura ir dokumentu parakstījusi.Tab.Rīkojuma/Pavēles rindasDarbinieka Nr.: No saraksta izvēlas darbiniekuLauki Darbinieka vārds, Uzvārds aizpildās automātiski pēc darbinieka Nr. ievadīšanas.Darba līguma Nr.: izvēlas no saraksta.Sociālo ziņu kods- jāizvēlas no klasifikatora attiecīgais kods;Algas apmērs %-ja darbiniekam tiks izmaksāta visa alga, tad laukā ievada 100, ja tikai puse, tad 50.Slodzes koeficients- ja darbinieks strādā pilnu slodzi, tad laukā jāieliek 1, ja pusslodzi, tad 0,5Pārējie lauki aizpildās automātiski pēc darba līguma Nr.ievadīšanas.Kad viss aizpildīts, dokumentu Reģistrē.Algu aprēķins19Hortus Digital SIAKad dokuments iereģistrēts, darbinieka statuss nomainās no Neaktīvs uz Aktīvs.Ziņas par darba ņēmējiemKad iereģistrēti rīkojumi, var iesniegt ziņas par darba ņēmējiem. Darbinieku sarakstā, sadaļāAtskaites, izvēlas Ziņas par darba ņēmējiem.Norāda atskaites periodu un Soc.ziņu kodus, kas jāziņo.Algu aprēķins20Hortus Digital SIADarbinieku prombūtnes (kavējumu) reģistrācijaPirms darba laika tabeles izveidošanas jāsareģistrē visas prombūtnes (Kavējumu reģistrācija)Pieņemšana darbā, atvaļinājums, bērna kopšanas atvaļinājums, brīvdiena, atbrīvošana, slimības lapasA, B.Kavējumu reģistrācijai izmanto Personāla rīkojumu formas:Personāla rīkojuma/pavēļu saraksts > Funkc. Jauns,izvēlas vajadzīgo notikumu(piemēram ATV- Atvaļinājums),apstiprina ar Labi, programma automātiski piešķirs Nr. (definēts pieuzstādījumiem)Aizpilda laukus –Tab.Visp.infoDokumenta tips: RīkojumsDokumenta Nr.: ieraksta notikuma pirmos 3-4 burtus un rīkojuma Nr.(piemēram: atvaļinājumam:ATV-43)Dokumenta datums: rīkojuma datums/slimības lapas datumsDokumenta reģistra kods: Personāla rīkojumiReģistrācijas datums: datums, kad tiek reģistrēts dokumentsStruktūrvienības kods: izvēlas attiecīgoParakstītāja Nr.: izvēlas no saraksta paraksttiesīgo personu, kura ir dokumentu parakstījusiTab.Rīkojuma/Pavēles rindaAlgu aprēķins21Hortus Digital SIADarbinieka Nr.: No saraksta izvēlas darbiniekuLauki Darbinieka vārds, Uzvārds aizpildās automātiski pēc darbinieka Nr. izvēles!!! Aizpildot rindas par prombūtni (atvaļ.,slim,uc.), obligāti ieliek atzīmi laukā Aizvērt.Piezīme! Lai atceltu iereģistrētu dokumentu, veido jaunu rīkojumu ar tipu- ATCELSANA-obligātijānorāda kurš ieraksts tiek atcelts.Savukārt slimības lapas var importēt no EDS. Vispirms ielogojas EDS un saglabā XML failu, kurupēc tam ieimportē sistēmā.Darba laika uzskaitePēc rīkojumu iereģistrēšanas izveido Darba laika uzskaites tabeli:Algu laika reģistrsSadaļā Darbības izmanto funkciju no darba grafika, filtrā norāda nepieciešamos perioda datumus.Sistēma uzģenerēs nostrādātās dienas ( datumus un stundas) visiem darbiniekiem.Piezīme !!!! Ja nepieciešams pārrēķināt darbinieka laika reģistru, tad palaižot darbību, atzīmē laukuPārrakstīt tos pašus ierakstus.Algu aprēķins22Hortus Digital SIAAlgu aprēķināšanaAlgas periodsIzveido algas aprēķina perioduPiezīme! Ja rīkojumos ir bijusi informācija par atvaļinājumu, kurš ir par pārejošu periodu, t.i. sākasvienā mēnesī un beidzas nākošajā mēnesī, tad nepieciešams izveidot arī nākamā algas aprēķinaperiodu.Piemēram: algas tiks rēķinātas par jūliju, un ir viens darbinieks, kuram atvaļinājums sākas 25.jūlijā unbeidzas 05.augustā, tad, lai sistēma varētu veikt Algu aprēķinu, nepieciešams atvērt gan Jūlija periodu,gan Augusta periodu. Ja būs aizmirsies-sistēma vienalga paprasīs, un neveiks aprēķinu, kamēr nebūs!Algu aprēķins23Hortus Digital SIAAlgas aprēķina dokumenta karteAlgu aprēķina dokumentu sarakstsIzvēlas funkc.Jauns un tad aprēķina veidu, apstiprinot ar Labi.Aizpilda laukus:Tab.Visp.infoNr. – piešķir sistēma, uzsitot EnterPerioda nr. - Izvēlas iepriekš sagatavoto algas periodu (algas aprēķina periodus numurē secīgi,vienmēr būs jāizvēlas pēdējais)Apraksts – ieraksta aprakstu (piem. DA aprēķins, 01.2024)Tips – Izvēlas AprēķinsDatumus - norāda attiecīgā perioda pēdējo datumu (piemēram: 31.01.2024)Grāmatošanas datums: tas pats, kas Dokumenta datumsNo datuma - perioda pirmais datums (piemēram 01.01.2024)Līdz datumam – perioda pēdējais datums (piemēram 31.01.2024)Tab.Kolonnu izkārtojumsKolonnu izkārtojuma kods –VISSTab.BankaBankas konta Nr.- aizpildās no uzstādījumiemTab.Algas aprēķina dokumenta apakšformaSadaļā Darbības:Funkc. Aizpildīt darbinieku sarakstu - Tabula aizpildās ar darbinieku sarakstu, pārbauda, vai ir visidarbinieki, ja nav meklē kļūdu darbinieka kartes uzstādījumos- piem.trūkst darba grafiks;Funkc. AprēķinātKatra darbinieka rindā parādās aprēķinātā informācija par nostrādātajām dienām, stundām, unnopelnīto algu (neto). Lai pārbaudītu aprēķinu: nostājas uz Bilances summa, blakus parādās trīspunktiņu lauks, atver ierakstu, noņem filtrā Iekļaut darbinieku bilancē atzīmi Jā atveras viena darbinieka visi aprēķina ieraksti.Algu aprēķins24Hortus Digital SIAJa visi aprēķini ir korekti -> Darbības , funkc. Reģistrēt1. Veido jaunu, tādu pašu sarakstu algu izmaksāšanai. Pēc aprēķina reģistrācijas atkārto visas1.punktā aprakstītās darbības, ar nelielām izmaiņām:Tab.Visp.infoNr. – piešķir sistēma ar Enter pogu.Perioda nr. - Izvēlas to pašu Perioda Nr., kas bija izmantots aprēķinā;Apraksts – ieraksta aprakstu (piem. DA izmaksa 07.2014)Tips – izvēlas IzmaksaAprēķina šablona kods – izvēlas IZM (piemēram:izmaksa no Swedbank)Aizpilda darbinieku sarakstu, pēc tam veic aprēķinu (iepriekš aprakstītā secībā) - > šoreiz aprēķinarindās parādās tikai izmaksājamo summu informācija!Funkc. Eksportēt uz banku, izveidojas fails gatavs importēšanai bankas sistēmā izmaksai.Pēc eksportēšanas uz banku un izpildes, sarakstu var reģistrēt.!!! Darba algas aprēķina korekcijaJa nepieciešams veikt darba algas aprēķina labojumu/korekciju - vēlreiz jāaizpilda tas pats Algasaprēķina dokuments kā pie parasta aprēķina un apakšformā jāaizpilda sekojoši lauki:Tab.Visp.infoAizpilda visus laukus kā pie aprēķina.Tab.Algas aprēķina dokumenta apakšformaAizpilda sekojošus laukus:Darbinieka Nr. – izvēlas no izvēlnes, to darbinieku par kuru tiek veikts pārrēķins/lbojums;Darbinieka uzvārds – aizpildās automātiksi pēc Darbinieka Nr. ievades;Darbinieka vārds - aizpildās automātiksi pēc Darbinieka Nr. ievades;Labojums – ieliek atzīmi/ķeksīti;Atsauces dokumenta Nr. – izvēlas no izvēlnes, norādot Reģistrētā algu aprēķina kartes Nr., kurujālabo.Algu aprēķins25Hortus Digital SIASadaļā Darbības izmanto funkciju Aprēķināt.Tiks izveidots jauns aprēķins.Sadaļā Darbības izmanto funkciju Reģistrs.Darbinieku grāmatas ierakstos parādīsies korektie ieraksti un labotie ieraksti ar pretējo zīmi.Neiegrāmatotā aprēķinu dokumentā izvēlnē Darbības ir iespēja izdrukāt algu aprēķinu lapiņas.Algu grāmatošanaAlgu buferis uz v/gSadaļa DARBĪBAS -> funkc. AizpildītNorāda perioda Nr., dokumenta Nr., aprēķina tipu un citus filtrus, kas nepieciešami, lai atlasītugrāmatošanai nepieciešamos dokumentus.Kad buferis aizpildīts un pārbaudīts, tad grāmatojumus var pārsūtīt uz V/g žurnālu-funkcija-uz V/gžurnālu.Laukā- Sūtīt uz V/g žurnālu - jānorāda gan veidne, gan sadaļa kurā žurnālā tiks izveidotigrāmatojumi. Pēc tam jāatver norādītais Virsgrāmatas žurnāls un jāiegrāmato aprēķinātās algas.Algu aprēķins26Hortus Digital SIAVID EDS uzstādījumiMeklētājā ieraksta EDSŠajos uzstādījumos definē sasaisti ar EDS.Aizpilda sekojošus laukus:Primārā atslēga – neaizpilda;NAV lietotājs - izvēlas no izvēlnes;Algu aprēķins27Hortus Digital SIAAPI atslēga – no EDS sistēmas (katram lietotājam tā ir sava);Lietotājs – lietotāja vārds, ar kuru ielogojās EDS sistēmā;Parole – ievada EDS paroli ( pēc ievadīšanas, nākošreiz atverrot šo logu, tā nebūs redzama. Tas tā irparedzēts drošības nolūkos!!!)NAV lietotāja vārds – aizpildās automātiski pēc NAV lietotāja ievades.API astlēgu var iegūt EDS sistēmā:AtskaitesDarba laika tabeleTo iespējams atrast:Algu aprēķins28Hortus Digital SIAAlgu laika reģistrs => Atskaites => Algu laika reģistrsVaiBC meklētājā pie pārskatiemAizpilda sekojošus laukus:Gads - norāda par kuru gadu;Mēnesis – norāda attiecīgo mēnesi, par kuru vēlas dokumentu.Algu sarakstsAlgas pārskats Reģ.- Iereģistrēta algu saraksta apskate/drukāšanaTo iespējams atrast:Reģ. Algu dok.saraksts => Reģ. Algas dokuments => Atskaites => Algu sarakstsAlgu aprēķins29Hortus Digital SIAVaiBC meklētājā pie pārskatiem => Algas pārskats Reģ.Aizpilda sekojošus laukus:Nr.- norāda tā aprēķina Nr., kuru vēlas apskatīt/izdrukāt.Darbinieku atvaļinājumiBC meklētājā pie pārskatiem Darbinieku atvaļinājumiAlgu aprēķins30Hortus Digital SIAAizpilda sekojošus laukus:Datums - norāda datumu, uz kuru vēlas redzēt atskaiti;Sociālā nodokļa indekss - norāda 506;Vidējās algas indekss - norādā 1010.!!! Lai filtros saglabātos visi ieraksti un nākošreiz tos nevajadzētu atkārtoti aizpildīt, izņemotdatumu, pēc aizpildīšanas dokuments jāasglabā PDF formātā, nospiežot uz Sūtīt (kam), izvēlotiesPDF dokuments un Labi. Nākošreiz verot vaļā šo logu, filtri būs saglabājušies.Algu aprēķins31,';
        Promt := 'Strictly using the file, answer my question or provide me with information from the document you found on my question, which theoretically can help me do not need to insert a statement in the answer, then do it,';

        if GeminiSettings.FindFirst() then begin
            if GeminiSettings."API Key" = '' then
                Error('Setup is not completed. Please enter API Key.');
            if GeminiSettings."Model Version" = '' then
                Error('Setup is not completed. Please enter model version.');
            APIUrl := StrSubstNo('https://generativelanguage.googleapis.com/v1beta/models/%1:generateContent?key=%2', GeminiSettings."Model Version", GeminiSettings."API Key");
        end
        else
            Error('Setup is not completed. Please configure API settings.');

        RequestBody := StrSubstNo(
            '{' +
            '"contents": [{' +
            '"parts": [{' +
            '"text": "%1 , %2, %3"' +
            '}]}]}',
            MainSource, Promt, UserInput);

        RequestContent.WriteFrom(RequestBody);

        RequestContent.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        HttpRequestMessage.Method := 'POST';
        HttpRequestMessage.SetRequestUri(APIUrl);
        HttpRequestMessage.Content := RequestContent;

        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);

        HttpRequestMessage.Content.ReadAs(RequestInStream);
        HttpResponseMessage.Content.ReadAs(ResponseInStream);

        if HttpResponseMessage.IsSuccessStatusCode() then begin
            HttpResponseMessage.Content().ReadAs(JsonResponse);
            JsonObject.ReadFrom(JsonResponse);

            if JsonObject.Get('candidates', JsonToken) then begin
                if JsonToken.AsArray().Get(0, JsonToken) then begin
                    if JsonToken.AsObject().Get('content', JsonToken) then
                        if JsonToken.AsObject().Get('parts', JsonToken) then
                            if JsonToken.AsArray().Get(0, JsonToken) then
                                if JsonToken.AsObject().Get('text', JsonToken) then begin
                                    ResponseText := JsonToken.AsValue().AsText();
                                    Status := 'Success';
                                end;
                end;
            end else begin
                APIAuditLogger.LogAPIRequestResponse(RequestInStream, APIUrl, ResponseInStream, Status, HttpResponseMessage.HttpStatusCode);
                Error('Failed to retrieve response from Gemini.');
            end;
        end else begin
            APIAuditLogger.LogAPIRequestResponse(RequestInStream, APIUrl, ResponseInStream, Status, HttpResponseMessage.HttpStatusCode);
            Error('HTTP request failed. Status: %1', HttpResponseMessage.HttpStatusCode);
        end;

        APIAuditLogger.LogAPIRequestResponse(RequestInStream, APIUrl, ResponseInStream, Status, HttpResponseMessage.HttpStatusCode);
        exit(ResponseText);
    end;

    var
        InputText: Text[1000];
}
