package anna.alit.jee;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anna.alit.servicebb.DbmsImpl;
import anna.alit.servicebb.DynamicSelectImpl;

import anna.alit.beanbb.HashBeanVector;

@SuppressWarnings("serial")
public class SimpleAlloggioSearch extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        if(request != null && response != null) // TODO: check doPost(request, response)
            doGet(request, response);
}
/**
 * metodo di richiesta/risposta http
 *
 * @param request Oggetto HttpServletRequest dal quale ottenere informazioni circa la
 *                richiesta effettuata.
 * @param response Oggetto HttpServletResponse per l'invio delle risposte.
 */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {

        HttpSession session = request.getSession();

        String filtro = (String) request.getParameter("filtro");
        String ordinamento = (String) request.getParameter("ordinamento");
        String query = (String) session.getAttribute("query");

        // campi di interesse del risultato della query
        String[] campiOutput = new String[]{"id", "denominazione", "tipoesteso", "comune", "sigla",
                "numcamere", "numlettitot", "prezzomedio", "scontodel"};
        // contenitore risultati query
        HashBeanVector esito;

        // controllo se è stato selezionato un filtro di ordinamento nella pagina numeroRisultati.jsp
        if(filtro != null && ordinamento != null && query != null){

            // aggiungo alla query 'order by filtro-selezionato tipo-ordinamento-selezionato'
            query = query.substring(0, query.length() - 2);
            query += " order by " + filtro + " " + ordinamento + ";";

            esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

            setSessionAttribute(session, esito);

            //Preparo il dispatcher
            RequestDispatcher dispatcher = request.getRequestDispatcher("View/alloggioRis.jsp");

            //Passo il controllo alla destinationPage
            dispatcher.forward(request,response);

            return;
        }


        /**********************************************************
        DEFINISCO SELECT FROM ORDER BY
        **********************************************************/

       // String select = "select datiaziende.*, caratteristiche.*, provincia.regione, provincia.nomeesteso";
       String select = " SELECT distinct datiaziende.id, denominazione, datiaziende.tipoesteso, datiaziende.comune, datiaziende.sigla, " +
               "annofondazione, kmcapoluogo, numcamere, numlettitot, prezzomedio, scontodel, punteggio, random() \n";
       String where = "";
       String from = " FROM datiaziende, caratteristiche, provincia \n";
       String orderby = " ORDER BY random()";
       /**********************************************************
        DEFINISCO LA WHERE
        **********************************************************/

       /** INSERISCO IN 'conditions' TUTTE LE CONDIZIONI PER LA WHERE **/

       ArrayList<String> conditions = new ArrayList<String>();

       conditions.add(" datiaziende.id = caratteristiche.id_azienda_est ");
       conditions.add(" datiaziende.sigla = provincia.sigla ");

       /** condizioni campi string della form utili alla query **/

       String value;

       // LUOGO
       value = (String) request.getParameter("sigla");
       if(value != null &&  ! value.equals("0") && value.length() > 1)
           conditions.add(" datiaziende.sigla = '" + value + "' ");
       else {
           value = (String) request.getParameter("regione");
           if (value != null &&  ! value.equals("regione") && value.length() > 1) {
               conditions.add(" provincia.regione = '" + value + "' ");
           }
       }

       value = (String) request.getParameter("comune");
       if(value != null &&  ! value.equals("comune") && value.length() > 1)
           conditions.add(" datiaziende.comune = '" + value + "' ");

       value = (String) request.getParameter("distretto");
       if(value != null && !(value.equals("distretto")) && !(value.equals("")) && value.length() > 1){
           from += ", distretto ";
           conditions.add(" (datiaziende.comune = distretto.comune) and (datiaziende.sigla = distretto.prov) " +
                   "and distretto.distretto = '" + value + "' ");
       }

       // indirizzo
       value = (String) request.getParameter("indirizzo");
       if(value != null && !(value.equals("")) && value.length() > 1)
       {
         if(value.contains("\'"))
         {
           value = value.replace('\'', '`');
         }
         conditions.add(" indirizzo ILIKE '%" + value + "%' ");
       }
       // denominazione
       value = (String) request.getParameter("denominazione");
       if(value != null && value.length() > 1)
       {
         if(value.contains("\'"))
         {
           value = value.replace('\'', '`');
         }
         conditions.add(" denominazione ILIKE '%" + value + "%' ");
       }

       // descrizione
       value = (String) request.getParameter("descrizione_ita");
       if(value != null && value.length() > 1)
       {
         if(value.contains("\'"))
         {
           value = value.replace('\'', '`');
         }
         conditions.add(" caratteristiche.descrizione_ita ILIKE '%" + value + "%' ");
       }
       // tipologia
       value = (String) request.getParameter("tipologia");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" datiaziende.tipologia = '" + value + "' ");

       // prezzomedio
       String valueDa = (String) request.getParameter("prezzomedioDa");
       String valueA = (String) request.getParameter("prezzomedioA");
       if (valueDa != null && valueA != null && !(valueDa.equals("")) && !(valueA.equals("")))
           conditions.add(" (caratteristiche.prezzomedio BETWEEN " + valueDa + " AND " + valueA + ") ");

       // trattamento
       value = (String) request.getParameter("include");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" caratteristiche.include = '" + value + "' ");

       // posizione
       value = (String) request.getParameter("posizione");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" '" + value + "' = any (datiaziende.posizione) ");

       // prenotazione
       value = (String) request.getParameter("prenotazione");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" caratteristiche.prenotazione = '" + value + "' ");

       // pagamento
       value = (String) request.getParameter("pagamento");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" '" + value + "' = any (caratteristiche.pagamento) ");

       // lingue
       value = (String) request.getParameter("lingue");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" '" + value + "' = any (caratteristiche.lingue) ");

       // annofondazione
       value = (String) request.getParameter("annofondazione");
       if(value != null &&  ! value.equals("qualsiasi") && value.length() > 1)
           conditions.add(" datiaziende.annofondazione = " + value + " ");

       /** unisco tutte le condizioni della where **/
       where = DynamicSelectImpl.getInstance().makeWhere(conditions, "AND");
       if(where.length() > 0)
           where = " WHERE " + where + " \n";

       /**********************************************************
        ESEGUO LA QUERY
        **********************************************************/
       query = select + from + where + orderby;

       esito = DbmsImpl.getInstance().executeQuery(query, campiOutput);

       // salvo la query senza ORDER BY
       session.setAttribute("query", select + from + where);

       //TODO: deprecare: in alloggioRis.jsp utilizzare get(String key, int index)
       setSessionAttribute(session, esito);

       //Preparo il dispatcher
       RequestDispatcher dispatcher = request.getRequestDispatcher("View/numeroRisultati.jsp");

       //Passo il controllo alla destinationPage
       dispatcher.forward(request,response);

    }

    private static void setSessionAttribute(HttpSession session, HashBeanVector esito) {
        String[] idArray = new String[0];
        String[] denominazioneArray = new String[0];
        String[] tipoestesoArray = new String[0];
        String[] comuneArray = new String[0];
        String[] siglaArray = new String[0];
        String[] numcamereArray = new String[0];
        String[] numlettitotArray = new String[0];
        String[] prezzomedioArray = new String[0];
        String[] scontodelArray = new String[0];

        if(esito != null && esito.size() != 0) {
            idArray = esito.getAsArray("id");
            denominazioneArray = esito.getAsArray("denominazione");
            tipoestesoArray = esito.getAsArray("tipoesteso");
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
        session.setAttribute("comune", comuneArray);
        session.setAttribute("sigla", siglaArray);
        //TODO: remove this: session.setAttribute("index", 0);
        session.setAttribute("numcamere", numcamereArray);
        session.setAttribute("numlettitot", numlettitotArray);
        session.setAttribute("prezzomedio", prezzomedioArray);
        session.setAttribute("scontodel", scontodelArray);

    }
}