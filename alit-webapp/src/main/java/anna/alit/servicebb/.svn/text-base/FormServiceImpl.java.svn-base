package anna.alit.servicebb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import anna.alit.utilities.UtilService;
import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.ParamsMap;

@Service(FormServiceImpl.SERVICE_NAME)
public class FormServiceImpl implements FormService {

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  /*
    *
    */
  public static FormService getInstance() {
    WebApplicationContext applicationContext = ContextLoader
        .getCurrentWebApplicationContext();
    FormService service = (FormService) (applicationContext
        .getBean(FormService.SERVICE_NAME));
    return service;
  }

  /*
    *
    */
  public FormServiceImpl() {
    log().info("");
  }



  /**
   * Numero delle celle della tabella dei prezzi dell'Alloggio
   */
  private final int TAB_COUNT = TitolareService.TAB_COUNT;

  /**
   * Esegue le seguenti azioni: (1) Ottiene il beanLoggato dalla session se
   * presente, lo inizializza vuoto altrimenti (2) Aggiorna/carica i dati nel
   * beanLoggato acquisendoli dalla request se si arriva da una pagina di
   * registrazione o pubblicità. (3) Inserice il beanLoggato (aggiornato) nella
   * session (session.setAttribute("beanLoggato", beanLoggato);) (4) Ritorna il
   * beanLoggato aggiornato.
   *
   * @param request
   *          HttpServletRequest di una pagina di registrazione utente o
   *          pubblicità.
   */
  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.FormService#updateBeanLoggato(javax.servlet.http.
   * HttpServletRequest)
   */
  public HashBean updateBeanLoggato(ParamsMap params) {


    String pagina = (String)params.get("pagina");
    if (pagina == null)
      pagina = "nessuna";

    HashBean beanLoggato = (HashBean) params.get("beanLoggato");
    if (beanLoggato == null)
      beanLoggato = new HashBean();

    if (pagina.equals("Registrazione1.jsp"))
    {
      // datiaziende
      String denominazione = (String)params.get("denominazione");
      denominazione = UtilService.alitRequestFormatter(denominazione);
      beanLoggato.put("denominazione", denominazione);
      beanLoggato.put("annofondazione", (String)params.get("annofondazione"));

      String comune = (String) params.get("comune");
      comune = UtilService.alitRequestFormatter(comune);
      if (params.get("idLoggato") == null)
      {
        beanLoggato.put("regione", (String)params.get("regione"));
        beanLoggato.put("sigla", (String)params.get("sigla"));
        beanLoggato.put("comune", comune);
      }
      else
      {
        beanLoggato.put("regione", (String)params.get("regione"));
        beanLoggato.put("sigla", (String)params.get("sigla"));
        beanLoggato.put("comune", comune);
      }

      String nzona = (String)params.get("nzona");
      String zona = (String)params.get("zona");
      String loco = (String)params.get("loco");
      nzona = UtilService.alitRequestFormatter(nzona);
      zona = UtilService.alitRequestFormatter(zona);
      loco = UtilService.alitRequestFormatter(loco);
      beanLoggato.put("nzona", nzona);
      beanLoggato.put("zona", zona);
      beanLoggato.put("loco", loco);
      String ind = (String)params.get("indirizzo");
      ind = UtilService.alitRequestFormatter(ind);
      beanLoggato.put("indirizzo", ind);
      beanLoggato.put("civico", (String)params.get("civico"));
      beanLoggato.put("cap", (String)params.get("cap"));
      beanLoggato.put("telefono", (String)params.get("telefono"));
      beanLoggato.put("telefono2", (String)params.get("telefono2"));
      beanLoggato.put("cellulare", (String)params.get("cellulare"));
      beanLoggato.put("cellulare2", (String)params.get("cellulare2"));
      beanLoggato.put("fax", (String)params.get("fax"));
      beanLoggato.put("fax2", (String)params.get("fax2"));
      beanLoggato.put("mail", (String)params.get("mail"));
      beanLoggato.put("skype", (String)params.get("skype"));
      beanLoggato.put("web", (String)params.get("web"));
      beanLoggato.put("tipologia", (String)params.get("tipologia"));
      beanLoggato.put("costruzione", (String)params.get("costruzione"));
      beanLoggato.put("posizione", arrayToString((String[])params.gets("posizione")));

      // titolare
      String name = (String)params.get("nome");
      String surname = (String)params.get("cognome");
      name = UtilService.alitRequestFormatter(name);
      surname = UtilService.alitRequestFormatter(surname);
      beanLoggato.put("nome", name);
      beanLoggato.put("cognome", surname);
      beanLoggato.put("mese", (String)params.get("mese"));
      beanLoggato.put("codicefiscale", (String)params.get("codicefiscale"));
      beanLoggato.put("giorno", (String)params.get("giorno"));
      beanLoggato.put("anno", (String)params.get("anno"));

      // caratteristiche
      String aero =  (String)params.get("aeroporti");
      String auto = (String)params.get("autostrade");
      String staz = (String)params.get("stazioni");
      aero = UtilService.alitRequestFormatter(aero);
      auto = UtilService.alitRequestFormatter(auto);
      staz = UtilService.alitRequestFormatter(staz);
      beanLoggato.put("aeroporti", aero);
      beanLoggato.put("autostrade", auto);
      beanLoggato.put("stazioni", staz);
      beanLoggato.put("numcamere", (String)params.get("numcamere"));
      beanLoggato.put("numlettimin", (String)params.get("numlettimin"));
      beanLoggato.put("numlettimax", (String)params.get("numlettimax"));
      beanLoggato.put("numlettitot", (String)params.get("numlettitot"));
      beanLoggato.put("appartamenti", (String)params.get("appartamenti"));
      beanLoggato.put("kmcapoluogo", (String)params.get("kmcapoluogo"));
      beanLoggato.put("kmcasello", (String)params.get("kmcasello"));
      beanLoggato.put("kmaeroporto", (String)params.get("kmaeroporto"));
      beanLoggato.put("kmstazione", (String)params.get("kmstazione"));
      beanLoggato.put("mtmezzipubblici", (String)params.get("mtmezzipubblici"));
      beanLoggato.put("lingue", arrayToString((String[])params.gets("lingue")));
    }
    else if (pagina.equals("Registrazione2.jsp"))
    {
      // caratteristiche scheda registrazione 2
      beanLoggato.put("offerta", (String)params.get("offerta"));
      beanLoggato.put("include", (String)params.get("include"));
      beanLoggato.put("prenotazione", (String)params.get("prenotazione"));
      beanLoggato.put("dal", (String)params.get("dal"));
      beanLoggato.put("al", (String)params.get("al"));
      beanLoggato.put("duratamin", (String)params.get("duratamin"));
      beanLoggato.put("scontodel", (String)params.get("scontodel"));
      beanLoggato.put("camera", arrayToString((String[])params.gets("camera")));
      beanLoggato.put("bagno", arrayToString((String[])params.gets("bagno")));
      beanLoggato.put("tavola", arrayToString((String[])params.gets("tavola")));
      beanLoggato.put("struttura", arrayToString((String[])params.gets("struttura")));
      beanLoggato.put("entrokm", (String)params.get("entrokm"));
      beanLoggato.put("pagamento", arrayToString((String[])params.gets("pagamento")));
    }
    else if (pagina.equals("Registrazione3.jsp"))
    {
      String desc = (String)params.get("descrizione_ita");
      desc = UtilService.alitRequestFormatter(desc);
      // caratteristiche scheda registrazione3
      beanLoggato.put("descrizione_ita", desc);
      beanLoggato.put("descrizione_eng", (String)params.get("descrizione_eng"));
      beanLoggato.put("descrizione_deu", (String)params.get("descrizione_deu"));
      beanLoggato.put("descrizione_fra", (String)params.get("descrizione_fra"));
      beanLoggato.put("latitudine", (String)params.get("latitudine"));
      beanLoggato.put("longitudine", (String)params.get("longitudine"));
      beanLoggato.put("youtube", (String)params.get("youtube"));
      beanLoggato.put("myspace", (String)params.get("myspace"));
      beanLoggato.put("facebook", (String)params.get("facebook"));
      beanLoggato.put("flickr", (String)params.get("flickr"));
    }
    else if (pagina.equals("Registrazione4.jsp"))
    {
      // caratteristiche scheda registrazione4
      String note = (String)params.get("note");
      note = UtilService.alitRequestFormatter(note);
      beanLoggato.put("note", note);

      String[] tabs = (String[])params.gets("tab");

      String[] allMesi = new String[] { "gennaio", "febbraio", "marzo",
          "aprile", "maggio", "giugno", "luglio", "agosto", "settembre",
          "ottobre", "novembre", "dicembre" };

      for (String mese : allMesi)
        beanLoggato.put(mese, (String)params.get(mese));

      beanLoggato.put("tab", splitTabs(tabs));

    }
    else if (pagina.equals("pubblicita.jsp"))
    {
      // caratteristiche scheda pubblicita
      String slo1 =(String)params.get("slogan1");
      String slo2 =(String)params.get("slogan2");
      slo1 = UtilService.alitRequestFormatter(slo1);
      slo2 = UtilService.alitRequestFormatter(slo2);
      beanLoggato.put("slogan1", slo1);
      beanLoggato.put("slogan2", slo2);
      beanLoggato.put("urlslogan1", (String)params.get("urlslogan1"));
      beanLoggato.put("urlslogan2", (String)params.get("urlslogan2"));
    }

    params.put("beanLoggato", beanLoggato);
    return beanLoggato;
  }

  /**
   * Esegue le seguenti azioni:
   * (1) Ottiene il beanLoggato dalla session se presente, lo inizializza vuoto altrimenti
   * (2) Aggiorna/carica i dati nel beanLoggato acquisendoli dalla request
   *     se si arriva da una pagina di registrazione o pubblicità.
   * (3) Inserice il beanLoggato (aggiornato) nella session (session.setAttribute("beanLoggato", beanLoggato);)
   * (4) Ritorna il beanLoggato aggiornato.
   *
   * @param request HttpServletRequest di una pagina di registrazione utente o pubblicità.
   */
  public HashBean updateBeanLoggato(HttpServletRequest request)
  {
    HttpSession session = request.getSession();

    String pagina = request.getParameter("pagina");
    if(pagina == null)
      pagina = "nessuna";

    HashBean beanLoggato = (HashBean) session.getAttribute("beanLoggato");
    if(beanLoggato == null)
      beanLoggato = new HashBean();

    if(pagina.equals("Registrazione1.jsp"))
    {
      String denominazione = request.getParameter("denominazione");
      denominazione = UtilService.alitRequestFormatter(denominazione);
       //datiaziende
      beanLoggato.put("denominazione", denominazione);
      beanLoggato.put("annofondazione", request.getParameter("annofondazione"));

      String comune = request.getParameter("comune");
      comune = UtilService.alitRequestFormatter(comune);
      if(session.getAttribute("idLoggato") == null)
      {
        beanLoggato.put("regione", (String) request.getAttribute("regione"));
        beanLoggato.put("sigla", (String) request.getAttribute("sigla"));
        beanLoggato.put("comune", comune);
      }
      else
      {
        beanLoggato.put("regione", request.getParameter("regione"));
        beanLoggato.put("sigla", request.getParameter("sigla"));
        beanLoggato.put("comune", comune);
      }

      String nzona = request.getParameter("nzona");
      nzona = UtilService.alitRequestFormatter(nzona);
      String zona = request.getParameter("zona");
      zona = UtilService.alitRequestFormatter(zona);
      String loco = request.getParameter("loco");
      loco = UtilService.alitRequestFormatter(loco);
      String indirizzo = request.getParameter("indirizzo");
      indirizzo = UtilService.alitRequestFormatter(indirizzo);
      beanLoggato.put("nzona", nzona);
      beanLoggato.put("zona", zona);
      beanLoggato.put("loco", loco);
      beanLoggato.put("indirizzo", indirizzo);
      beanLoggato.put("civico", request.getParameter("civico"));
      beanLoggato.put("cap", request.getParameter("cap"));
      beanLoggato.put("telefono", request.getParameter("telefono"));
      beanLoggato.put("telefono2", request.getParameter("telefono2"));
      beanLoggato.put("cellulare", request.getParameter("cellulare"));
      beanLoggato.put("cellulare2", request.getParameter("cellulare2"));
      beanLoggato.put("fax", request.getParameter("fax"));
      beanLoggato.put("fax2", request.getParameter("fax2"));
      beanLoggato.put("mail", request.getParameter("mail"));
      beanLoggato.put("skype", request.getParameter("skype"));
      beanLoggato.put("web", request.getParameter("web"));
      beanLoggato.put("tipologia", request.getParameter("tipologia"));
      beanLoggato.put("costruzione", request.getParameter("costruzione"));
      beanLoggato.put("posizione", arrayToString(request.getParameterValues("posizione")));

      //titolare
      String nome = request.getParameter("nome");
      nome = UtilService.alitRequestFormatter(nome);
      String cognome = request.getParameter("cognome");
      cognome = UtilService.alitRequestFormatter(cognome);
      beanLoggato.put("nome", nome);
      beanLoggato.put("cognome", cognome);
      beanLoggato.put("mese", request.getParameter("mese"));
      beanLoggato.put("codicefiscale", request.getParameter("codicefiscale"));
      beanLoggato.put("giorno", request.getParameter("giorno"));
      beanLoggato.put("anno", request.getParameter("anno"));

      //caratteristiche
      String aeroporti = request.getParameter("aeroporti");
      aeroporti = UtilService.alitRequestFormatter(aeroporti);
      String autostrade = request.getParameter("autostrade");
      autostrade = UtilService.alitRequestFormatter(autostrade);
      String stazioni = request.getParameter("stazioni");
      stazioni = UtilService.alitRequestFormatter(stazioni);
      beanLoggato.put("aeroporti", aeroporti);
      beanLoggato.put("autostrade", autostrade);
      beanLoggato.put("stazioni", stazioni);
      beanLoggato.put("numcamere", request.getParameter("numcamere"));
      beanLoggato.put("numlettimin", request.getParameter("numlettimin"));
      beanLoggato.put("numlettimax", request.getParameter("numlettimax"));
      beanLoggato.put("numlettitot", request.getParameter("numlettitot"));
      beanLoggato.put("appartamenti", request.getParameter("appartamenti"));
      beanLoggato.put("kmcapoluogo", request.getParameter("kmcapoluogo"));
      beanLoggato.put("kmcasello", request.getParameter("kmcasello"));
      beanLoggato.put("kmaeroporto", request.getParameter("kmaeroporto"));
      beanLoggato.put("kmstazione", request.getParameter("kmstazione"));
      beanLoggato.put("mtmezzipubblici", request.getParameter("mtmezzipubblici"));
      beanLoggato.put("lingue", arrayToString(request.getParameterValues("lingue")));
    }
    else if(pagina.equals("Registrazione2.jsp"))
    {
      //caratteristiche scheda registrazione 2
      beanLoggato.put("offerta", request.getParameter("offerta"));
      beanLoggato.put("include", request.getParameter("include"));
      beanLoggato.put("prenotazione", request.getParameter("prenotazione"));
      beanLoggato.put("dal", request.getParameter("dal"));
      beanLoggato.put("al", request.getParameter("al"));
      beanLoggato.put("duratamin", request.getParameter("duratamin"));
      beanLoggato.put("scontodel", request.getParameter("scontodel"));
      beanLoggato.put("camera", arrayToString(request.getParameterValues("camera")));
      beanLoggato.put("bagno", arrayToString(request.getParameterValues("bagno")));
      beanLoggato.put("tavola", arrayToString(request.getParameterValues("tavola")));
      beanLoggato.put("struttura", arrayToString(request.getParameterValues("struttura")));
      beanLoggato.put("entrokm", request.getParameter("entrokm"));
      beanLoggato.put("pagamento", arrayToString(request.getParameterValues("pagamento")));
    }
    else if(pagina.equals("Registrazione3.jsp"))
    {
      // caratteristiche scheda registrazione3
      String desc = request.getParameter("descrizione_ita");
      desc = UtilService.alitRequestFormatter(desc);
      beanLoggato.put("descrizione_ita", desc);
      beanLoggato.put("descrizione_eng", request.getParameter("descrizione_eng"));
      beanLoggato.put("descrizione_deu", request.getParameter("descrizione_deu"));
      beanLoggato.put("descrizione_fra", request.getParameter("descrizione_fra"));
      beanLoggato.put("latitudine", request.getParameter("latitudine"));
      beanLoggato.put("longitudine", request.getParameter("longitudine"));
      beanLoggato.put("youtube", request.getParameter("youtube"));
      beanLoggato.put("myspace", request.getParameter("myspace"));
      beanLoggato.put("facebook", request.getParameter("facebook"));
      beanLoggato.put("flickr", request.getParameter("flickr"));
    }
    else if(pagina.equals("Registrazione4.jsp"))
    {
      // caratteristiche scheda registrazione4
      String note = request.getParameter("note");
      note = UtilService.alitRequestFormatter(note);
      beanLoggato.put("note", note);

      String[] tabs = request.getParameterValues("tab");

      String[] allMesi = new String[]{"gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno",
          "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"};

      for(String mese : allMesi)
        beanLoggato.put(mese, request.getParameter(mese));

      beanLoggato.put("tab", splitTabs(tabs));

    }
    else if(pagina.equals("pubblicita.jsp"))
    {
      // caratteristiche scheda pubblicita
      String slogan1 = request.getParameter("slogan1");
      slogan1 = UtilService.alitRequestFormatter(slogan1);
      String slogan2 = request.getParameter("slogan2");
      slogan2 = UtilService.alitRequestFormatter(slogan2);
      beanLoggato.put("slogan1", slogan1);
      beanLoggato.put("slogan2", slogan2);
      beanLoggato.put("urlslogan1", request.getParameter("urlslogan1"));
      beanLoggato.put("urlslogan2", request.getParameter("urlslogan2"));
    }

    session.setAttribute("beanLoggato", beanLoggato);
    return beanLoggato;
  }


  private String splitTabs(String[] tabs)
  {
    String tab = "";

    if (tabs == null || tabs.length != TAB_COUNT)
    {
      return "";
    }
    for (String t : tabs)
      tab += t + TitolareServiceImpl.TAB_SPLIT;

    tab = tab.substring(0, tab.length() - TitolareServiceImpl.TAB_SPLIT.length());

    return tab;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.FormService#arrayToString(java.lang.String[])
   */
  public String arrayToString(String[] array)
  {
    if (array == null || array.length == 0)
    {
      return "";
    }
    String result = array[0];

    for (String value : array)
    {
      result += ", " + value;
    }
    result = UtilService.alitRequestFormatter(result);

    return result;
  }
}
