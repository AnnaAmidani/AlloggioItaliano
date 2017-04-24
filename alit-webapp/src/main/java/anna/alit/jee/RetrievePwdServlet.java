package anna.alit.jee;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import anna.alit.beanbb.ParamsMap;
import anna.alit.servicebb.AlitServiceImpl;
import anna.alit.servicebb.DbmsImpl;
import anna.alit.servicebb.UtilityServiceImpl;


@SuppressWarnings("serial")
public class RetrievePwdServlet extends HttpServlet
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
      ParamsMap params = (ParamsMap) session.getAttribute("params");
      params.put("userMail", userMail);

      String query = "select id, denominazione from datiaziende where mail like '%"+userMail+"%'";

      int id = 0;
      String den = "none";
      ResultSet rs = null;

      try
      {
        rs = DbmsImpl.getInstance().executeQuery(query);

		if( rs != null && rs.next() )
		{
		  id = rs.getInt("id");
		  den = rs.getString("denominazione");
		  params.put("denominazione", den);

	      ResultSet rsUsr = null;
          String usr = null;
          String pwd = null;
          String iscrizione = null;

	      String queryUsr = "select username, password, dataiscrizione from titolare where id_azienda="+id;

	      try
	      {
	    	rsUsr = DbmsImpl.getInstance().executeQuery(queryUsr);

			if( rsUsr != null && rsUsr.next() )
			{
              usr = rsUsr.getString("username");
              pwd = rsUsr.getString("password");
              if(StringUtils.isNotEmpty(pwd))
              {
                pwd = UtilityServiceImpl.getInstance().pwdResolver(pwd, false);
              }
			  iscrizione = rsUsr.getString("dataiscrizione");
			  if(StringUtils.isEmpty(iscrizione))
			  {
                session.setAttribute("denominazione", den);
                session.setAttribute("username", usr);
                session.setAttribute("password", pwd);
                session.setAttribute("mail", userMail);
	            response.sendRedirect(response.encodeURL("View/alreadyRegistered.jsp?id_exp=164634643d4f6ds64vs64gbw64b6s4vs64v6sfv43sdvs34v&noreg=noreg&neverloggedon=neverloggedon"));
			    return;
			  }
			}
			else
			{
			  session.setAttribute("errorMsg", true);
	  	      response.sendRedirect(response.encodeURL("View/retrievePwdForm.jsp"));
			}
	      }
	      catch (SQLException e1)
		  {
			e1.printStackTrace();
		  }

	      String link = "View/doLogReset.jsp?username="+usr+"&confirmed=true&idext=bfeifkwdnqk3752976582bdjq37tr813464e691dbgjaqdu3t498888";
	      log().info(link);
	      params.put("link",link);

	      AlitServiceImpl.getInstance().sendEmail(params);

  	      response.sendRedirect(response.encodeURL("View/ok.jsp"));
		}
		else
		{
		  session.setAttribute("errorMsg", true);
  	      response.sendRedirect(response.encodeURL("View/retrievePwdForm.jsp"));
		}
	  }
      catch (SQLException e)
	  {
		e.printStackTrace();
	  }

      session.removeAttribute("params");
    }
  }




}
