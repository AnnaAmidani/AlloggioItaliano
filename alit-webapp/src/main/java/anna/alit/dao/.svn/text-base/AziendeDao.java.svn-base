/* $Id: AziendeDao.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2007 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.dao;

import java.util.List;

import anna.alit.model.AziendeModel;

import mic.organic.core.Dao;


/**
 * @author mic
 *
 */
public interface AziendeDao extends Dao<AziendeModel>
{
  /*
  *
  */
  AziendeModel findByCode(String code);


 /*
  *
  */
  AziendeModel findByAziendeId(int id);

  /*
  *
  */
  void insertNew(AziendeModel aziendeModel);

  /*
  *
  */
  void updateAziende(List<AziendeModel> list);


  /**
  *
  * @return

  AziendeJson prepareJson(String tipologia, String denominazione, String mail, String web, String telefono, String cellulare, String fax, String comune, String sigla, String indirizzo);
*/

  /*
   *
   */
  List<AziendeModel> matchByName(String namePattern);

 /*
  *
  */
  List<AziendeModel> matchBySigla(String siglaPattern);

 /*
  *
  */
  List<AziendeModel> matchByNameAndSigla(String namePattern, String siglaPattern);
}