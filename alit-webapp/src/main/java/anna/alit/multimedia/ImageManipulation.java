package anna.alit.multimedia;

import java.awt.image.BufferedImage;
import java.awt.Graphics2D;
import java.awt.Image;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.vfs.FileObject;
import org.apache.commons.vfs.FileSystemException;

public class ImageManipulation
{

  /**
   * Convert the specified Image object in a BufferedImage object
   *
   * @param image Image to convert
   * @return BufferedImage that represent the Image specified
   */
  public static BufferedImage toBufferedImage(Image image)
  {
    return toBufferedImage(image, Image.SCALE_DEFAULT); // Image.SCALE_AREA_AVERAGING
  }


  /**
   * Convert the specified Image object in a BufferedImage object
   *
   * @param image Image to convert
   * @param type Type of conversion
   * @return BufferedImage that represent the Image specified
   */
  public static BufferedImage toBufferedImage(Image image, int type)
  {

    int w = image.getWidth(null);
    int h = image.getHeight(null);
    BufferedImage result = new BufferedImage(w, h, type);
    Graphics2D g = result.createGraphics();
    g.drawImage(image, 0, 0, null);
    g.dispose();
    return result;
  }


  /**
   * @throws FileSystemException
   *
   */
  public static boolean normalizeJpeg(FileItem item, FileObject dstFo) throws FileSystemException
  {
    BufferedImage image;
    ImageReader reader = ImageIO.getImageReadersByFormatName("jpeg").next();
    try
    {
      reader.setInput(item.getInputStream(), true, false);
      image = reader.read(0);
    }
    catch (IOException e)
    {
      return false;
    }

    int width = image.getWidth();
    int height = image.getHeight();

    if ((width * 1.0 / height) < (350.0 / 230.0))
    {
      width = 350;
      height = -1;
    }
    else
    {
      width = -1;
      height = 230;
    }

    Image rescaled = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    @SuppressWarnings("unused")
    BufferedImage output = ImageManipulation.toBufferedImage(rescaled);

//    ImageDecoder decoder = ImageCodec.createImageDecoder("jpeg", item.getInputStream(), null); //.createImageDecoder("tiff", seekableStream, null);
//    JPEGImageEncoder jpegEncoder = JPEGCodec.createImageEncoder("jpeg", dstFo.getContent().getOutputStream(), null); //.createJPEGEncoder(dstFo.getContent().getOutputStream());
//    JPEGEncodeParam jpegEncodeParam = jpegEncoder.getDefaultJPEGEncodeParam(output);
//    jpegEncodeParam.setDensityUnit(JPEGEncodeParam.DENSITY_UNIT_DOTS_INCH);
//    jpegEncodeParam.setXDensity(72);
//    jpegEncodeParam.setYDensity(72);

    try
    {
//      jpegEncoder.encode(output, jpegEncodeParam);
      dstFo.close();
    }
    catch (IOException e)
    {
      return false;
    }

    return true;
  }
}
