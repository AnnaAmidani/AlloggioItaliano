package anna.alit.multimedia;

import javax.media.jai.PlanarImage;

public interface ManipulateImage {

  String SERVICE_NAME =  "manipulateImage";

  public static enum Scale {
    NOT_PROPORTIONAL, PROPORTIONAL_MIN, PROPORTIONAL_MAX
  }

  PlanarImage toScaledJpeg(PlanarImage planarImage, int size_x, int size_y, Scale scale_type);

  PlanarImage image_without_alpha(PlanarImage input);

  PlanarImage scale(PlanarImage input, int size_x, int size_y, Scale scale_type);

  PlanarImage scale(PlanarImage input, float scale_x, float scale_y);

  PlanarImage invert(PlanarImage input);

  PlanarImage convolve(PlanarImage input, int kernelSize);

  PlanarImage rotate(PlanarImage input, int angle);

  PlanarImage bandselect(PlanarImage input, int[] out_band);

}