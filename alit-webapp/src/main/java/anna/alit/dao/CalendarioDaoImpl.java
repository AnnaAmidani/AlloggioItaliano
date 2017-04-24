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

import anna.alit.model.Calendario;
import mic.organic.core.AbstractDao;
import static mic.organic.core.OrganicConstants.*;


/**
 *
 * @author         an5tash@gmail.com
 * @version        $Revision: 308 $
 */
@Repository
public class CalendarioDaoImpl extends AbstractDao<Calendario> implements CalendarioDao
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  /*
   *
   */
  public CalendarioDaoImpl()
  {
    super(Calendario.class, CODE);
  }


  /*
   *
   */
  @Transactional(readOnly=true)
  public Calendario findByCode(String code)
  {
    return super.findBySmth(code);
  }

  /*
   * @see anna.alit.dao.AziendeDao#matchByName(java.lang.String)
   */
  @Override
  public List<Calendario> matchByName(String namePattern)
  {
    String query = "from Calendario where username like '%"+namePattern+"%'";
    //List<Titolare> list = entityManager.createQuery(query).setParameter("value", "%"+namePattern+"%").getResultList();
    List<Calendario> list = DaoService.castList(Calendario.class, entityManager.createQuery(query).getResultList());
    return list;
  }

}
