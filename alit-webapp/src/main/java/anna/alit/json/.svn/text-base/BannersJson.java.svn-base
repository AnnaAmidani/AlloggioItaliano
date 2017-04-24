/* $Id: ProcessJson.java 80 2010-04-30 15:41:18Z anna.amidani $
 *
 * Copyright(C) 2010 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.json;

import java.util.Date;

import mic.organic.gateway.AbstractJson;
import mic.organic.gateway.Json;

/**
 *
 * @author mic
 * @created Feb 19, 2010
 */
public class BannersJson extends AbstractJson implements Json
{
  private String tipologia;
  private String regione;
  private byte[] bannersx;
  private byte[] bannerdx;
  private Date fromthe;
  private Date tothe;
  private String sponsor;
  private String filename;
  private Long size;
  private String link;
  /*
   * this field (posizione) is just for GUI use!
   */
  private String posizione;


/*
  *
  */
 public BannersJson()
 {
   super();
 }


 public String getPosizione()
 {
   if(this.getBannerdx() != null)
   {
     posizione = "destra";
   }
   if(this.getBannersx() != null)
   {
     posizione = "sinistra";
   }
   return posizione;
 }


 public void setPosizione(String posizione)
 {
   this.posizione = posizione;
 }


  public String getTipologia()
  {
    return tipologia;
  }

  public void setTipologia(String tipologia)
  {
    this.tipologia = tipologia;
  }

  public String getRegione()
  {
    return regione;
  }

  public void setRegione(String regione)
  {
    this.regione = regione;
  }

  public byte[] getBannersx()
  {
    return bannersx;
  }

  public void setBannersx(byte[] bannersx)
  {
    this.bannersx = bannersx;
  }

  public byte[] getBannerdx()
  {
    return bannerdx;
  }

  public void setBannerdx(byte[] bannerdx)
  {
    this.bannerdx = bannerdx;
  }

  public Date getFromthe()
  {
    return fromthe;
  }

  public void setFromthe(Date fromthe)
  {
    this.fromthe = fromthe;
  }

  public Date getTothe()
  {
    return tothe;
  }

  public void setTothe(Date tothe)
  {
    this.tothe = tothe;
  }

  public String getSponsor()
  {
    return sponsor;
  }

  public void setSponsor(String sponsor)
  {
    this.sponsor = sponsor;
  }

  public String getFilename()
  {
    return filename;
  }

  public void setFilename(String filename)
  {
    this.filename = filename;
  }

  public Long getSize()
  {
    return size;
  }

  public void setSize(Long size)
  {
    this.size = size;
  }

  public String getLink()
  {
    return link;
  }

  public void setLink(String link)
  {
    this.link = link;
  }




}
