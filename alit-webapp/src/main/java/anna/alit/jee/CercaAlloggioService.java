package anna.alit.jee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.xwork.StringUtils;

import anna.alit.servicebb.DbmsImpl;
import anna.alit.servicebb.DynamicSelectImpl;
import anna.alit.utilities.UtilService;
import anna.alit.beanbb.FourArray;
import anna.alit.beanbb.FourArrayImpl;
import anna.alit.beanbb.HashBeanVector;

@SuppressWarnings("serial")
public class CercaAlloggioService extends HttpServlet
{

  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    if( request != null && response != null ) // TODO: check doPost(request,
                                              // response)
      doGet(request, response);
  }

  /**
   * metodo di richiesta/risposta http
   *
   * @param request
   *          Oggetto HttpServletRequest dal quale ottenere informazioni circa
   *          la richiesta effettuata.
   * @param response
   *          Oggetto HttpServletResponse per l'invio delle risposte.
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
  {

    HttpSession session = request.getSession();

    String filtro = (String) request.getParameter("filtro");
    String ordinamento = (String) request.getParameter("ordinamento");
    String query = (String) session.getAttribute("query");

    // campi di interesse del risultato della query
    String[] campiOutput = new String[] { "id", "denominazione", "tipoesteso", "regione", "comune", "sigla", "numcamere",
        "numlettitot", "prezzomedio", "scontodel" };
    // contenitore risultati query
    HashBeanVector esito;


    // se ho filtro, ordinamento e query allora non provengo dalla home (pagina ricerca) ma è stato richiesto un riordino
    if ( filtro != null && ordinamento != null && query != null )
    {
      // aggiungo alla query 'order by filtro-selezionato
      // tipo-ordinamento-selezionato'
      query = query.substring(0, query.length() - 2);
      query += " order by " + filtro + " " + ordinamento + ";";

      esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

      setSessionAttribute(session, esito);
      session.setAttribute("filtro", filtro);
      session.setAttribute("ordinamento", ordinamento);

      String re = (String)session.getAttribute("r");
      String si = (String)session.getAttribute("s");
      String co = (String)session.getAttribute("c");

      String page = "risultati-ricerca-alloggi";
      page = this.addParams(re, si, co, null, page);

      response.sendRedirect(response.encodeURL(page));
      return;
    }

    /**********************************************************
     * DEFINISCO SELECT FROM ORDER BY
     **********************************************************/

    // String select =
    // "select datiaziende.*, caratteristiche.*, provincia.regione, provincia.nomeesteso";
    String select = " SELECT distinct provincia.regione, datiaziende.id, denominazione, datiaziende.tipoesteso, datiaziende.comune, datiaziende.sigla, "
        + "annofondazione, kmcapoluogo, numcamere, numlettitot, prezzomedio, scontodel, punteggio\n"; //, random()
    String where = "";
    String from = " FROM datiaziende, caratteristiche, provincia \n";
    String orderby = " ORDER BY punteggio DESC"; //, random()

    session.setAttribute("filtro", "punteggio");
    session.setAttribute("ordinamento", "DESC");

    /**********************************************************
     * DEFINISCO LA WHERE
     **********************************************************/

    /** INSERISCO IN 'conditions' TUTTE LE CONDIZIONI PER LA WHERE **/

    ArrayList<String> conditions = new ArrayList<String>();

    conditions.add(" datiaziende.id = caratteristiche.id_azienda_est ");
    conditions.add(" datiaziende.sigla = provincia.sigla ");

    /** condizioni campi richiesto/indesiderato della form **/

    // prelevo i campi degli array camera, bagno, tavola, struttura della form
    // (i campi sono mappati nel seguente modo: 0=indifferente, 1=si, 2=no)
    String fArray = (String) request.getParameter("fourArray");
    FourArray fourArray = new FourArrayImpl(fArray);
    // formatto i campi 'si' e i campi 'no' dei vari array
    // per il 'where' della query (i campi indifferente non vengono considerati)
    String fourArrayWhere = fourArray.getQueryWhere();
    conditions.add(fourArrayWhere);

    char[] fourArrayChars = null; // serve per query su select box collegate al
                                  // fourArray
    if( fArray != null )
      fourArrayChars = fArray.toCharArray();

    /** condizioni campi string della form utili alla query **/

    String value;

    String r = "";
    String s = "";
    String c = "";
    String d = "";

    // LUOGO
    value = (String) request.getParameter("sigla");
    if( value != null && !value.equals("0") && value.length() > 1 )
    {
      conditions.add(" datiaziende.sigla = '" + value + "' ");
      s = value;
    }
    else
    {
      value = (String) request.getParameter("regione");
      if( value != null && !value.equals("regione") && value.length() > 1 )
      {
        conditions.add(" provincia.regione = '" + value + "' ");
      }
    }

    value = (String) request.getParameter("comune");
    value = UtilService.alitRequestFormatter(value);
    if( value != null && !value.equals("comune") && value.length() > 1 )
    {
      conditions.add(" datiaziende.comune = '" + value + "' ");
      c = value;
    }

    value = (String) request.getParameter("distretto");
    value = UtilService.alitRequestFormatter(value);
    if( value != null && !(value.equals("distretto")) && !(value.equals("")) && value.length() > 1 )
    {
      from += ", distretto ";
      conditions.add(" (datiaziende.comune = distretto.comune) and (datiaziende.sigla = distretto.prov) and distretto.distretto = '" + value + "' ");
      d = value;
    }

    value = (String) request.getParameter("indirizzo");
    value = UtilService.alitRequestFormatter(value);
    if( value != null && !(value.equals("")) && value.length() > 1 )
    {
      conditions.add(" indirizzo ILIKE '%" + value + "%' ");
    }

    // denominazione
    value = (String) request.getParameter("denominazione");
    value = UtilService.alitRequestFormatter(value);
    if( value != null && value.length() > 1 )
    {
      conditions.add(" denominazione ILIKE '%" + value + "%' ");
    }

    // descrizione
    value = (String) request.getParameter("descrizione_ita");
    value = UtilService.alitRequestFormatter(value);
    if( value != null && value.length() > 1 )
    {
      conditions.add(" caratteristiche.descrizione_ita ILIKE '%" + value + "%' ");
    }
    // tipologia
    value = (String) request.getParameter("tipologia");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" datiaziende.tipologia = '" + value + "' ");

    // prezzomedio
    String valueDa = (String) request.getParameter("prezzomedioDa");
    String valueA = (String) request.getParameter("prezzomedioA");
    if( valueDa != null && valueA != null && !(valueDa.equals("")) && !(valueA.equals("")) )
      conditions.add(" (caratteristiche.prezzomedio BETWEEN " + valueDa + " AND " + valueA + ") ");

    // trattamento
    value = (String) request.getParameter("include");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" caratteristiche.include = '" + value + "' ");

    // posizione
    value = (String) request.getParameter("posizione");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" '" + value + "' = any (datiaziende.posizione) ");

    // prenotazione
    value = (String) request.getParameter("prenotazione");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" caratteristiche.prenotazione = '" + value + "' ");

    // pagamento
    value = (String) request.getParameter("pagamento");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" '" + value + "' = any (caratteristiche.pagamento) ");

    // lingue
    value = (String) request.getParameter("lingue");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" '" + value + "' = any (caratteristiche.lingue) ");

    // annofondazione
    value = (String) request.getParameter("annofondazione");
    if( value != null && !value.equals("qualsiasi") && value.length() > 1 )
      conditions.add(" datiaziende.annofondazione = " + value + " ");

    // numcamere
    value = (String) request.getParameter("numcamere");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.numcamere = " + value + " ");

    // numlettimin
    value = (String) request.getParameter("numlettimin");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.numlettimin = " + value + " ");

    // numlettimax
    value = (String) request.getParameter("numlettimax");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.numlettimax = " + value + " ");

    // kmaeroporto
    value = (String) request.getParameter("kmaeroporto");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.kmaeroporto <= " + value + " ");

    // kmstazione
    value = (String) request.getParameter("kmstazione");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.kmstazione <= " + value + " ");

    // kmcasello
    value = (String) request.getParameter("kmcasello");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.kmcasello <= " + value + " ");

    // mtmezzipubblici
    value = (String) request.getParameter("mtmezzipubblici");
    if( value != null && value.length() > 1 )
      conditions.add(" caratteristiche.mtmezzipubblici <= " + value + " ");

    // scontodel
    value = (String) request.getParameter("dal");
    if( value != null && value.length() > 1 && !value.equals("") )
      conditions.add(" '" + value + "' between caratteristiche.dal and caratteristiche.al ");

    /**********************************************************
     * PREPARO I CAMPI DELL'ARRAY
     **********************************************************/

    if( fourArrayChars != null )
    {
      // parcheggio dettagli (se presenti, altrimenti ci ha già pensato
      // fourArray)
      value = (String) request.getParameter("parcheggio");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[2] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.struttura) ");

      // noleggio dettagli (se presenti, altrimenti ci ha già pensato fourArray)
      value = (String) request.getParameter("noleggio");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[46] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.struttura) ");

      // tv in camera dettagli (se presenti, altrimenti ci ha già pensato
      // fourArray)
      value = (String) request.getParameter("tv");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[16] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.camera) ");

      // internet in camera dettagli (se presenti, altrimenti ci ha già pensato
      // fourArray)
      value = (String) request.getParameter("internet");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[17] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.camera) ");

      // bagno dettagli (se presenti, altrimenti ci ha già pensato fourArray)
      value = (String) request.getParameter("bagno");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[20] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.bagno) ");

      // vasca dettagli (se presenti, altrimenti ci ha già pensato fourArray)
      value = (String) request.getParameter("con vasca");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[22] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.bagno) ");

      // colazione dettagli (se presenti, altrimenti ci ha già pensato
      // fourArray)
      value = (String) request.getParameter("colazione");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[27] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.tavola) ");

      // menu dettagli (se presenti, altrimenti ci ha già pensato fourArray)
      value = (String) request.getParameter("menu");
      if( value != null && !value.equals("qualsiasi") && value.length() > 1 && fourArrayChars[28] == '1' )
        conditions.add("'" + value + "' = any (caratteristiche.bagno) ");
    }

    /** unisco tutte le condizioni della where **/
    where = DynamicSelectImpl.getInstance().makeWhere(conditions, "AND");
    if( where.length() > 0 )
      where = " WHERE " + where + " \n";

    /**********************************************************
     * ESEGUO LA QUERY
     **********************************************************/
    query = select + from + where + orderby;

    esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

    // salvo la query senza ORDER BY
    session.setAttribute("query", select + from + where);

    // TODO: deprecare: in alloggioRis.jsp utilizzare get(String key, int index)
    r = (String)request.getParameter("regione");
    setSessionAttribute(session, esito);
    session.setAttribute("r", r);
    session.setAttribute("s", s);
    session.setAttribute("c", c);


    String page = "risultati-ricerca-alloggi";
    page = this.addParams(r, s, c, d, page);

    response.sendRedirect(response.encodeURL(page));
  }

  private String addParams(String r, String s, String c, String d, String page)
  {
    if(r != null) r = r.replaceAll(" ", "-").replaceAll("\\`", "-");
	  if(c != null) c = c.replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");
    if(d != null) d = d.replaceAll(" ", "-").replaceAll("\\`", "-").replaceAll("--", "-");
    if( StringUtils.isNotEmpty(r) )
    {
	  page += "/"+r;
	  if(StringUtils.isNotEmpty(s))
	  {
	    page += "/"+s;
		if(StringUtils.isNotEmpty(c))
		{
		  page += "/"+c;
		  if(StringUtils.isNotEmpty(d))
		  {
		    page += "/"+d;
		  }
		  else
		  {
			 page += ".html";
		  }
		}
		else
		{
		  page += ".html";
		}
	  }
	  else
	  {
	    page += ".html";
	  }
    }
    return page;
  }



  private static void setSessionAttribute(HttpSession session, HashBeanVector esito)
  {
    String[] idArray = new String[0];
    String[] denominazioneArray = new String[0];
    String[] tipoestesoArray = new String[0];
    String[] regioneArray = new String[0];
    String[] comuneArray = new String[0];
    String[] siglaArray = new String[0];
    String[] numcamereArray = new String[0];
    String[] numlettitotArray = new String[0];
    String[] prezzomedioArray = new String[0];
    String[] scontodelArray = new String[0];

    if( esito != null && esito.size() != 0 )
    {
      idArray = esito.getAsArray("id");
      denominazioneArray = esito.getAsArray("denominazione");
      tipoestesoArray = esito.getAsArray("tipoesteso");
      regioneArray = esito.getAsArray("regione");
      comuneArray = esito.getAsArray("comune");
      siglaArray = esito.getAsArray("sigla");
      numcamereArray = esito.getAsArray("numcamere");
      numlettitotArray = esito.getAsArray("numlettitot");
      prezzomedioArray = esito.getAsArray("prezzomedio");
      scontodelArray = esito.getAsArray("scontodel");
    }

    session.setAttribute("id", idArray);
    session.setAttribute("denominazione", denominazioneArray);
    session.setAttribute("tipoesteso", tipoestesoArray);
    session.setAttribute("regione", regioneArray);
    session.setAttribute("comune", comuneArray);
    session.setAttribute("sigla", siglaArray);
    session.setAttribute("numcamere", numcamereArray);
    session.setAttribute("numlettitot", numlettitotArray);
    session.setAttribute("prezzomedio", prezzomedioArray);
    session.setAttribute("scontodel", scontodelArray);

  }
}