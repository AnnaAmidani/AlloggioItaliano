package anna.alit.jee;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;
import anna.alit.servicebb.*;

@SuppressWarnings("serial")
public class RetrieveFirstContactServlet extends HttpServlet
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

	      String username =  (String)session.getAttribute("username");
	      String password =  (String)session.getAttribute("password");
	      String mail =  (String)session.getAttribute("mail");
	      String denominazione = (String)session.getAttribute("denominazione");

	      if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
	      {
	          int id = RegisterService1Impl.getInstance().getId(mail);
	    	  HashBean result = TitolareServiceImpl.getInstance().getUsrAndPwd(id);
	    	  username = result.get("username");
	    	  password = result.get("password");
	      }

	      ParamsMap params = new ParamsMapImpl();
	      params.put("to_firstcontact", mail);
		  params.put("to_den", denominazione);
		  params.put("username", username);
		  params.put("password", password);
		  params.put("page", "View/alreadyRegistered.jsp");

	      AlitServiceImpl.getInstance().sendEmail(params);

	      session.setAttribute("success", "success");
	      response.sendRedirect(response.encodeURL("View/alreadyRegistered.jsp"));
	    }
    }




}
