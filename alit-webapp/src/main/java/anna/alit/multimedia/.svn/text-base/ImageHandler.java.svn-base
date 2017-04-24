package anna.alit.multimedia;

import java.io.*;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.io.IOUtils;

import anna.alit.servicebb.DbmsImpl;

public class ImageHandler
{

  public static void write(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {

    Integer idAzienda = 44;//(Integer)request.getAttribute("idLoggato");
    String imageNumber = "01";//(String)request.getAttribute("imageNumber");

    String sql = "select img" + imageNumber + " from immagini where id_datiaziende=" + idAzienda;

    ResultSet rs;

    try
    {
      rs = DbmsImpl.getInstance().executeQuery(sql);
      if( rs == null || ! rs.next() )
      {
        //TODO: NO image ????
        return;
      }
      response.setContentType("image/jpeg");
      InputStream inputStream;
      inputStream = rs.getBinaryStream("img" + imageNumber);
      IOUtils.copy(inputStream, response.getOutputStream());
      response.setContentType("text/html");
    }
    catch (Exception e)
    {
      //TODO: log error
    }
  }
}
