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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import anna.alit.servicebb.DbmsImpl;


@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

  /**
   *
   */

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log() {
          if (this.logger == null)
                  this.logger = LoggerFactory.getLogger(this.getClass());
          return this.logger;
  }

  /**
 * metodo di richiesta/risposta http
 *
 * @param request Oggetto HttpServletRequest dal quale ottenere informazioni circa la
 *                richiesta effettuata.
 * @param response Oggetto HttpServletResponse per l'invio delle risposte.
 */
  public void service(HttpServletRequest request, HttpServletResponse response)
  throws IOException, ServletException {


    String destinationPage = "";
    HttpSession session = request.getSession(true);


    String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    String kaptchaReceived = request.getParameter("kaptcha");

    if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected))
    {
        log().info("kaptcha Invalid validation code.");
    }

    try {

    ResultSet rs = null;
    String utente = request.getParameter("utente");
    String pwd = request.getParameter("pwd");

    String query = "select count(*) as num from admins where utente = '" + utente + "' and pwd='" + pwd + "'";

    rs = DbmsImpl.getInstance().executeQuery(query);

      while(rs.next()){
        if(rs.getInt("num") == 1){
          destinationPage = "View/home.jsp";
          session.setAttribute("islogged", "true");
        }else{
          destinationPage = "View/login.jsp";
          session.setAttribute("islogged", "false");
        }
      }


    } catch(SQLException e) {
           log().warn(e.getMessage(), e);
    }

          log().info("");

    RequestDispatcher dispatcher = request.getRequestDispatcher(destinationPage);

    dispatcher.forward(request,response);

          log().info("");

  }

}
