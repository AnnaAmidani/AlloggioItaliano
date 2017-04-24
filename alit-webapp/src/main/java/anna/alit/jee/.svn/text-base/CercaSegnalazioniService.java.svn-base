package anna.alit.jee;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anna.alit.servicebb.DynamicSelectImpl;
import anna.alit.servicebb.ServicesImpl;
import anna.alit.utilities.UtilService;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@SuppressWarnings("serial")
public class CercaSegnalazioniService extends HttpServlet {

  private static String destinationPage = "/home";

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
	    if(request != null) // && response != null) // TODO: check doPost(request) //, response)
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

          String tipo = (String) request.getParameter("tipo");
          destinationPage = (String) request.getParameter("destinationPage");

          String whereAndOrder = "";

          HashBean datiString = new HashBean();

          String[] campiString = new String[]{"id", "nome", "prov", "dal", "al",
                  "comu", "regione", "tipo", "settore", "categoria"};

          ServicesImpl.getInstance().addToHashBean(datiString, request, "segnalazioni", campiString);

          campiString = new String[]{"tipoesteso"};
          ServicesImpl.getInstance().addToHashBean(datiString, request, "datiaziende", campiString);

          String select = "datiaziende.tipoesteso, segnalazioni.* ";
          String from = "datiaziende, segnalazioni ";
          String where = " where ";
          String orderby = " order by datapubblicazione ";

          campiString = new String[]{"id", "nome", "prov", "dal", "al",
                  "comu", "regione", "tipo", "settore", "categoria",
                  "tipoesteso"};

          ArrayList<String> conditions = new ArrayList<String>();

          conditions.add(" datiaziende.id = segnalazioni.idazienda ");
          conditions.add(" segnalazioni.tipo ='" + tipo + "'");

          String value = (String) request.getParameter("sigla");
          if(value != null &&  ! value.equals("0") && value.length() > 1)
              conditions.add(" segnalazioni.prov = '" + value + "' ");
          else {
              value = (String) request.getParameter("regione");
              if (value != null &&  ! value.equals("regione") &&  ! value.equals("0") && value.length() > 1) {
                  conditions.add(" segnalazioni.regione = '" + value + "' ");
              }
          }

          value = (String) request.getParameter("nome");
          value = UtilService.alitRequestFormatter(value);
          if(value != null && value.length() > 1)
          {
            conditions.add(" segnalazioni.nome ILIKE '%" + value + "%' ");
          }

          value = (String) request.getParameter("comune");
          value = UtilService.alitRequestFormatter(value);
          if(value != null &&  ! value.equals("comune") && value.length() > 1)
              conditions.add(" segnalazioni.comu = '" + value + "' ");

          String valueDa = (String) request.getParameter("dal");
          String valueA = (String) request.getParameter("al");
          if (valueDa != null && valueA != null && !(valueDa.equals("")) && !(valueA.equals("")) ){
              conditions.add(" al <= '" + valueA + "' and dal >= '" + valueDa + "' ");
          }
          if (valueDa != null && ! valueDa.equals("")){
            conditions.add("  dal = '" + valueDa + "' ");
          }

          where = DynamicSelectImpl.getInstance().makeWhere(conditions, "AND");

          whereAndOrder = where + orderby;

          HashBeanVector esitoSegnalazioni = DynamicSelectImpl.getInstance().execute(select, from, whereAndOrder,campiString);

          HttpSession session = request.getSession();
          // TODO: pulire session(attenzion)
//        @SuppressWarnings("unchecked")
//        Enumeration<String> sessionKeys = session.getAttributeNames();
//        String key;
//        while(sessionKeys.hasMoreElements()) {
//            key = sessionKeys.nextElement();
//            session.removeAttribute(key);
//        }

          session.setAttribute("esitoSegnalazioni", esitoSegnalazioni);
          session.setAttribute("index", 0);

          //Preparo il dispatcher
          RequestDispatcher dispatcher = request.getRequestDispatcher(destinationPage);

          //Passo il controllo alla destinationPage
          dispatcher.forward(request,response);
      }
}