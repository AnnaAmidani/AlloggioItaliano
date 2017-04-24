/*
 * $Id: LocationConverter.java 114 2010-04-13 22:11:32Z an5tash $ Copyright(C) 2008 [an5tash@gmail.com] All Rights Reserved
 */
package anna.alit.gateway;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import anna.alit.json.AziendeJson;
import anna.alit.model.AziendeModel;


/**
 * @author an5tash
 * @created May 2010
 */

public class AziendeConverter
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }


  /*
   *
   */
  public AziendeModel jsonToModel(AziendeJson aziendeJson)
  {
    AziendeModel aziendeModel = new AziendeModel();

    aziendeModel.setId(aziendeJson.getId());
    aziendeModel.setTipologia(aziendeJson.getTipologia());
    aziendeModel.setDenominazione(aziendeJson.getDenominazione());
    aziendeModel.setSigla(aziendeJson.getSigla());
    aziendeModel.setComune(aziendeJson.getComune());
    aziendeModel.setIndirizzo(aziendeJson.getIndirizzo());
    aziendeModel.setTelefono(aziendeJson.getTelefono());
    aziendeModel.setCellulare(aziendeJson.getCellulare());
    aziendeModel.setFax(aziendeJson.getFax());
    aziendeModel.setMail(aziendeJson.getMail());
    aziendeModel.setWeb(aziendeJson.getWeb());

    return aziendeModel;
  }


  /*
   *
   */
  public AziendeJson modelToJson(AziendeModel aziendeModel)
  {
    AziendeJson aziendeJson = new AziendeJson();

    aziendeJson.setId(aziendeModel.getId());
    aziendeJson.setTipologia(aziendeModel.getTipologia());
    aziendeJson.setDenominazione(aziendeModel.getDenominazione());
    aziendeJson.setSigla(aziendeModel.getSigla());
    aziendeJson.setComune(aziendeModel.getComune());
    aziendeJson.setIndirizzo(aziendeModel.getIndirizzo());
    aziendeJson.setTelefono(aziendeModel.getTelefono());
    aziendeJson.setCellulare(aziendeModel.getCellulare());
    aziendeJson.setFax(aziendeModel.getFax());
    aziendeJson.setMail(aziendeModel.getMail());
    aziendeJson.setWeb(aziendeModel.getWeb());

    return aziendeJson;
  }

}
