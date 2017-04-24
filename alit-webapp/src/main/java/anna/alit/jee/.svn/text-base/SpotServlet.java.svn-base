package anna.alit.jee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anna.alit.servicebb.DbmsImpl;


@SuppressWarnings("serial")
public class SpotServlet extends HttpServlet {

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
  throws IOException, ServletException
  {
    HttpSession session = request.getSession(true);

    ResultSet rs = null;
    String[] regione = request.getParameterValues("regione");
    String[] tipologia = request.getParameterValues("tipologia");
    String[] periodo = request.getParameterValues("periodo");
    String[] posizione = request.getParameterValues("posizione");

    String forRegion = formatRegion(regione);
    String forTipologia = formatTipologia(tipologia);

    int forPeriodo = 0;
    int forPosizione = 0;

    if(periodo != null)
    {
   	  forPeriodo = periodo.length;
    }
    if(posizione != null)
    {
      forPosizione = posizione.length;
    }

    float num = 0;
    float totale = 0;

    String query = "select count(denominazione) as tot from datiaziende, provincia where datiaziende.sigla=provincia.sigla ";

    if(forRegion != null)
    {
      query += "and" + forRegion;
    }
    if(forTipologia != null)
    {
      query += " and " + forTipologia;
    }

    if( regione != null || tipologia != null )
    {

     try
     {
       rs = DbmsImpl.getInstance().executeQuery(query);

       if(rs != null && rs.next())
       {
         num = rs.getInt("tot");
         totale = (float) (num * 0.33 * forPeriodo * forPosizione);
         session.setAttribute("totale", totale);

         if(regione != null)
         {
           String region = "";
           for(String reg : regione)
           {
             region += reg;
           }
           request.setAttribute("region", region);
         }
         if(tipologia != null)
         {
           String tipolog = "";
           for(String tip : tipologia)
           {
             tipolog += tip;
           }
           request.setAttribute("tipolog", tipolog);
         }
         if(periodo != null)
         {
           String period = "";
           for(String per : periodo)
           {
             period += per;
           }
           request.setAttribute("period", period);
         }
         if(posizione != null)
         {
           String posizion = "";
           for(String pos : posizione)
           {
             posizion += pos;
           }
           request.setAttribute("posizion", posizion);
         }
      }
    }
    catch(SQLException e)
    {
      e.printStackTrace();
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("View/pubblicitaesterna.jsp");

    dispatcher.forward(request,response);
    }
  }

  private String formatRegion(String[] regione)
  {
	String forRegion = null;

	if(regione != null)
	{
	  forRegion = "(";
	  for(int i = 0; i < regione.length ; i++)
	  {
  	    forRegion += "regione = '" + regione[i] + "' OR ";
	    i++;
	  }
      forRegion = forRegion.substring(0, forRegion.length()-3 );
      forRegion += ")";

      return forRegion;
      }

    return forRegion;
  }

  private String formatTipologia(String[] tipologia)
  {
    String forTipologia = null;

    if(tipologia != null)
    {
      forTipologia = "(";
      for(int i = 0; i < tipologia.length; i++)
      {
        forTipologia += "tipologia = '" + tipologia[i] + "' OR ";
        i++;
      }
      forTipologia = forTipologia.substring(0, forTipologia.length()-3 );
      forTipologia += ")";

      return forTipologia;
    }

    return forTipologia;
  }
}