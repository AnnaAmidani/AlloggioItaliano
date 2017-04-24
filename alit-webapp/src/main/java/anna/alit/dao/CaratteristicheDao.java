/* $Id: AziendeDao.java 306 2010-05-01 08:28:07Z anna.amidani $
 *
 * Copyright(C) 2007 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.dao;

import java.util.List;

import anna.alit.model.Caratteristiche;
import mic.organic.core.Dao;


/**
 * @author mic
 *
 */
public interface CaratteristicheDao extends Dao<Caratteristiche>
{
  /*
  *
  */
  Caratteristiche findByCode(String code);

  /*
   *
   */
  List<Caratteristiche> matchByName(String namePattern);

}