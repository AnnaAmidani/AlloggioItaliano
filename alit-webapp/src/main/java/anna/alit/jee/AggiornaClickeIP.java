package anna.alit.jee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import anna.alit.servicebb.DbmsImpl;


@SuppressWarnings("serial")
public class AggiornaClickeIP extends HttpServlet {

 /**
   *
   */

  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {

    if(request != null && response != null)  // TODO: check doPost(request, response)
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

    try {

    ResultSet rs = null;
    int clickpresenti = 0;
    String id = request.getParameter("id");
    String ipnumeric = request.getParameter("ipnumerico");
    String iplettere = request.getParameter("iplettere");

    String query = "select contaclick from datiaziende where id = " + id;

    rs = DbmsImpl.getInstance().executeQuery(query);

    if(rs != null && rs.next())
      clickpresenti = rs.getInt("contaclick");

    clickpresenti += 1;

    String updateClickeIP  = "UPDATE datiaziende set " +
    "contaclick = " + clickpresenti + " ," +
    " ipnum = '" + ipnumeric +
    "', iplett = '" + iplettere + "' where id = " + id + ";";

    DbmsImpl.getInstance().executeUpdate(updateClickeIP);

    } catch(SQLException e) {
      e.printStackTrace();
    }

    RequestDispatcher dispatcher = request.getRequestDispatcher("View/scheda1.jsp");

    dispatcher.forward(request,response);
    }

}







