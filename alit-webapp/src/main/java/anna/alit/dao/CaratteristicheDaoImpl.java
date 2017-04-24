/* $Id: AziendeDaoImpl.java 308 2010-05-03 21:42:13Z anna.amidani $
 *
 * Copyright(C) 2007 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import anna.alit.model.Caratteristiche;
import mic.organic.core.AbstractDao;
import static mic.organic.core.OrganicConstants.*;


/**
 *
 * @author         an5tash@gmail.com
 * @version        $Revision: 308 $
 */
@Repository
public class CaratteristicheDaoImpl extends AbstractDao<Caratteristiche> implements CaratteristicheDao
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  /*
   *
   */
  public CaratteristicheDaoImpl()
  {
    super(Caratteristiche.class, CODE);
  }


  /*
   *
   */
  @Transactional(readOnly=true)
  public Caratteristiche findByCode(String code)
  {
    return super.findBySmth(code);
  }

  /*
   * @see anna.alit.dao.AziendeDao#matchByName(java.lang.String)
   */
  @Override
  public List<Caratteristiche> matchByName(String namePattern)
  {
    String query = "from Caratteristiche where username like '%"+namePattern+"%'";
    //List<Titolare> list = entityManager.createQuery(query).setParameter("value", "%"+namePattern+"%").getResultList();
    List<Caratteristiche> list = DaoService.castList(Caratteristiche.class, entityManager.createQuery(query).getResultList());
    return list;
  }

}
