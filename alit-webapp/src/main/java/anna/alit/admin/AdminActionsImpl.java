package anna.alit.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.model.AziendeModel;
import anna.alit.model.Banners;
import anna.alit.servicebb.AlitServiceImpl;
import anna.alit.servicebb.DbmsImpl;
import anna.alit.servicebb.ServicesImpl;
import anna.alit.servicebb.TitolareServiceImpl;
import anna.alit.servicebb.UtilityServiceImpl;
import anna.alit.utilities.Aes;

/**
 * @author tash
 *
 */
@Service(AdminActionsImpl.SERVICE_NAME)
public class AdminActionsImpl implements AdminActions
{
  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired
  protected UtilityServiceImpl utilityService;
  @Autowired
  protected AlitServiceImpl alitService;
  @Autowired
  protected DbmsImpl dbmsImpl;
  @Autowired
  protected ServicesImpl servicesImpl;
  @Autowired
  protected TitolareServiceImpl titolareServiceImpl;

  /*
  *
  */
  public static AdminActions getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    AdminActions service = (AdminActions) (applicationContext.getBean(AdminActions.SERVICE_NAME));
    return service;
  }

  /*
  *
  */
  public AdminActionsImpl()
  {
    log().info("");
  }

  public int insertBanner(Banners banner)
  {
    byte[] bannerimm = null;
    String pos = "";

    if (banner.getBannerdx() != null)
    {
      pos = "bannerdx";
      bannerimm = banner.getBannerdx();
    }
    else if (banner.getBannersx() != null)
    {
      pos = "bannersx";
      bannerimm = banner.getBannersx();
    }

    int length = 11;// bannerimm.length;

    String insert = "insert into banners (" + pos
        + ", sponsor, fromthe, tothe, tipologia, regione, filename, size, link) values ( ? , '" + banner.getSponsor()
        + "', '" + banner.getFromthe() + "', '" + banner.getTothe() + "', '" + banner.getTipologia() + "', '"
        + banner.getRegione() + "', '" + banner.getFilename() + "', " + length + ", '" + banner.getLink() + "');";

    int inserted = dbmsImpl.insertImageFromAdmin(insert, bannerimm);

    return inserted;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.admin.AdminActions#insert(anna.alit.model.AziendeModel)
   */
  public int insert(AziendeModel aziendeModel)
  {
    int result = isThereMail(aziendeModel);// per poterlo inserire non deve esistere
    String mail = setMailToNullIfEmpty(aziendeModel.getMail());
    if(mail == null) result = 0;
    if(StringUtils.isNotBlank(mail))
    {
      mail = "'"+mail+"'";
    }
    if (result == 0)
    {
      int r = 0;
      String insert = "insert into datiaziende(tipologia, tipoesteso, denominazione, mail, web, telefono, cellulare, fax, comune, sigla, indirizzo, punteggio)"
          + " values(" + "'"
          + aziendeModel.getTipologia()
          + "', "
          + "'"
          + aziendeModel.getTipoesteso()
          + "', "
          + "'"
          + aziendeModel.getDenominazione().replace('\'', '`')
          + "', "
          + mail
          + ", "
          + "'"
          + aziendeModel.getWeb()
          + "', "
          + "'"
          + aziendeModel.getTelefono()
          + "', "
          + "'"
          + aziendeModel.getCellulare()
          + "', "
          + "'"
          + aziendeModel.getFax()
          + "', "
          + "'"
          + aziendeModel.getComune().replace('\'', '`')
          + "', "
          + "'"
          + aziendeModel.getSigla()
          + "', "
          + "'"
          + aziendeModel.getIndirizzo().replace('\'', '`') + "', " + "" + aziendeModel.getPunteggio() + "" + ");";

      r = dbmsImpl.executeAdminUpdate(insert);

      if (r == 1)
      {
        int id = retrieveNewId(aziendeModel);

        if (id > 0)
        {
          updateChildrenTables(id);

          boolean isUpdated = isUpdated(aziendeModel, id);

          if (!isUpdated)
          {
            log().info("there was an error during username/password creation.");
            return 0;
          }
        }
      }
      return r;
    }
    else
    {
      return 0;
    }
  }

  private String setMailToNullIfEmpty(String mail)
  {
    if(mail != null)
    {
      if(mail.equals("") || mail.equals(" ") || mail.equals("-"))
      {
        mail = null;
      }
    }
    return mail;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.admin.AdminActions#update(anna.alit.model.AziendeModel)
   */
  public int update(AziendeModel aziendeModel, int id)
  {
    int res = 0;
    String mail = setMailToNullIfEmpty(aziendeModel.getMail());
    String mailInsert = "mail='" + mail + "'";
    if(mail == null)
    {
      mailInsert = "mail=null ";
    }

    String update = "update datiaziende set " + "tipologia='" + aziendeModel.getTipologia() + "', " + "tipoesteso='"
        + aziendeModel.getTipoesteso() + "', " + "denominazione='" + aziendeModel.getDenominazione().replace('\'', '`')
        + "', " +mailInsert+", " + "web='" + aziendeModel.getWeb() + "', " + "telefono='"
        + aziendeModel.getTelefono() + "', " + "cellulare='" + aziendeModel.getCellulare() + "', " + "fax='"
        + aziendeModel.getFax() + "', " + "comune='" + aziendeModel.getComune().replace('\'', '`') + "', " + "sigla='"
        + aziendeModel.getSigla() + "', " + "indirizzo='" + aziendeModel.getIndirizzo().replace('\'', '`') + "' "
        + " where id=" + id + ";";

    res = dbmsImpl.executeAdminUpdate(update);

    return res;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.admin.AdminActions#delete(anna.alit.model.AziendeModel)
   */
  public int delete(String identifier)
  {
    int res = 0;
    String delete = "delete from datiaziende where id=" + identifier;

    res = dbmsImpl.executeAdminUpdate(delete);

    return res;
  }

  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.admin.AdminActions#subscription(anna.alit.model.AziendeModel)
   */
  public int subscription(String identifier, boolean activate)
  {
    int res = 0;
    String update = "update titolare set abbonato=" + activate + " where id_azienda=" + identifier + "; ";

    res = dbmsImpl.executeAdminUpdate(update);

    return res;
  }

  /*
   * (non-Javadoc)
   *
   *
   *
   * @see
   * anna.alit.admin.AdminActions#subscription(anna.alit.model.AziendeModel)
   */
  public void sendMailListParam(String sigla, String tipologia)
  {
    List<String> list = new ArrayList<String>();
    String query = "select mail from datiaziende where sigla='" + sigla + "' and tipologia='" + tipologia
        + "' and notified=false;";

    log().info("ciao");
    List<String> rs = dbmsImpl.executeGenericAdminQuery(query);

    for (int i = 0; i < rs.size(); i++)
    {
      String mail = (String) rs.get(i);
      mail = mail.trim();
      if (StringUtils.isNotEmpty(mail) && !mail.equals("-"))
      {
        if (mail.indexOf('/') != -1)
        {
          String[] splitted = mail.split("/");
          for (String m : splitted)
          {
            m = m.trim();
            list.add(m);
          }
        }
        else
        {
          list.add(mail);
        }
      }
    }
    alitService.sendEmailToList(list);
  }

  /**
   * @param aziendeModel
   * @param id
   * @return
   */
  private boolean isUpdated(AziendeModel aziendeModel, int id)
  {
    boolean isUpdated = false;
    String user = servicesImpl.createUsername((String) aziendeModel.getDenominazione());

    for (int i = 0; i < 100000 && !isUpdated; i++)
    {
      user = (i == 0) ? user : user + i;
      isUpdated = this.setUserPwd(user, servicesImpl.createPsw(7), Integer.toString(id));
    }
    return isUpdated;
  }

  /**
   * @param id
   * @return
   */
  private int updateChildrenTables(int id)
  {
    int r;
    String updateFiglie = "INSERT INTO titolare (nome, cognome, id_azienda) " + "VALUES(' ', ' ', " + id + "); "
        + "INSERT INTO caratteristiche(id_azienda_est) VALUES(" + id + "); "
        + "INSERT INTO calendario(id_calendario) values(" + id + ");";

    r = dbmsImpl.executeAdminUpdate(updateFiglie);
    return r;
  }

  /**
   * @param aziendeModel
   * @return
   */
  private int retrieveNewId(AziendeModel aziendeModel)
  {
//	String checkQuery = "select max(id) from datiaziende;";
//    int maxId = dbmsImpl.executeAdminQuery(checkQuery, "id");

	String mail = null;
	if(StringUtils.isEmpty(aziendeModel.getMail()))
	{
	  mail = "is null";
	}
	else
	{
	  mail = "='" + aziendeModel.getMail() + "'";
	}
    String idQuery = "SELECT id from datiaziende where denominazione = '"
        + aziendeModel.getDenominazione().replace('\'', '`') + "' AND " + "tipologia = '" + aziendeModel.getTipologia()
        + "' AND sigla = '" + aziendeModel.getSigla() + "'  AND comune = '" + aziendeModel.getComune() + "' and mail "+mail;

    int id = dbmsImpl.executeAdminQuery(idQuery, "id");
//    if(maxId != id)
//    {
//    	log().error("l'id trovato è: "+id+" mentre dovrebbe essere: "+maxId);
//    	return 0;
//    }
    return id;
  }

  /**
   * @param aziendeModel
   * @return
   */
  private int isThereMail(AziendeModel aziendeModel)
  {
    String queryIsThereMail = "select mail from datiaziende where mail = '" + aziendeModel.getMail() + "'";
    String mail = dbmsImpl.executeAdminStringQuery(queryIsThereMail, "mail");
    int i = 0;
    if(mail == null)
    {
      i = 0;
    }
    else
    {
      if(StringUtils.equals(mail, aziendeModel.getMail()))
      {
        i = 1;
      }
      else
      {
        i = 0;
      }
    }
	return i;
  }

  /**
   * @param user
   * @param pwd
   * @param id
   * @return
   */
  private boolean setUserPwd(String user, String pwd, String id)
  {
    pwd = utilityService.pwdResolver(pwd, true);

    String userpass = "UPDATE titolare SET username='" + user + "', password ='" + pwd + "' WHERE id_azienda =" + id
        + ";";

    if (dbmsImpl.executeAdminUpdate(userpass) == 0)
    {
      return false;
    }

    return true;
  }

}
