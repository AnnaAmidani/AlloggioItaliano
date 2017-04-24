package anna.alit.jee;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import anna.alit.beanbb.ParamsMap;
import anna.alit.servicebb.AlitServiceImpl;
import anna.alit.utilities.UtilService;


@SuppressWarnings("serial")
public class MailServlet extends HttpServlet
{

  /**
   *
   *
   */
  public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
  {

    String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
    String kaptchaReceived = request.getParameter("kaptcha");

    if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected))
    {
      response.sendRedirect("jspService/errorK.jsp");
    }
    else
    {

      SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
      String data = sdf.format(new Date());

      HttpSession session = request.getSession();

      ParamsMap params = (ParamsMap) session.getAttribute("params");
      params.put("userMail", request.getParameter("userMail"));
      params.put("fromAnother", request.getParameter("fromAnother"));
      String body = request.getParameter("body");
      body = UtilService.alitRequestFormatter(body);
      params.put("body", body);
      params.put("regione", request.getParameterValues("regione"));
      params.put("tipologia", request.getParameterValues("tipologia"));
      params.put("periodo", request.getParameterValues("periodo"));
      params.put("posizione", request.getParameterValues("posizione"));
      params.put("data", data);
      String username = request.getParameter("username");
      username = UtilService.alitRequestFormatter(username);
      params.put("username", username);
      params.put("password", request.getParameter("password"));
      params.put("to_firstcontact", request.getParameter("to_firstcontact"));
      String den = request.getParameter("to_den");
      den = UtilService.alitRequestFormatter(den);
      params.put("to_den", den);

      String page = AlitServiceImpl.getInstance().sendEmail(params);
      if(page == null)
      {
        page = "jspService/error.jsp";
      }

      session.removeAttribute("params");
      // Dichiaro l'oggetto Dispatcher necessario per passare il controllo ad
      // una JSP o una pagina HTML

      RequestDispatcher dispatcher = request.getRequestDispatcher(page);

      // Passo il controllo alla destinationPage
      dispatcher.forward(request, response);

      }
  }

}
