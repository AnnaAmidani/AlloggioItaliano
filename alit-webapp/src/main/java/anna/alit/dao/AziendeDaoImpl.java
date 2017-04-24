/* $Id: AziendeDaoImpl.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2007 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.dao;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import anna.alit.model.AziendeModel;
import anna.alit.servicebb.DbmsImpl;
import anna.alit.servicebb.ServicesImpl;
import anna.alit.servicebb.TitolareServiceImpl;
import mic.organic.core.AbstractDao;
import static mic.organic.core.OrganicConstants.*;


/**
 *
 * @author         an5tash@gmail.com
 * @version        $Revision: 477 $
 */
@Repository
public class AziendeDaoImpl extends AbstractDao<AziendeModel> implements AziendeDao
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired
  protected DbmsImpl dbmsImpl;
  @Autowired
  protected ServicesImpl servicesImpl;
  @Autowired
  protected TitolareServiceImpl titolareServiceImpl;

  /*
   *
   */
  public AziendeDaoImpl()
  {
    super(AziendeModel.class, CODE);
  }

  /*
   *
   */
  @Transactional(readOnly=true)
  public AziendeModel findByCode(String code)
  {
    return super.findBySmth(code);
  }


  /*
   * @see anna.alit.dao.AziendeDao#findByAziendeId(anna.alit.model.AziendeId)
   */
  @Override
  public AziendeModel findByAziendeId(/*AziendeId aziendeId*/int id)
  {
    return null;
  }


  /*
   * @see anna.alit.dao.AziendeDao#matchByName(java.lang.String)
   */
  @Override
  public List<AziendeModel> matchByName(String namePattern)
  {
    if(namePattern.indexOf('\'') != -1) namePattern = namePattern.replace('\'', '`');
    String query = "from AziendeModel where lower(denominazione) like '%"+namePattern.toLowerCase()+"%'";
    //List<AziendeModel> list = entityManager.createQuery(query).setParameter("value", "%"+namePattern+"%").getResultList();
    List<AziendeModel> list = DaoService.castList(AziendeModel.class, entityManager.createQuery(query).getResultList());
    return list;
  }

  /*
   * @see anna.alit.dao.AziendeDao#matchBySigla(java.lang.String)
   */
  public List<AziendeModel> matchBySigla(String siglaPattern)
  {
    String query = "from AziendeModel where sigla ='"+siglaPattern.toUpperCase()+"'";
    List<AziendeModel> list = DaoService.castList(AziendeModel.class, entityManager.createQuery(query).getResultList());
    return list;
  }


  /*
   * @see anna.alit.dao.AziendeDao#matchByNameAndSigla(java.lang.String)
   */
  public List<AziendeModel> matchByNameAndSigla(String namePattern, String siglaPattern)
  {
    if(namePattern.indexOf('\'') != -1) namePattern = namePattern.replace('\'', '`');
    String query = "from AziendeModel where lower(denominazione) like '%"+namePattern.toLowerCase()+"%' and sigla='"+siglaPattern.toUpperCase()+"'";
    List<AziendeModel> list = DaoService.castList(AziendeModel.class, entityManager.createQuery(query).getResultList());
    return list;
  }

  /**
   *
   * @return
   */
  @Transactional
  @Override
  public void insertNew(AziendeModel aziendeModel)
  {

  }

  /*
   * @see anna.alit.dao.AziendeDao#updateAziende(java.lang.String)
   */
  public void updateAziende(List<AziendeModel> aziendeModelList)
  {
    for(AziendeModel azienda : aziendeModelList)
    {
      AziendeModel aziendeModel = new AziendeModel();
      aziendeModel.setTipologia(azienda.getTipologia());
      aziendeModel.setDenominazione(azienda.getDenominazione());
      aziendeModel.setSigla(azienda.getSigla());
      aziendeModel.setComune(azienda.getComune());
      aziendeModel.setIndirizzo(azienda.getIndirizzo());
      aziendeModel.setTelefono(azienda.getTelefono());
      aziendeModel.setCellulare(azienda.getCellulare());
      aziendeModel.setFax(azienda.getFax());
      aziendeModel.setMail(azienda.getMail());
      aziendeModel.setWeb(azienda.getWeb());
      aziendeModel.setPunteggio(0);

      update(aziendeModel);
    }
  }

}
