/* $Id: ImageService.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.multimedia;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.vfs.FileSystemException;

import anna.alit.beanbb.ParamsMap;

/**
 *
 * @author mic
 * @created Jun 2, 2009
 */
public interface ImageService
{
  String SERVICE_NAME =  "imageService";

  boolean addImage(String imageNumber, Integer idLoggato, List<FileItem> items) throws FileSystemException;

  boolean addBanners(List<FileItem> items, String posizione, String regione, String tipologia, String fromthe, String tothe, String sponsor, String link) throws FileSystemException;

  boolean addPdf(Integer idLoggato,List<FileItem> items) throws FileSystemException;

//  /**
//   * @param imagename
//   * @param idLoggato
//   * @return
//   */
//  FileObject findImage(String imagename, String idLoggato);

//  /**
//   * @param idLoggato
//   * @param imageNumber
//   * @return
//   */
//  String nameOfImage(String idLoggato, String imageNumber);
//
//  /**
//   * @param idLoggato
//   * @param imageNumber
//   * @return
//   */
//  String nameOfImage(Integer idLoggato, String imageNumber);


  /**
   * @param istream
   * @param ostream
   * @param imagename
   * @throws IOException
   */
  ParamsMap elaborateImage(InputStream istream, String imageNumber) throws IOException;

}
