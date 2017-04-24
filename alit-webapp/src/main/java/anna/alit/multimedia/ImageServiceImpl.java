/* $Id: ImageServiceImpl.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.multimedia;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.media.jai.JAI;
import javax.media.jai.OpImage;
import javax.media.jai.PlanarImage;
import javax.media.jai.RenderedOp;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.vfs.FileSystemException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.sun.media.jai.codec.SeekableStream;

import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;
import anna.alit.multimedia.ManipulateImage.Scale;
import anna.alit.servicebb.Dbms;

/**
 * @author anna
 * @created Jun 2, 2009
 */
@Service(ImageService.SERVICE_NAME)
public class ImageServiceImpl implements ImageService
{
  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  private String[] acceptedFormats = { "jpg", "jpeg", "tif", "tiff", "gif", "pdf" };

  //private String basePath = "/usr/java/apache-tomcat-6.0.18/webapps/alloggio"; // path directory:   alloggio
  //private FileObject baseFo;

  @Autowired (required=false) private Dbms dbms;
  @Autowired private ManipulateImage manipulateImage;

  /*
   *
   */
  public static ImageService getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    ImageService service = (ImageService) (applicationContext.getBean(ImageService.SERVICE_NAME));
    return service;
  }


  /*
   *
   */
  public ImageServiceImpl()
  {
    super();
  }


  /**
   * @param item
   * @param ext
   */
  private boolean checkExtension(FileItem item, String ext)
  {
    if (StringUtils.endsWith(item.getName().toLowerCase(), "."+ext))
    {
      return true;
    }
    return false;
  }


  /*
   *
   */
  private List<FileItem> loadFile(List<FileItem> items)
  {
    List<FileItem> acceptedList = new ArrayList<FileItem>();
    for (FileItem item : items)
    {
      if (!item.isFormField())
      {
        for (String ext : acceptedFormats)
        {
          if (checkExtension(item, ext))
          {
            acceptedList.add(item);
          }
        }
      }
    }
    return acceptedList;
  }

  /*
   * @see anna.alit.multimedia.ImageService#addImage(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  @Override
  public boolean addImage(String imageNumber, Integer idLoggato, List<FileItem> items) throws FileSystemException
  {
    if (idLoggato == null)
    {
      log().warn("wrong initial conditions: idLoggato = " + idLoggato);
      return false;
    }

    // load file
    items = loadFile(items);
    if (items.size() == 0)
    {
      log().warn("Nessun file con estensione valida trovato negli items.");
      return false;
    }

    try
    {
      FileItem item = items.get(0);
      if(item == null)
      {
        log().error("item == null");
        return false;
      }

      if(item.getSize() > 8388608)
      {
      	log().warn("l'immagine pesa più di 8MB: upload bloccato");
      	return false;
      }

      String imageName = item.getName();

      ParamsMap map = elaborateUploadedFile(item, idLoggato, imageNumber);
      ByteArrayOutputStream byteArrayOutputStream = (ByteArrayOutputStream) map.get("outputStream");

      if(byteArrayOutputStream == null)
      {
        log().error("Errore durante upload/elaborazione dell'immagine");
        return false;
      }

      byte[] buf = byteArrayOutputStream.toByteArray();

      InputStream inputStream = new ByteArrayInputStream(buf);

      int height = (Integer) map.get("height");
      int width = (Integer) map.get("width");

      String insert = getImgInsertOrUpdate(idLoggato, imageNumber, imageName, buf.length, height, width);

      int result = dbms.insertImage(insert, inputStream, (int)buf.length);
      inputStream.close();

      if( result == 1)
        return true;
      else
      {
        log().error("\n\tFAILED: insert immagini: {} rows_updated", result);
        return false;
      }
    }
    catch (Exception e)
    {
      log().error(":", e);
      return false;
    }
  }

  /*
   * @see anna.alit.multimedia.ImageService#addImage(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  @Override
  public boolean addBanners(List<FileItem> items, String posizione, String regione, String tipologia, String fromthe, String tothe, String sponsor, String link) throws FileSystemException
  {
    items = loadFile(items);
    if (items.size() == 0)
    {
      log().warn("Nessun file con estensione valida trovato negli items.");
      return false;
    }

    try
    {
      FileItem item = items.get(0);
      if(item == null)
      {
        log().error("item == null");
        return false;
      }

      if(item.getSize() > 8388608)
      {
        log().warn("l'immagine pesa più di 8MB: upload bloccato");
        return false;
      }

      String imageName = item.getName();

      long dim = item.getSize();
      log().info("peso di item.getSize "+dim);

      InputStream inputStream = (InputStream)item.getInputStream();

      if(inputStream == null)
      {
        log().error(" inputStream == null ");
        return false;
      }

      int size = inputStream.available();
      log().info("peso di inputStream.available() "+size);

      String update = "insert into banners (banner"+posizione+", sponsor, fromthe, tothe, tipologia, regione, filename, size, link) values" +
                  		" ( ? , '"+sponsor+"', '"+fromthe+"', '"+tothe+"', '"+tipologia+"', '"+regione +"', '"+imageName+"', "+dim+", '"+link+"');";

      int rows_updated = dbms.insertImage(update, inputStream, size);

      inputStream.close();

      if( rows_updated == 1)
      {
        return true;
      }
      else
      {
        log().error("\n\tFAILED: insert banner");
        return false;
      }
    }
    catch(Exception e)
    {
      log().error(e.getLocalizedMessage());
    }

    log().error("unknow error !!!");
    return false;
  }


  @Override
  public boolean addPdf(Integer idLoggato, List<FileItem> items) throws FileSystemException
  {
    if (idLoggato == null)
    {
      log().warn("wrong initial conditions: idLoggato = " + idLoggato);
      return false;
    }

    items = loadFile(items);
    if (items.size() == 0)
    {
      log().warn("Nessun file con estensione valida trovato negli items.");
      return false;
    }

    try
    {
      FileItem item = items.get(0);

      if(item == null)
      {
        log().error(" item == null ");
        return false;
      }

      if(item.getSize() > 2097152)
      {
      	log().warn("il pdf pesa più di 2 mega byte: upload bloccato");
      	return false;
      }

      String pdfName = item.getName();

      if( pdfName == null )
      {
        log().error(" pdfName == null ");
        return false;
      }
      pdfName = pdfName.replace(" ", "_");


      InputStream inputStream = (InputStream)item.getInputStream();

      if(inputStream == null)
      {
        log().error(" inputStream == null ");
        return false;
      }

      int size = inputStream.available();

      String insert = getPdfInsertOrUpdate(idLoggato, pdfName, size);

      int rows_updated = dbms.insertImage(insert, inputStream, size);
      inputStream.close();

      if( rows_updated == 1)
        return true;
      else
      {
        log().error("\n\tFAILED: insert pdf");
        return false;
      }
    }
    catch (Exception e)
    {
      log().error(":", e);
    }

    log().error("unknow error !!!");
    return false;
  }


  private String getImgInsertOrUpdate(Integer idLoggato, String imageNumber, String imageName, int imageSize, int height, int width)
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String data = sdf.format(new Date());
    int exists = 0;
    String sql_check = "select count(image_number) as exists from immagini where" +
    		" id_datiaziende=" + idLoggato + " and image_number='" + imageNumber + "'";
    String sql_update = "";
    try
    {
      ResultSet rs = dbms.executeQuery(sql_check);

      if(rs != null && rs.next())
        exists = rs.getInt("exists");

      if(exists == 1)
      {
        sql_update = "update immagini set image_file = ?" +
        		", upload_date='" + data + "', image_name='" + imageName + "', image_size=" + imageSize +
        		", height=" + height + ", width=" + width +
        		" where id_datiaziende=" + idLoggato + " and image_number='" + imageNumber + "'";
      }
      if(exists == 0)
      {
        sql_update = "insert into immagini(image_file, upload_date, image_name, image_size, height, width, image_number, id_datiaziende)" +
        		" values( ? , '" + data + "', '"+ imageName+ "', " + imageSize + ", " + height + ", " + width +
        		", '" + imageNumber+ "', " + idLoggato + ");";
      }

    }
    catch(Exception e)
    {
	  log().warn("unexpected exception thrown by getInsertOrUpdate method");
    }

    return sql_update;
  }

  private String getPdfInsertOrUpdate(Integer idLoggato, String pdfName, int size)
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String data = sdf.format(new Date());
    int exists = 0;
    String sql_check = "select count(id_aziende) as exists from brochure where id_aziende=" + idLoggato;
    String sql_update = "";
    try
    {
      ResultSet rs = dbms.executeQuery(sql_check);

      if(rs != null && rs.next())
        exists = rs.getInt("exists");

      if(exists == 1)
      {
        sql_update =
          "update brochure set brochure = ?, file_title='" + pdfName + "'," +
        	" size=" + size + ", upload_date='" + data + "' where id_aziende=" + idLoggato + ";";
      }
      if(exists == 0)
      {
        sql_update =
          "insert into brochure(brochure, file_title, size, upload_date, id_aziende)" +
        	" values( ? , '" + pdfName + "', " + size + ", '" + data + "', " + idLoggato + ");";
      }

    }
    catch(Exception e)
    {
	  log().warn("unexpected exception thrown by getInsertOrUpdate method");
    }

    return sql_update;
  }

  private ParamsMap elaborateUploadedFile(FileItem item, int idLoggato, String imageNumber) {

      // write extension in log file
      String extension = item.getName().substring(item.getName().lastIndexOf('.'));
      log().info("extension = {}", extension);

      ParamsMap map = null;

      try
      {
        // trasform the uploaded image in a normalized JPEG
        map =  elaborateImage(item.getInputStream(), imageNumber);
        log().info("ImageServlet: JPEG normalized.");
      }
      catch(Exception ex)
      {
        log().error(":", ex);
      }

      return map;
  }


  /*
   * @see anna.alit.multimedia.ImageService#elaborateImage(java.io.InputStream, java.io.OutputStream, int, int)
   */
  @Override
  public ParamsMap elaborateImage(InputStream istream, String imageNumber) throws IOException
  {
    ParamsMap map = new ParamsMapImpl();

    ByteArrayOutputStream outStream = new ByteArrayOutputStream();

    SeekableStream s = SeekableStream.wrapInputStream(istream, true);

    RenderedOp image = JAI.create("stream", s);

    ((OpImage)image.getRendering()).setTileCache(null);

    PlanarImage planarImage = manipulateImage.image_without_alpha(image);
    if(imageNumber.equals("11") || imageNumber.equals("12"))
    {
      planarImage = manipulateImage.scale(image, 190, 70, Scale.NOT_PROPORTIONAL);
    }
    else
    {
      planarImage = manipulateImage.scale(image, 350, 250, Scale.PROPORTIONAL_MIN);
    }

    JAI.create("encode", planarImage, outStream, "JPEG", null);


    log().info("ImageServlet: JPEG normalized.");

    map.put("outputStream", outStream);
    map.put("height", planarImage.getHeight());
    map.put("width", planarImage.getWidth());

    return map;
  }


///**
//* @return the basePath
//*/
//@PostConstruct
//public void startUp()
//{
// try
// {
//   //baseFo = VFS.getManager().resolveFile(basePath);
//   //log().info("baseFo={}", baseFo.getName().getPath());
// }
// catch (FileSystemException e)
// {
//   log().warn(e.getMessage(), e);
// }
//}

///**
//* @return the baseFo of this object.
//*/
//public FileObject getBaseFo()
//{
// return baseFo;
//}
///**
//* @return the basePath of this object.
//*/
//public String getBasePath()
//{
// return basePath;
//}

///**
//* @param basePath the basePath to set
//*/
//public void setBasePath(String basePath)
//{
// this.basePath = basePath;
//}



///**
//* @param imagename
//* @param userImageFo
//* @throws FileSystemException
//*/
//private void deleteOldImages(String imagename, FileObject userImageFo) throws FileSystemException
//{
// // se il file è già stato caricato cancello quello presente
// for (FileObject foto : userImageFo.getChildren())
// {
//   if (foto.getName().getBaseName().contains(imagename))
//   {
//     foto.delete();
//   }
// }
//}




//  @Deprecated
//  protected PlanarImage toPlanarImage(FileItem file)
//  {
//
//    BufferedImage bufferedImage;
//    ImageReader imageReader = ImageIO.getImageReadersByFormatName("jpeg").next();
//    try
//    {
//      imageReader.setInput(file.getInputStream(), true, false); // throws exception
//      bufferedImage = imageReader.read(0);
//    }
//    catch (IOException e)
//    {
//      log().error(":", e);
//      return null;
//    }
//
//    return PlanarImage.wrapRenderedImage(bufferedImage);
//
//  }


  /*
   * @see anna.alit.multimedia.ImageService#findImage(java.lang.String, java.lang.String)
   *
  @Override
  public FileObject findImage(String imagename, String idLoggato)
  {
    FileObject fo = null;
    try
    {
      FileObject userImageFo = baseFo.resolveFile("jpgs").resolveFile(String.valueOf(idLoggato));
      fo = userImageFo.resolveFile(imagename);
    }
    catch (FileSystemException e)
    {
      log().warn(e.getMessage(), e);
    }

    return fo;
  }*/


//  /**
//   * @param idLoggato
//   * @param imageNumber
//   */
//  private FileObject findMatchImage(String imagename, String idLoggato)
//  {
//    try
//    {
//      FileObject userImageFo = baseFo.resolveFile("jpgs").resolveFile(String.valueOf(idLoggato));
//
//      if(userImageFo.getType() == FileType.FOLDER)
//      {
//      for (FileObject fo : userImageFo.getChildren())
//      {
//        if (StringUtils.contains(fo.getName().getBaseName(), imagename))
//        {
//          return fo;
//        }
//      }
//      }
//      else
//      {
//        logger.info("userImageFo non esiste!!!");
//      }
//    }
//    catch (FileSystemException e)
//    {
//      log().error(":", e);
//    }
//    return null;
//  }


//  /**
//   * @param idLoggato
//   * @param imageNumber
//   */
//  @Override
//  public FileObject findImage(String imagename, String idLoggato)
//  {
//
//    FileObject fo = null;
//    try
//    {
//      FileObject userImageFo = baseFo.resolveFile("jpgs").resolveFile(String.valueOf(idLoggato));
//      fo = userImageFo.resolveFile(imagename);
//    }
//    catch (FileSystemException e)
//    {
//      log().error(":", e);
//    }
//    return fo;
//  }


//  /*
//   * @see anna.alit.multimedia.ImageService#nameOfImage(java.lang.String, java.lang.String)
//   */
//  @Override
//  public String nameOfImage(String idLoggato, String imageNumber)
//  {
//
//    int id = 0;
//
//    try
//    {
//      id = Integer.parseInt(idLoggato);
//    }
//    catch (Exception e)
//    {
//      return null;
//    }
//
//    return nameOfImage(id, imageNumber);
//  }


//  /*
//   * @see anna.alit.multimedia.ImageService#nameOfImage(java.lang.Integer, java.lang.String)
//   */
//  @Override
//  public String nameOfImage(Integer idLoggato, String imageNumber)
//  {
//    String name = null;
//    FileObject fo = findMatchImage(imageNumber, idLoggato.toString());
//    if (fo != null)
//    {
//      name = fo.getName().getBaseName();
//    }
//    return name;
//  }


}
