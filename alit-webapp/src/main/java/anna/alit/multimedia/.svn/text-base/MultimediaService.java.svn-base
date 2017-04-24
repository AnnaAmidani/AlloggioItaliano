package anna.alit.multimedia;

import java.io.File;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.vfs.FileObject;


public class MultimediaService
{

  public static File uploadItem(FileItem item, FileObject tempFo)
  {
    String finalname = null;
    try
    {
      String itemName = item.getName();
      Random generator = new Random();
      int r = Math.abs(generator.nextInt());

      String reg = "[.*]";
      String replacingtext = "";
      System.out.println("Text before replacing is:-" + itemName);
      Pattern pattern = Pattern.compile(reg);
      Matcher matcher = pattern.matcher(itemName);
      StringBuffer buffer = new StringBuffer();

      while (matcher.find())
      {
        matcher.appendReplacement(buffer, replacingtext);
      }
      int IndexOf = itemName.indexOf(".");
      String domainName = itemName.substring(IndexOf);
      System.out.println("domainName: " + domainName);

      finalname = buffer.toString() + "_" + r + domainName;
      System.out.println("Final Image === " + finalname);

    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    File savedFile = new File(tempFo + finalname);

    try
    {
      item.write(savedFile);
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }

    return savedFile;
  }


  public static void clearDir(File directory)
  {
    File[] files = directory.listFiles();

    for (File f : files)
      f.delete();
  }


  public static String getOnlyName(String fileName)
  {
    int index = fileName.lastIndexOf('.');

    return fileName.substring(0, index);
  }


  public static String getExtension(String fileName)
  {
    fileName = fileName.toLowerCase();

    if (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg"))
      return ".jpg";

    if (fileName.endsWith(".png"))
      return ".png";

    if (fileName.endsWith(".tif") || fileName.endsWith(".tiff"))
      return ".tif";

    if (fileName.endsWith(".gif"))
      return ".gif";

    if (fileName.endsWith(".pdf"))
      return ".pdf";

    if (fileName.endsWith(".eps"))
      return ".eps";

    return "unknown";
  }

}
