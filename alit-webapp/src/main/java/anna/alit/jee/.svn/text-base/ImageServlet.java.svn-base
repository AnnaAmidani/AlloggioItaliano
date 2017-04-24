package anna.alit.jee;

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
 * @created Jun 19, 2009
 */
@SuppressWarnings("serial")
public class ImageServlet extends HttpServlet
{

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
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
  @SuppressWarnings("unchecked")
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {

    HttpSession session = request.getSession();
    Integer idLoggato = (Integer) session.getAttribute("idLoggato");
    String imageNumber = (String) session.getAttribute("imageNumber");

    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    boolean uploaded = false;

    if(idLoggato == null)
    	return;

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
        log().error("Error during parseRequest(request): file not uploaded:" + e.getLocalizedMessage());
      }

      if(imageNumber.equals("20"))
      {
        uploaded = ImageServiceImpl.getInstance().addPdf(idLoggato, items);
      }
      else
      {
        uploaded = ImageServiceImpl.getInstance().addImage(imageNumber, idLoggato, items);
      }

    }

    RequestDispatcher dispatcher;

    if (uploaded)
    {
      String msg = "msg.immagine_caricata_correttamente_";
      if(imageNumber.equals("20"))
      {
        msg = "msg.file_caricato_correttamente_";
      }
      dispatcher = request.getRequestDispatcher( "/View/okImage.jsp?imagename=" + imageNumber + "&msg=" + msg );
    }
    else
    {
      String msg = "msg.immagine_non_caricata_correttamente";
      if(imageNumber.equals("20"))
      {
        msg = "msg.il_pdf_non_e_stato_caricato_correttamente";
      }

      String nextPage = null;
      if ( imageNumber.equals("11") || imageNumber.equals("12") )
        nextPage = "/View/pubblicita.jsp";
      else
        nextPage = "/View/Registrazione3.jsp";

      dispatcher = request.getRequestDispatcher( "/View/errorPage.jsp?msg=" + msg + "&nextPage=" + nextPage );
    }

    dispatcher.forward(request, response);
  }

}
