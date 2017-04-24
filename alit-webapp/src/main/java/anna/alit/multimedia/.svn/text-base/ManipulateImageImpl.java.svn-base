package anna.alit.multimedia;

import java.awt.image.SampleModel;
import java.awt.image.renderable.ParameterBlock;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.media.jai.InterpolationBilinear;
import javax.media.jai.InterpolationNearest;
import javax.media.jai.JAI;
import javax.media.jai.KernelJAI;
import javax.media.jai.PlanarImage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service(ManipulateImageImpl.SERVICE_NAME)
public class ManipulateImageImpl implements ManipulateImage {

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }


  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#toScaledJpeg(javax.media.jai.PlanarImage, int, int, anna.alit.multimedia.ManipulateImageImpl.Scale)
   */
  public PlanarImage toScaledJpeg(PlanarImage planarImage, int size_x, int size_y, ManipulateImage.Scale scale_type)
  {
      // remove alpha band (if is present)
      planarImage = image_without_alpha( planarImage );

      // encode the image as JPEG
      OutputStream outputStream = new ByteArrayOutputStream();
      planarImage = JAI.create("encode", planarImage, outputStream, "JPEG", null);
      try { outputStream.close(); } catch (IOException e) {}

      // return scaled JPEG
      return scale(planarImage, size_x, size_y, scale_type);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#image_without_alpha(javax.media.jai.PlanarImage)
   */
  public PlanarImage image_without_alpha(PlanarImage input) {

      SampleModel sampleModel = input.getSampleModel();
      int number_of_bands = sampleModel.getNumBands();

      if (number_of_bands >= 3) {
          // Grab the R, G, and B bands
          return JAI.create("bandselect", input, new int[] { 0, 1, 2 });
      }

      return input;
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#scale(javax.media.jai.PlanarImage, int, int, anna.alit.multimedia.ManipulateImageImpl.Scale)
   */
  public PlanarImage scale(PlanarImage input, int size_x, int size_y, Scale scale_type) {

      int width = input.getWidth();
      int height = input.getHeight();

      float scale_x = size_x / (width * 1.0f);
      float scale_y = size_y / (height * 1.0f);

      if (scale_type == Scale.PROPORTIONAL_MIN) {
          if (scale_x > scale_y)
              scale_x = scale_y;
      }
      if (scale_type == Scale.PROPORTIONAL_MAX) {
          if (scale_x > scale_y)
              scale_y = scale_x;
      }

      log().info("scale_factor("+ scale_x + ", " + scale_y + ") --- new_size("+ scale_x*width + ", " + scale_y*height +")");

      ParameterBlock parameterBlock = new ParameterBlock();
      parameterBlock.addSource(input);
      parameterBlock.add(scale_x);
      parameterBlock.add(scale_y);
      parameterBlock.add(0.0f);
      parameterBlock.add(0.0f);
      parameterBlock.add(new InterpolationNearest());

      return JAI.create("scale", parameterBlock);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#scale(javax.media.jai.PlanarImage, float, float)
   */
  public PlanarImage scale(PlanarImage input, float scale_x, float scale_y) {
    ParameterBlock parameterBlock = new ParameterBlock();
    parameterBlock.addSource(input);
    parameterBlock.add(scale_x);
    parameterBlock.add(scale_y);
    parameterBlock.add(0.0f);
    parameterBlock.add(0.0f);
    parameterBlock.add(new InterpolationNearest());

    return JAI.create("scale", parameterBlock);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#invert(javax.media.jai.PlanarImage)
   */
  public PlanarImage invert(PlanarImage input) {
    return JAI.create("invert", input);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#convolve(javax.media.jai.PlanarImage, int)
   */
  public PlanarImage convolve(PlanarImage input, int kernelSize) {

    float[] kernelMatrix = new float[kernelSize * kernelSize];
    for (int k = 0; k < kernelMatrix.length; k++)
      kernelMatrix[k] = 1.0f / (kernelSize * kernelSize);

    KernelJAI kernel = new KernelJAI(kernelSize, kernelSize, kernelMatrix);

    return JAI.create("convolve", input, kernel);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#rotate(javax.media.jai.PlanarImage, int)
   */
  public PlanarImage rotate(PlanarImage input, int angle) {
    float radians_angle = (float) Math.toRadians(angle);
    float centerX = input.getWidth() / 2f;
    float centerY = input.getHeight() / 2f;

    ParameterBlock parameterBlock = new ParameterBlock();
    parameterBlock.addSource(input);
    parameterBlock.add(centerX);
    parameterBlock.add(centerY);
    parameterBlock.add(radians_angle);
    parameterBlock.add(new InterpolationBilinear());

    return JAI.create("rotate", parameterBlock);
  }

  /* (non-Javadoc)
   * @see anna.alit.multimedia.ManipulateImage#bandselect(javax.media.jai.PlanarImage, int[])
   */
  public PlanarImage bandselect(PlanarImage input, int[] out_band) {
    return JAI.create("bandselect", input, out_band);
  }

}
