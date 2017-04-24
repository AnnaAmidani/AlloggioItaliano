/* $Id: AlitDatastoreAction.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Contacta, http://openinnovation.it - roberto grasso, michele bianchi
 * Copyright(C) 1998-2009 [an5tash@gmail.com]
 *
 * This program is free software; you can redistribute it and/or modify it under the terms
 * of the GNU General Public License v2 as published by the Free Software Foundation
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details. http://gnu.org/licenses/gpl-2.0.txt
 *
 * You should have received a copy of the GNU General Public License along with this program;
 * if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */
package anna.alit.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.xwork.StringUtils;
import org.apache.struts2.json.annotations.SMDMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import anna.alit.dao.AziendeDao;
import anna.alit.dao.BannersDao;
import anna.alit.model.AziendeModel;
import anna.alit.model.Banners;
import anna.alit.utilities.UtilService;
import mic.organic.gateway.DatastoreJson;
import mic.organic.gateway.DefaultDatastoreJson;
import mic.organic.web.struts2.AbstractDatastoreAction;


/**
 *
 *
 * @author mic
 * @created Jun 10, 2009
 */
@Service("datastoreAction")
@Scope("prototype")
public class AlitDatastoreAction extends AbstractDatastoreAction
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired private AziendeDao aziendeDao;
  @Autowired private BannersDao bannersDao;
  @Autowired private AdminActions adminActions;

  //private AziendeConverter aziendeConverter = new AziendeConverter();
  //private BannersConverter bannersConverter = new BannersConverter();

  private byte[] bannerfile;
  private int id;

  private String namePattern;
  private String tipoPattern;
  private String siglaPattern;
  private String comunePattern;
  private String sponsor;
  private String link;
  private String regio;
  private String tipolo;
  private Date dal;
  private Date al;
  private String posizione;
  private String denominazione;
  private String tipologia;
  private String mail;
  private String web;
  private String telefono;
  private String cellulare;
  private String fax;
  private String comune;
  private String sigla;
  private String indirizzo;
  private String m_tipologia;
  private String m_sigla;
  private String i_denominazione;
  private String i_tipologia;
  private String i_mail;
  private String i_web;
  private String i_telefono;
  private String i_cellulare;
  private String i_fax;
  private String i_comune;
  private String i_sigla;
  private String i_indirizzo;

  /*
  *
  */
 public AlitDatastoreAction()
 {
   super();
 }


 public String getSponsor() {
		return sponsor;
	}




	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}




	public String getLink() {
		return link;
	}




	public void setLink(String link) {
		this.link = link;
	}




	public String getRegio() {
		return regio;
	}




	public void setRegio(String regio) {
		this.regio = regio;
	}




	public String getTipolo() {
		return tipolo;
	}




	public void setTipolo(String tipolo) {
		this.tipolo = tipolo;
	}




	public Date getDal() {
		return dal;
	}




	public void setDal(Date dal) {
		this.dal = dal;
	}




	public Date getAl() {
		return al;
	}




	public void setAl(Date al) {
		this.al = al;
	}




	public String getPosizione() {
		return posizione;
	}




	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}




	public byte[] getBanner() {
		return bannerfile;
	}




	public void setBanner(byte[] bannerfile) {
		this.bannerfile = bannerfile;
	}


  public String getM_tipologia()
  {
    return m_tipologia;
  }


  public void setM_tipologia(String mTipologia)
  {
    this.m_tipologia = mTipologia;
  }


  public String getM_sigla()
  {
    return m_sigla;
  }


  public void setM_sigla(String mSigla)
  {
    this.m_sigla = mSigla;
  }


  public String getTipoPattern()
  {
    return tipoPattern;
  }


  public void setTipoPattern(String tipoPattern)
  {
    this.tipoPattern = tipoPattern;
  }


  public String getSiglaPattern()
  {
    return siglaPattern;
  }


  public void setSiglaPattern(String siglaPattern)
  {
    this.siglaPattern = siglaPattern;
  }


  public String getComunePattern()
  {
    return comunePattern;
  }


  public void setComunePattern(String comunePattern)
  {
    this.comunePattern = comunePattern;
  }

  public String getI_denominazione()
  {
    return i_denominazione;
  }


  public void setI_denominazione(String iDenominazione)
  {
    this.i_denominazione = iDenominazione;
  }


  public String getI_tipologia()
  {
    return i_tipologia;
  }


  public void setI_tipologia(String iTipologia)
  {
    this.i_tipologia = iTipologia;
  }


  public String getI_mail()
  {
    return i_mail;
  }


  public void setI_mail(String iMail)
  {
    this.i_mail = iMail;
  }


  public String getI_web()
  {
    return i_web;
  }


  public void setI_web(String iWeb)
  {
    this.i_web = iWeb;
  }


  public String getI_telefono()
  {
    return i_telefono;
  }


  public void setI_telefono(String iTelefono)
  {
    this.i_telefono = iTelefono;
  }


  public String getI_cellulare()
  {
    return i_cellulare;
  }


  public void setI_cellulare(String iCellulare)
  {
    this.i_cellulare = iCellulare;
  }


  public String getI_fax()
  {
    return i_fax;
  }


  public void setI_fax(String iFax)
  {
    this.i_fax = iFax;
  }


  public String getI_comune()
  {
    return i_comune;
  }


  public void setI_comune(String iComune)
  {
    this.i_comune = iComune;
  }


  public String getI_sigla()
  {
    return i_sigla;
  }


  public void setI_sigla(String iSigla)
  {
    this.i_sigla = iSigla;
  }


  public String getI_indirizzo()
  {
    return i_indirizzo;
  }


  public void setI_indirizzo(String iIndirizzo)
  {
    this.i_indirizzo = iIndirizzo;
  }


  public int getId()
  {
    return id;
  }

  public void setId(int id)
  {
    this.id = id;
  }

  public String getDenominazione()
  {
    return denominazione;
  }


  public void setDenominazione(String denominazione)
  {
    this.denominazione = denominazione;
  }


  public String getTipologia()
  {
    return tipologia;
  }


  public void setTipologia(String tipologia)
  {
    this.tipologia = tipologia;
  }


  public String getMail()
  {
    return mail;
  }


  public void setMail(String mail)
  {
    this.mail = mail;
  }


  public String getWeb()
  {
    return web;
  }


  public void setWeb(String web)
  {
    this.web = web;
  }


  public String getTelefono()
  {
    return telefono;
  }


  public void setTelefono(String telefono)
  {
    this.telefono = telefono;
  }


  public String getCellulare()
  {
    return cellulare;
  }


  public void setCellulare(String cellulare)
  {
    this.cellulare = cellulare;
  }


  public String getFax()
  {
    return fax;
  }


  public void setFax(String fax)
  {
    this.fax = fax;
  }


  public String getComune()
  {
    return comune;
  }


  public void setComune(String comune)
  {
    this.comune = comune;
  }


  public String getSigla()
  {
    return sigla;
  }


  public void setSigla(String sigla)
  {
    this.sigla = sigla;
  }


  public String getIndirizzo()
  {
    return indirizzo;
  }


  public void setIndirizzo(String indirizzo)
  {
    this.indirizzo = indirizzo;
  }


  /**
   * @return the namePattern
   */
  public String getNamePattern()
  {
    return namePattern;
  }

  /**
   * @param namePattern the namePattern to set
   */
  public void setNamePattern(String namePattern)
  {
    this.namePattern = namePattern;
  }


  /*
   *
   */
  @SMDMethod
  public String aziende()
  {
	List<AziendeModel> jsonList = new ArrayList<AziendeModel>();

	if(StringUtils.isNotEmpty(namePattern) && StringUtils.isNotEmpty(siglaPattern))
	{
	  jsonList = aziendeDao.matchByNameAndSigla(namePattern, siglaPattern);
	}
	else if(StringUtils.isNotEmpty(namePattern) && StringUtils.isEmpty(siglaPattern))
	{
      jsonList = aziendeDao.matchByName(namePattern);
	}
	else if(StringUtils.isEmpty(namePattern) && StringUtils.isNotEmpty(siglaPattern))
	{
      jsonList = aziendeDao.matchBySigla(siglaPattern);
	}
	//DEFAULT_DATASTORE_TITLE
	DatastoreJson<AziendeModel> datastore = new DefaultDatastoreJson<AziendeModel>(DatastoreJson.IDENTIFIER, DatastoreJson.LABEL, jsonList);
  setStore(datastore);
  return SUCCESS;
  }


  /*
  *
  */
 @SMDMethod
 public String banner()
 {
/*
   BannersJson bannersJson = new BannersJson();
   List<BannersJson> jsonList = new ArrayList<BannersJson>();
*/
   List<Banners> modelList = bannersDao.findAll();

/*
   for(Banners banner : modelList)
   {
     bannersJson = bannersConverter.modelToJson(banner);
     jsonList.add(bannersJson);
   }
*/
   //DEFAULT_DATASTORE_TITLE
   DatastoreJson<Banners> datastore = new DefaultDatastoreJson<Banners>(DatastoreJson.IDENTIFIER, DatastoreJson.LABEL, modelList);
   setStore(datastore);
   return SUCCESS;
 }

  /*
  *
  */
 @SMDMethod
 public String insert()
 {
   AziendeModel aziendeModel = new AziendeModel();

   aziendeModel.setTipologia(i_tipologia);
   aziendeModel.setTipoesteso(UtilService.extractTipo(i_tipologia));
   aziendeModel.setDenominazione(UtilService.alitRequestFormatter(i_denominazione));
   aziendeModel.setMail(i_mail);
   aziendeModel.setWeb(i_web);
   aziendeModel.setTelefono(i_telefono);
   aziendeModel.setCellulare(i_cellulare);
   aziendeModel.setFax(i_fax);
   aziendeModel.setComune(UtilService.alitRequestFormatter(i_comune));
   aziendeModel.setSigla(i_sigla);
   aziendeModel.setIndirizzo(UtilService.alitRequestFormatter(i_indirizzo));
   aziendeModel.setPunteggio(0);

   //aziendeDao.insertNew(aziendeModel);

   int res = adminActions.insert(aziendeModel);
   if(res == 0)
   {
     log().warn("the insert failed");
   }
   return SUCCESS;
 }

 /*
  *
  */
 @SMDMethod
 public String insertBanner()
 {
   Banners banner = new Banners();

   banner.setSponsor(sponsor);
   banner.setLink(link);
   banner.setRegione(regio);
   banner.setTipologia(tipolo);
   banner.setFromthe(dal);
   banner.setTothe(al);

   if(StringUtils.equals(posizione, "dx"))
   {
	 banner.setBannerdx(bannerfile);
   }
   else if(StringUtils.equals(posizione, "sx"))
   {
	 banner.setBannersx(bannerfile);
   }

   int res = adminActions.insertBanner(banner);
   if(res == 0)
   {
     log().warn("the insert failed");
   }
   return SUCCESS;
 }

/*
 *
 */
 @SMDMethod
public String update()
{
  AziendeModel aziendeModel = new AziendeModel();

  aziendeModel.setTipologia(tipologia);
  aziendeModel.setTipoesteso(UtilService.extractTipo(tipologia));
  aziendeModel.setDenominazione(UtilService.alitRequestFormatter(denominazione));
  aziendeModel.setMail(mail);
  aziendeModel.setWeb(web);
  aziendeModel.setTelefono(telefono);
  aziendeModel.setCellulare(cellulare);
  aziendeModel.setFax(fax);
  aziendeModel.setComune(UtilService.alitRequestFormatter(comune));
  aziendeModel.setSigla(sigla);
  aziendeModel.setIndirizzo(UtilService.alitRequestFormatter(indirizzo));
  aziendeModel.setPunteggio(0);

  int res = adminActions.update(aziendeModel, id);
  if(res == 0)
  {
    log().warn("the update failed");
  }
  return SUCCESS;
}


 public String delete()
 {
   int res = adminActions.delete(Integer.toString(id));
   if(res == 0)
   {
     log().warn("the delete failed");
   }
   return SUCCESS;
 }

 public String subscription()
 {
   int res = adminActions.subscription(Integer.toString(id), true);
   if(res == 0)
   {
     log().warn("the add subscription failed");
   }
   return SUCCESS;
 }

 public String delSubscription()
 {
   int res = adminActions.subscription(Integer.toString(id), false);
   if(res == 0)
   {
     log().warn("the add subscription failed");
   }
   return SUCCESS;
 }

 public String mailList()
 {
   adminActions.sendMailListParam(m_sigla, m_tipologia);
   return SUCCESS;
 }

}
