package anna.alit.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @author anna
 * @created Jun 19, 2009
 */
@SuppressWarnings("serial")
public class PreBannerServlet extends HttpServlet
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
    {
      this.logger = LoggerFactory.getLogger(this.getClass());
    }
    return this.logger;
  }


  /*
   * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {

  }

  /*
   * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    HttpSession session = request.getSession();

    String regione = request.getParameter("regione");
    String tipolog = request.getParameter("tipolog");
    String posizio = request.getParameter("posizio");
    String fromthe = request.getParameter("fromthe");
    String tillthe =  request.getParameter("tillthe");
    String sponsor = request.getParameter("sponsor");
    String linking = request.getParameter("linking");

    session.setAttribute("tipolog", tipolog);
    session.setAttribute("regione", regione);
    session.setAttribute("posizio", posizio);
    session.setAttribute("fromthe", fromthe);
    session.setAttribute("tillthe", tillthe);
    session.setAttribute("sponsor", sponsor);
    session.setAttribute("linking", linking);

    RequestDispatcher dispatcher;
    dispatcher = request.getRequestDispatcher("/View/admin/okImage.jsp");
    dispatcher.forward(request, response);
  }

}
