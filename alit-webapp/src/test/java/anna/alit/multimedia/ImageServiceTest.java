package anna.alit.multimedia;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import static org.testng.Assert.*;



@ContextConfiguration(locations = { "/test-image.spring.xml" })
public class ImageServiceTest extends AbstractTestNGSpringContextTests{

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

//  @Autowired private ImageService imageService;
//  @Autowired private ManipulateImage manipulateImage;

//  @Test
  public void testNameOfImage()
  {
    try
    {
//      String imageNumber, idLoggato = "35";
//      String foundName;
//
//      // test: search name of a not present image
//      imageNumber = "09";
//
//      // test: search name of a present image
//      imageNumber = "02";
//      foundName = "35";//immService.nameOfImage(idLoggato, imageNumber);
//      assertEquals(foundName, "02.jpg", "The 02 image is present in test directory.");
    }
    catch(Exception e)
    {
      log().error(":", e);
      assertTrue(false, "test throws an unexpected exception.");
    }
  }

//  @Test
//  public void elaborateImage() throws Exception
//  {
//    FileObject inFo = VFS.getManager().resolveFile("res:guru.png");
//    FileObject outFo = VFS.getManager().resolveFile("/home/users/mic/Desktop/out.jpg");
//
//    InputStream istream = inFo.getContent().getInputStream();
//    OutputStream ostream = outFo.getContent().getOutputStream();
//
//    imageService.elaborateImage(istream, "11");
//
//    outFo.close();
//
//    assertTrue(outFo.exists());
//    assertEquals(outFo.getContent().getSize(), 2560);
//  }

}
