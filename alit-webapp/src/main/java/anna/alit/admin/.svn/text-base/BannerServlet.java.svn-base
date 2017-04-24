package anna.alit.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import anna.alit.multimedia.ImageServiceImpl;


/**
 * @author anna
 * @created Feb 25, 2010
 */
@SuppressWarnings("serial")
public class BannerServlet extends HttpServlet
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

  //@Autowired protected ImageServiceImpl imageServiceImpl;

  /*
   * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {

  }

  /*
   * @see javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  @SuppressWarnings("unchecked")
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    HttpSession session = request.getSession();

    String regione = (String)session.getAttribute("regione");
    String tipolog = (String)session.getAttribute("tipolog");
    String posizio = (String)session.getAttribute("posizio");
    String fromthe = (String)session.getAttribute("fromthe");
    String tillthe = (String)session.getAttribute("tillthe");
    String sponsor = (String)session.getAttribute("sponsor");
    String linking = (String)session.getAttribute("linking");

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

    @SuppressWarnings("unused")
    boolean uploaded = false;

    if (!isMultipart)
    {
      log().error("The request isn't multipart: file not uploaded");
    }
    else
    {
      FileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload upload = new ServletFileUpload(factory);
      List<FileItem> items = null;
      try
      {
        items = upload.parseRequest(request);
      }
      catch (FileUploadException e)
      {
        log().error("Error during parseRequest(request): file not uploaded: ", e.getLocalizedMessage());
      }

      uploaded = ImageServiceImpl.getInstance().addBanners(items, posizio, regione, tipolog, fromthe, tillthe, sponsor, linking);
    }
    RequestDispatcher dispatcher;
    dispatcher = request.getRequestDispatcher("/View/admin/okImage.jsp");
    dispatcher.forward(request, response);
 }
}
