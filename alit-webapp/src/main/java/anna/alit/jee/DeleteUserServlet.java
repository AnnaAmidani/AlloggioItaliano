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

import anna.alit.beanbb.ParamsMap;
import anna.alit.servicebb.AlitServiceImpl;
import anna.alit.servicebb.DbmsImpl;


@SuppressWarnings("serial")
public class DeleteUserServlet extends HttpServlet
{

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
	 * @param request
	 *            Oggetto HttpServletRequest dal quale ottenere informazioni
	 *            circa la richiesta effettuata.
	 * @param response
	 *            Oggetto HttpServletResponse per l'invio delle risposte.
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request != null && response != null) // TODO: check doPost(request,
													// response)
			doGet(request, response);
	}

  /**
   *
   *
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
  {
    String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    String kaptchaReceived = request.getParameter("kaptcha");

    if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected))
    {
      response.sendRedirect("jspService/errorK.jsp");
    }
    else
    {
      HttpSession session = request.getSession();

      String userMail = request.getParameter("userMail");
      String reasonWhy = request.getParameter("reasonWhy");
      ParamsMap params = (ParamsMap) session.getAttribute("params");
      params.put("userMail", userMail);
      params.put("reasonWhy", reasonWhy);

      String query = "select id, denominazione, sigla, comune, tipoesteso from datiaziende where mail like '%"+userMail+"%'";

      int id = 0;
      String den = "none";
      ResultSet rs = null;
      String sigla, comune, tipo;

      try
      {
        rs = DbmsImpl.getInstance().executeQuery(query);

		if( rs != null && rs.next() )
		{
		  id = rs.getInt("id");
		  den = rs.getString("denominazione");
		  sigla = rs.getString("sigla");
		  comune = rs.getString("comune");
		  tipo = rs.getString("tipoesteso");
		  params.put("denominazione", den);
		  params.put("id", Integer.toString(id));
		  params.put("sigla", sigla);
		  params.put("comune", comune);
		  params.put("tipoesteso", tipo);

		  if (session != null && !session.isNew())
	      {
			log().info("Delete Request from: \n");
			log().info(id+"\n");
			log().info(den+"\n");
            session.invalidate();
			log().info("The user Session was invalidated. Redirecting out of the site!");
	      }

		  String delete =
		  "delete from immagini where id_datiaziende="+id+";" +
          "delete from caratteristiche where id_azienda_est="+id+";" +
          "delete from titolare where id_azienda="+id+";" +
          "delete from datiaziende where id="+id+";";

		  DbmsImpl.getInstance().executeUpdate(delete);

		  AlitServiceImpl.getInstance().sendEmail(params);

		  params.remove("page");
		  params.put("page", "View/cancellazioneForm_user.jsp");
		  AlitServiceImpl.getInstance().sendEmail(params);

  	      response.sendRedirect(response.encodeURL("View/ok.jsp"));
		}
		else
		{
		  session.setAttribute("errorMsg", true);
  	      response.sendRedirect(response.encodeURL("View/cancellazioneForm.jsp"));
		}
	  }
      catch (SQLException e)
	  {
		e.printStackTrace();
	  }

//      session.removeAttribute("params");
    }
  }




}
