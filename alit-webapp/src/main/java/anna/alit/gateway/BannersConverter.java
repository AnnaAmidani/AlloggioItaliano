/*
 * $Id: LocationConverter.java 114 2010-04-13 22:11:32Z an5tash $ Copyright(C) 2008 [an5tash@gmail.com] All Rights Reserved
 */
package anna.alit.gateway;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import anna.alit.json.BannersJson;
import anna.alit.model.Banners;


/**
 * @author an5tash
 * @created May 2010
 */

public class BannersConverter
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  /*
   *
   */
  public Banners jsonToModel(BannersJson json)
  {
    Banners model = new Banners();

    model.setTipologia(json.getTipologia());
    model.setRegione(json.getRegione());
    model.setBannerdx(json.getBannerdx());
    model.setBannersx(json.getBannersx());
    model.setFromthe(json.getFromthe());
    model.setTothe(json.getTothe());
    model.setSponsor(json.getSponsor());
    model.setFilename(json.getFilename());
    model.setSize(json.getSize());
    model.setLink(json.getLink());

    return model;
  }


  /*
   *
   */
  public BannersJson modelToJson(Banners model)
  {
    BannersJson json = new BannersJson();

    json.setTipologia(model.getTipologia());
    json.setRegione(model.getRegione());
    json.setBannerdx(model.getBannerdx());
    json.setBannersx(model.getBannersx());
    json.setFromthe(model.getFromthe());
    json.setTothe(model.getTothe());
    json.setSponsor(model.getSponsor());
    json.setFilename(model.getFilename());
    json.setSize(model.getSize());
    json.setLink(model.getLink());
    //json.setRegio(model.getRegione().getNomeregione());
    //json.setTipol(model.getTipologia().getNomeesteso());

    return json;
  }

}
