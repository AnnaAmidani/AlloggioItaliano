package anna.alit.servicexhtml;

import java.util.Locale;
import java.util.ResourceBundle;

public class TendineXHTML {

  public static String selectlingue(String locale) {

    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));
    String any = "qualsiasi";

    if(rb.getString("opt.qualsiasi") != null)
    {
      any = rb.getString("opt.qualsiasi");
    }

    return "<select class=\"smusso\" id=\"lingue\" name=\"lingue\" title=\"lingua\">"
               +   "<option value=\"qualsiasi\" selected=\"selected\">"+any+"</option>"
               +   "<option value=\"eng\">english</option>"
               +   "<option value=\"fra\">franÃ§ais</option>"
               +   "<option value=\"esp\">espanol</option>"
               +   "<option value=\"por\">portugues</option>"
               +   "<option value=\"deu\">deutsch</option>"
               +   "<option value=\"ned\">nederlands</option>"
               +   "<option value=\"nor\">norsk</option>"
               +   "<option value=\"dan\">dansk</option>"
               +   "<option value=\"sve\">svenska</option>"
               +   "<option value=\"suo\">suomi</option>"
               +   "<option value=\"pol\">polski</option>"
               +   "<option value=\"rom\">roman</option>"
               +   "<option value=\"mag\">magyar</option>"
               +   "<option value=\"cze\">czecky</option>"
               +   "<option value=\"hrv\">hrvatzi</option>"
               +   "<option value=\"slo\">slovenskina</option>"
               +   "<option value=\"rus\">russo</option>"
               +   "<option value=\"jap\">giapponese</option>"
               +   "<option value=\"cin\">cinese</option>"
               + "</select>";
  }

public static String selectlinguadescr(String locale) {

    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));
    String any = "qualsiasi";

    if(rb.getString("opt.qualsiasi") != null)
    {
      any = rb.getString("opt.qualsiasi");
    }

    return  "<option value=\"qualsiasi\" selected=\"selected\">"+any+"</option>"
               +   "<option value=\"ita\">italiano</option>"
               +   "<option value=\"eng\">english</option>"
               +   "<option value=\"fra\">franÃ§ais</option>"
               +   "<option value=\"esp\">espanol</option>"
               +   "<option value=\"por\">portugues</option>"
               +   "<option value=\"deu\">deutsch</option>"
               +   "<option value=\"ned\">nederlands</option>"
               +   "<option value=\"nor\">norsk</option>"
               +   "<option value=\"dan\">dansk</option>"
               +   "<option value=\"sve\">svenska</option>"
               +   "<option value=\"suo\">suomi</option>"
               +   "<option value=\"pol\">polski</option>"
               +   "<option value=\"rom\">roman</option>"
               +   "<option value=\"mag\">magyar</option>"
               +   "<option value=\"cze\">czecky</option>"
               +   "<option value=\"hrv\">hrvatzi</option>"
               +   "<option value=\"slo\">slovenskina</option>"
               +   "<option value=\"rus\">russo</option>"
               +   "<option value=\"jap\">giapponese</option>"
               +   "<option value=\"cin\">cinese</option>";
  }

  public static String selecttipologia(String locale) {

    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));
    String any = "qualsiasi";

    if(rb.getString("opt.qualsiasi") != null)
    {
      any = rb.getString("opt.qualsiasi");
    }

    return "<select class=\"smusso\" id=\"tipologia\" name=\"tipologia\" title=\"tipologia\">"
               +   "<option value=\"qualsiasi\" selected=\"selected\">"+any+"</option>"
               +   "<option value=\"AC\">affittacamere/locanda</option>"
               +   "<option value=\"AT\">agriturismo/countryhouse</option>"
               +   "<option value=\"BB\">bed and breakfast</option>"
               +   "<option value=\"OG\">ostello</option>"
               +   "<option value=\"RA\">rifugio</option>"
               + "</select>";
  }

  public static String selectpagamento(String locale) {
    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));
    String any = "qualsiasi";

    if(rb.getString("opt.qualsiasi") != null)
    {
      any = rb.getString("opt.qualsiasi");
    }
    return "<select class=\"smusso\" id=\"pagamento\" name=\"pagamento\" title=\"pagamento\">"
              +   "<option value=\"qualsiasi\" selected=\"selected\">"+any+"</option>"
              +   "<option value=\"contanti\">contanti</option>"
              +   "<option value=\"assegno\">assegno</option>"
              +   "<option value=\"bonifico\">bonifico</option>"
              +   "<option value=\"cartadicredito\">carta di credito</option>"
              +   "<option value=\"vaglia\">vaglia</option>"
              +   "<option value=\"bancomat\">bancomat</option>"
              +   "<option value=\"paypal\">paypal</option>"
              +   "<option value=\"postepay\">poste pay</option>"
            + "</select>";
  }

  public static String optionlistregioni(String locale) {
    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));
    String region = "regione";

    if(rb.getString("opt.regione") != null)
    {
      region = rb.getString("opt.regione");
    }    return  "<option value=\"regione\">"+region+"</option>"
        +   "<option value=\"Abruzzo\">Abruzzo</option>"
        +   "<option value=\"Basilicata\">Basilicata</option>"
        +   "<option value=\"Calabria\">Calabria</option>"
        +   "<option value=\"Campania\">Campania</option>"
        +   "<option value=\"Emilia Romagna\">Emilia Romagna</option>"
        +   "<option value=\"Friuli Venezia Giulia\">Friuli Venezia Giulia</option>"
        +   "<option value=\"Lazio\">Lazio</option>"
        +   "<option value=\"Liguria\">Liguria</option>"
        +   "<option value=\"Lombardia\">Lombardia</option>"
        +   "<option value=\"Marche\">Marche</option>"
        +   "<option value=\"Molise\">Molise</option>"
        +   "<option value=\"Piemonte\">Piemonte</option>"
        +   "<option value=\"Puglia\">Puglia</option>"
        +   "<option value=\"Sardegna\">Sardegna</option>"
        +   "<option value=\"Sicilia\">Sicilia</option>"
        +   "<option value=\"Toscana\">Toscana</option>"
        +   "<option value=\"Trentino Alto Adige\">Trentino Alto Adige</option>"
        +   "<option value=\"Umbria\">Umbria</option>"
        +   "<option value=\"Valle d`Aosta\">Valle d`Aosta</option>"
        +   "<option value=\"Veneto\">Veneto</option>";

  }

  public static String optionlistindirizzo() {
    return "<option value=\"borgata\">borgata</option>"
        +   "<option value=\"borgo\">borgo</option>"
        +   "<option value=\"campiello\">campiello</option>"
        +   "<option value=\"cascina\">cascina</option>"
        +   "<option value=\"cascinali\">cascinali</option>"
        +   "<option value=\"colle\">colle</option>"
        +   "<option value=\"contrà\">contr&agrave;</option>"
        +   "<option value=\"contrada\">contrada</option>"
        +   "<option value=\"frazione\">frazione</option>"
        +   "<option value=\"isola\">isola</option>"
        +   "<option value=\"località\">localit&agrave;</option>"
        +   "<option value=\"lottizzazione\">lottizzazione</option>"
        +   "<option value=\"lotto\">lotto</option>"
        +   "<option value=\"masseria\">masseria</option>"
        +   "<option value=\"nucleo\">nucleo</option>"
        +   "<option value=\"piana\">piana</option>"
        +   "<option value=\"piano\">piano</option>"
        +   "<option value=\"podere\">podere</option>"
        +   "<option value=\"quartiere\">quartiere</option>"
        +   "<option value=\"regione\">regione</option>"
        +   "<option value=\"rione\">rione</option>"
        +   "<option value=\"roata\">roata</option>"
        +   "<option value=\"ruata\">ruata</option>"
        +   "<option value=\"tetti\">tetti</option>"
        +   "<option value=\"tetto\">tetto</option>"
        +   "<option value=\"torre\">torre</option>"
        +   "<option value=\"sacca\">sacca</option>"
        +   "<option value=\"serro\">serro</option>"
        +   "<option value=\"sestiere\">sestiere</option>"
        +   "<option value=\"villa\">villa</option>"
        +   "<option value=\"villaggio\">villaggio</option>"
        +   "<option value=\"vocabolo\">vocabolo</option>";
  }

  public static String optionlistzona() {
    return "<option value=\"accesso\">accesso</option>"
        +   "<option value=\"alto\">alto</option>"
        +   "<option value=\"alzaia\">alzaia</option>"
        +   "<option value=\"androna\">androna</option>"
        +   "<option value=\"angiporto\">angiporto</option>"
        +   "<option value=\"archivolto\">archivolto</option>"
        +   "<option value=\"arco\">arco</option>"
        +   "<option value=\"argine\">argine</option>"
        +   "<option value=\"baglio\">baglio</option>"
        +   "<option value=\"baluardo\">baluardo</option>"
        +   "<option value=\"banchina\">banchina</option>"
        +   "<option value=\"barbaria\">barbaria</option>"
        +   "<option value=\"bastione\">bastione</option>"
        +   "<option value=\"bastioni\">bastioni</option>"
        +   "<option value=\"belvedere\">belvedere</option>"
        +   "<option value=\"borgo\">borgo</option>"
        +   "<option value=\"borgoloco\">borgoloco</option>"
        +   "<option value=\"breccia\">breccia</option>"
        +   "<option value=\"ca`\">ca`</option>"
        +   "<option value=\"calata\">calata</option>"
        +   "<option value=\"calle\">calle</option>"
        +   "<option value=\"calle larga\">calle larga</option>"
        +   "<option value=\"callesella\">callesella</option>"
        +   "<option value=\"campasso\">campasso</option>"
        +   "<option value=\"campiello\">campiello</option>"
        +   "<option value=\"campo\">campo</option>"
        +   "<option value=\"capo\">capo</option>"
        +   "<option value=\"cavalcavia\">cavalcavia</option>"
        +   "<option value=\"cavone\">cavone</option>"
        +   "<option value=\"chiasso\">chiasso</option>"
        +   "<option value=\"circolare\">circolare</option>"
        +   "<option value=\"circonvallazione\">circonvallazione</option>"
        +   "<option value=\"clivo\">clivo</option>"
        +   "<option value=\"complanare\">complanare</option>"
        +   "<option value=\"contrà\">contr&agrave;</option>"
        +   "<option value=\"contrada\">contrada</option>"
        +   "<option value=\"corsetto\">corsetto</option>"
        +   "<option value=\"corso\">corso</option>"
        +   "<option value=\"corte\">corte</option>"
        +   "<option value=\"corticella\">corticella</option>"
        +   "<option value=\"cortile\">cortile</option>"
        +   "<option value=\"costa\">costa</option>"
        +   "<option value=\"crosa\">crosa</option>"
        +   "<option value=\"crosino\">crosino</option>"
        +   "<option value=\"cupa\">cupa</option>"
        +   "<option value=\"diramazione\">diramazione</option>"
        +   "<option value=\"discesa\">discesa</option>"
        +   "<option value=\"distacco\">distacco</option>"
        +   "<option value=\"emiciclo\">emiciclo</option>"
        +   "<option value=\"erta\">erta</option>"
        +   "<option value=\"fondaco\">fondaco</option>"
        +   "<option value=\"fondamenta\">fondamenta</option>"
        +   "<option value=\"fondo\">fondo</option>"
        +   "<option value=\"fontego\">fontego</option>"
        +   "<option value=\"foro\">foro</option>"
        +   "<option value=\"forte\">forte</option>"
        +   "<option value=\"fossato\">fossato</option>"
        +   "<option value=\"frazione\">frazione</option>"
        +   "<option value=\"galleria\">galleria</option>"
        +   "<option value=\"giardini\">giardini</option>"
        +   "<option value=\"giardino\">giardino</option>"
        +   "<option value=\"gradinata\">gradinata</option>"
        +   "<option value=\"gradoni\">gradoni</option>"
        +   "<option value=\"interrato\">interrato</option>"
        +   "<option value=\"isolato\">isolato</option>"
        +   "<option value=\"larghetto\">larghetto</option>"
        +   "<option value=\"largo\">largo</option>"
        +   "<option value=\"litoranea\">litoranea</option>"
        +   "<option value=\"località\">localit&agrave;</option>"
        +   "<option value=\"lungadige\">lungadige</option>"
        +   "<option value=\"lungargine\">lungargine</option>"
        +   "<option value=\"lungarno\">lungarno</option>"
        +   "<option value=\"lungo\">lungo</option>"
        +   "<option value=\"lungo dora\">lungo dora</option>"
        +   "<option value=\"lungo po\">lungo po</option>"
        +   "<option value=\"lungo stura\">lungo stura</option>"
        +   "<option value=\"lungolago\">lungolago</option>"
        +   "<option value=\"lungomare\">lungomare</option>"
        +   "<option value=\"lungotevere\">lungotevere</option>"
        +   "<option value=\"marzaria\">marzaria</option>"
        +   "<option value=\"molo\">molo</option>"
        +   "<option value=\"mulattiera\">mulattiera</option>"
        +   "<option value=\"mura\">mura</option>"
        +   "<option value=\"paludo\">paludo</option>"
        +   "<option value=\"parallela\">parallela</option>"
        +   "<option value=\"parco\">parco</option>"
        +   "<option value=\"passaggio\">passaggio</option>"
        +   "<option value=\"passeggiata\">passeggiata</option>"
        +   "<option value=\"passeggio\">passeggio</option>"
        +   "<option value=\"passo\">passo</option>"
        +   "<option value=\"pedamentina\">pedamentina</option>"
        +   "<option value=\"pendice\">pendice</option>"
        +   "<option value=\"pendio\">pendio</option>"
        +   "<option value=\"penninata\">penninata</option>"
        +   "<option value=\"piaggia\">piaggia</option>"
        +   "<option value=\"piattaforma\">piattaforma</option>"
        +   "<option value=\"piazza\">piazza</option>"
        +   "<option value=\"piazzale\">piazzale</option>"
        +   "<option value=\"piazzetta\">piazzetta</option>"
        +   "<option value=\"piazzola\">piazzola</option>"
        +   "<option value=\"piscina\">piscina</option>"
        +   "<option value=\"ponte\">ponte</option>"
        +   "<option value=\"pontile\">pontile</option>"
        +   "<option value=\"porta\">porta</option>"
        +   "<option value=\"portici\">portici</option>"
        +   "<option value=\"portico\">portico</option>"
        +   "<option value=\"prato\">prato</option>"
        +   "<option value=\"raccordo\">raccordo</option>"
        +   "<option value=\"ramo\">ramo</option>"
        +   "<option value=\"rampa\">rampa</option>"
        +   "<option value=\"rampe\">rampe</option>"
        +   "<option value=\"ratto\">ratto</option>"
        +   "<option value=\"regaste\">regaste</option>"
        +   "<option value=\"rio\">rio</option>"
        +   "<option value=\"rio terà\">rio ter&agrave;</option>"
        +   "<option value=\"rione\">rione</option>"
        +   "<option value=\"ripa\">ripa</option>"
        +   "<option value=\"riva\">riva</option>"
        +   "<option value=\"riviera\">riviera</option>"
        +   "<option value=\"\">ronco</option>"
        +   "<option value=\"ronco\">rotonda</option>"
        +   "<option value=\"rua\">rua</option>"
        +   "<option value=\"ruga\">ruga</option>"
        +   "<option value=\"ruga vecchia\">ruga vecchia</option>"
        +   "<option value=\"rughetta\">rughetta</option>"
        +   "<option value=\"salita\">salita</option>"
        +   "<option value=\"salita nuova\">salita nuova</option>"
        +   "<option value=\"salita vecchia\">salita vecchia</option>"
        +   "<option value=\"salizada\">salizada</option>"
        +   "<option value=\"scala\">scala</option>"
        +   "<option value=\"scale\">scale</option>"
        +   "<option value=\"scaletta\">scaletta</option>"
        +   "<option value=\"scalette\">scalette</option>"
        +   "<option value=\"scali\">scali</option>"
        +   "<option value=\"scalinata\">scalinata</option>"
        +   "<option value=\"scalo\">scalo</option>"
        +   "<option value=\"scalone\">scalone</option>"
        +   "<option value=\"sdrucciolo\">sdrucciolo</option>"
        +   "<option value=\"selciato\">selciato</option>"
        +   "<option value=\"sentiero\">sentiero</option>"
        +   "<option value=\"sotto le mura\">sotto le mura</option>"
        +   "<option value=\"sottopasso\">sottopasso</option>"
        +   "<option value=\"sottoportico\">sottoportico</option>"
        +   "<option value=\"sottovia\">sottovia</option>"
        +   "<option value=\"spalto\">spalto</option>"
        +   "<option value=\"spianata\">spianata</option>"
        +   "<option value=\"strada\">strada</option>"
        +   "<option value=\"strada antica\">strada antica</option>"
        +   "<option value=\"strada arginale\">strada arginale</option>"
        +   "<option value=\"strada comunale\">strada comunale</option>"
        +   "<option value=\"strada nuova\">strada nuova</option>"
        +   "<option value=\"strada privata\">strada privata</option>"
        +   "<option value=\"strada provinciale\">strada provinciale</option>"
        +   "<option value=\"strada rurale\">strada rurale</option>"
        +   "<option value=\"strada statale\">strada statale</option>"
        +   "<option value=\"strada vecchia\">strada vecchia</option>"
        +   "<option value=\"stradale\">stradale</option>"
        +   "<option value=\"stradella\">stradella</option>"
        +   "<option value=\"stradone\">stradone</option>"
        +   "<option value=\"strettoia\">strettoia</option>"
        +   "<option value=\"supportico\">supportico</option>"
        +   "<option value=\"tondo\">tondo</option>"
        +   "<option value=\"trasversale\">trasversale</option>"
        +   "<option value=\"traversa\">traversa</option>"
        +   "<option value=\"tresanda\">tresanda</option>"
        +   "<option value=\"tronco\">tronco</option>"
        +   "<option value=\"vallone\">vallone</option>"
        +   "<option value=\"via\">via</option>"
        +   "<option value=\"via chiusa\">via chiusa</option>"
        +   "<option value=\"via ciec\">via cieca</option>"
        +   "<option value=\"via inferiore\">via inferiore</option>"
        +   "<option value=\"via maggiore\">via maggiore</option>"
        +   "<option value=\"via militare\">via militare</option>"
        +   "<option value=\"via nuova\">via nuova</option>"
        +   "<option value=\"via piccola\">via piccola</option>"
        +   "<option value=\"via privata\">via privata</option>"
        +   "<option value=\"via romana\">via romana</option>"
        +   "<option value=\"via superiore\">via superiore</option>"
        +   "<option value=\"via vecchia\">via vecchia</option>"
        +   "<option value=\"via vicinale\">via vicinale</option>"
        +   "<option value=\"viale\">viale</option>"
        +   "<option value=\"viale privato\">viale privato</option>"
        +   "<option value=\"vialetto\">vialetto</option>"
        +   "<option value=\"vicinale\">vicinale</option>"
        +   "<option value=\"vico\">vico</option>"
        +   "<option value=\"vico chiuso\">vico chiuso</option>"
        +   "<option value=\"vico lungo\">vico lungo</option>"
        +   "<option value=\"vico rotto\">vico rotto</option>"
        +   "<option value=\"vico storto\">vico storto</option>"
        +   "<option value=\"vico stretto\">vico stretto</option>"
        +   "<option value=\"vico vecchio\">vico vecchio</option>"
        +   "<option value=\"vicoletto\">vicoletto</option>"
        +   "<option value=\"vicoletto cieco\">vicoletto cieco</option>"
        +   "<option value=\"vicolo\">vicolo</option>"
        +   "<option value=\"vicolo cieco\">vicolo cieco</option>"
        +   "<option value=\"vicolo dritto\">vicolo dritto</option>"
        +   "<option value=\"vicolo stretto\">vicolo stretto</option>"
        +   "<option value=\"viottola\">viottola</option>"
        +   "<option value=\"viottolo\">viottolo</option>"
        +   "<option value=\"viuzza\">viuzza</option>"
        +   "<option value=\"\">viuzzo</option>"
        +   "<option value=\"volta\">volta</option>"
        +   "<option value=\"volto\">volto</option>"
        +   "<option value=\"voltone\">voltone</option>";
  }

}
