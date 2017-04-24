package anna.alit.servicebb;

import java.sql.ResultSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

@Service(JspServiceImpl.SERVICE_NAME)
public class JspServiceImpl implements JspService
{

  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  /*
   *
   */
  public static JspService getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    JspService service = (JspService)(applicationContext.getBean(JspService.SERVICE_NAME));
    return service;
  }

  /*
   *
   */
  public JspServiceImpl()
  {
    log().info("");
  }


//  /* (non-Javadoc)
//   * @see anna.alit.servicebb.JspService#nameOfImage(java.lang.String, java.lang.String)
//   */
//  public String nameOfImage(String idLoggato, String imageNumber) {
//    return imageService.nameOfImage(idLoggato, imageNumber);
//  }
//
//  /* (non-Javadoc)
//   * @see anna.alit.servicebb.JspService#nameOfImage(java.lang.Integer, java.lang.String)
//   */
//  public String nameOfImage(Integer idLoggato, String imageNumber) {
//    return imageService.nameOfImage(idLoggato, imageNumber);
//  }
  public int[] imageDimensions(Integer idLoggato, String imageNumber)
  {
    return imageDimensions( idLoggato.toString(), imageNumber);
  }

  public int[] imageDimensions(String idLoggato, String imageNumber)
  {
    int[] dimensions = new int[2];

    String query =  " select width, height from immagini " +
      " where id_datiaziende = " + idLoggato + " and image_number='" + imageNumber + "' and image_file is not null";

    try
    {
      ResultSet rs = DbmsImpl.getInstance().executeQuery(query);

      if(rs == null ||  ! rs.next())
        return dimensions;

      dimensions[0] = rs.getInt("width");
      dimensions[1] = rs.getInt("height");

    }
    catch(Exception e)
    {
      log().error("-", e);
      return dimensions;
    }

    return dimensions;
  }


  public boolean imagePresent(Integer idLoggato, String imageNumber)
  {
    return imagePresent( idLoggato.toString(), imageNumber);
  }

  public boolean imagePresent(String idLoggato, String imageNumber)
  {
  	int result = 0;
  	boolean exists = false;
  	String query="";

  	if(imageNumber.equals("20"))
  	{
        query =  " select count(id_aziende) as result from brochure " +
        " where id_aziende = " + idLoggato + " and brochure is not null";
  	}
  	else
  	{
        query =  " select count(image_file) as result from immagini " +
                 " where id_datiaziende = " + idLoggato + " and image_number='" + imageNumber + "' and image_file is not null";
  	}

    try
    {
      ResultSet rs = DbmsImpl.getInstance().executeQuery(query);

      if(rs == null ||  ! rs.next())
        return false;

      result = rs.getInt("result");

      if(result > 0)
      {
        exists = true;
      }

    }
    catch(Exception e)
    {
      log().error("-", e);
      return false;
    }

    return exists;
  }

  public boolean imagePresent(String posizione, String regione, String tipologia)
  {
    int result = 0;
    boolean exists = false;
    String query="select count("+posizione+") as result from banners where tipologia='"+tipologia+"' and regione='"+regione+"' and "+posizione+" is not null";

    try
    {
      ResultSet rs = DbmsImpl.getInstance().executeQuery(query);

      if(rs == null ||  ! rs.next())
        return false;

      result = rs.getInt("result");

      if(result > 0)
      {
        exists = true;
      }

    }
    catch(Exception e)
    {
      log().error("-", e);
      return false;
    }

    return exists;
  }

}
