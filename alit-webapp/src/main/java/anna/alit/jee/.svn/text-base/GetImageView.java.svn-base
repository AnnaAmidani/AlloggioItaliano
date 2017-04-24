package anna.alit.jee;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.InputStream;
import anna.alit.servicebb.DbmsImpl;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@SuppressWarnings("serial")
public class GetImageView extends HttpServlet {

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    String imageNumber = "01";//(String)request.getAttribute("imageNumber");
    Integer idLoggato = 44;//(Integer)request.getAttribute("idLoggato");

    String sql = "select img01 from immagini where id_datiaziende=" + idLoggato;

    System.out.println(sql);

    try
    {
      InputStream inputStream;

      ResultSet rs;

      rs = DbmsImpl.getInstance().executeQuery(sql);

      if( rs != null && rs.next() )
      {
        response.setContentType("image/jpeg");
        inputStream = rs.getBinaryStream("img" + imageNumber);
        IOUtils.copy(inputStream, response.getOutputStream());
      }
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }

  }

}