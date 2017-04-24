package anna.alit.servicebb;

import org.apache.commons.lang.xwork.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;

@Service(RegisterService1Impl.SERVICE_NAME)
public class RegisterService1Impl implements RegisterService1
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
  protected DbmsImpl dbmsImpl;
  @Autowired
  protected DynamicInsertImpl dynamicInsertImpl;
  @Autowired
  protected ServicesImpl servicesImpl;
  @Autowired
  protected DynamicUpdateImpl dynamicUpdateImpl;
  @Autowired
  protected TitolareServiceImpl titolareServiceImpl;
  @Autowired
  protected UtilityServiceImpl utilityServiceImpl;

  /*
   *
   */
  public static RegisterService1 getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    RegisterService1 service = (RegisterService1) (applicationContext.getBean(RegisterService1.SERVICE_NAME));
    return service;
  }

  /*
   *
   */
  public RegisterService1Impl()
  {
    log().info("");
  }

  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.servicebb.RegisterService1#getRegister1New(javax.servlet.http
   * .HttpServletRequest)
   */
  public int getRegister1New(ParamsMap params)
  {
    String comune = (String) params.get("comune");
    String denominazione = (String) params.get("denominazione");

    if (denominazione != null && denominazione.contains("\""))
    {
      denominazione = denominazione.replaceAll("\"", "");
      params.remove("denominazione");
      params.put("denominazione", denominazione);
    }

    String[] campiString = new String[] { "denominazione", "sigla", "nzona", "zona", "loco", "indirizzo", "civico", "telefono",
        "cellulare", "fax", "telefono2", "cellulare2", "fax2", "mail", "web", "skype", "tipologia", "costruzione" };
    String[] campiInt = new String[] { "annofondazione", "cap" };
    String[] campiArrayString = new String[] { "posizione" };

    HashBean datiString = servicesImpl.makeFirstHashBean(params, campiString);


    if (comune != null && !comune.equals("comune") && !comune.equals("0"))
        datiString.put("comune", comune);

    HashBean datiInt = servicesImpl.makeFirstHashBean(params, campiInt);
    HashBeanVector datiArrayString = servicesImpl.makeFirstHashBeanVector(params, campiArrayString);

    int esito = dynamicInsertImpl.execute("datiaziende", datiString, datiInt, datiArrayString);

    if (esito == 0)
    {
      return -1;
    }

    String id = getId(params);

    if (id == null)
    {
      // non ho ottenuto l'id
      return -2;
    }

    // fin qui ho aggiunto una nuova struttura, ora aggiorno gli id delle tabelle dipendenti
    int res = childrenTablesUpdate(id);

    if (res == 0)
    {
      return -3;
    }

    // infine aggiorno le altre tabelle
    String update = updateAllTables(params, id);

    if (dbmsImpl.executeUpdate(update) == 0)
    {
      return -4;
    }

    // inserisco user e pwd
    boolean isUpdated = false;
    String user = servicesImpl.createUsername((String) params.get("denominazione"));

    for (int i = 0; i < 100000 && !isUpdated; i++)
    {
      user = (i == 0) ? user : user + i;
      isUpdated = titolareServiceImpl.setUserAndPsw(user, servicesImpl.createPsw(7), id);
    }

    if (isUpdated == false)
      return -5;

    // calcolo ed aggiorno il punteggio
    utilityServiceImpl.updateScore(id);

    return Integer.parseInt(id);
  }


  private String updateAllTables(ParamsMap params, String id)
  {
	String[] campiString;
	String[] campiInt;
	String[] campiArrayString;
	HashBean datiString;
	HashBean datiInt;
	HashBeanVector datiArrayString;
	campiString = new String[] { "nome", "cognome", "mese", "codicefiscale", "username", "password" };
    campiInt = new String[] { "giorno", "anno" };

    String where = "id_azienda =" + id;

    datiString = servicesImpl.makeHashBean(params, campiString);
    datiInt = servicesImpl.makeHashBean(params, campiInt);

    String update = dynamicUpdateImpl.make("titolare", datiString, datiInt, where);

    campiString = new String[] { "aeroporti", "autostrade", "stazioni" };
    campiInt = new String[] { "numcamere", "numlettimin", "numlettimax", "numlettitot", "appartamenti", "kmcapoluogo", "kmcasello",
        "kmaeroporto", "kmstazione", "mtmezzipubblici" };
    campiArrayString = new String[] { "lingue" };

    where = "id_azienda_est =" + id;

    datiString = servicesImpl.makeHashBean(params, campiString);
    datiInt = servicesImpl.makeHashBean(params, campiInt);
    datiArrayString = servicesImpl.makeHashBeanVector(params, campiArrayString);

    update += " " + dynamicUpdateImpl.make("caratteristiche", datiString, datiInt, datiArrayString, where);

    return update;
  }


  private int childrenTablesUpdate(String id)
  {
	String updateFiglie = "INSERT INTO titolare (nome, cognome, id_azienda) " + "VALUES(' ', ' ', " + id + "); "
        + "INSERT INTO caratteristiche(id_azienda_est) VALUES(" + id + "); "
        + "UPDATE datiaziende set tipoesteso = (select nomeesteso from tipologia " + "where tipologia.codice = datiaziende.tipologia);"
        + "UPDATE datiaziende set responsabilita = true WHERE id =" + id + ";"
        + "UPDATE datiaziende set notified = true WHERE id =" + id + ";"
        + "INSERT INTO calendario(id_calendario) values(" + id + ");";

    int res = 0;
    try
    {
    	res = dbmsImpl.executeUpdate(updateFiglie);
    }
    catch(Exception e)
    {
    	log().warn("error: "+e.getMessage());
    }
	return res;
  }



  private String getId(ParamsMap params)
  {
    String id = null;
    String idQuery = "SELECT id from datiaziende where denominazione = '"
        + ((String) params.get("denominazione")).replace('\'', '`') + "' AND " + "tipologia = '" + (String) params.get("tipologia")
        + "' AND sigla = '" + (String) params.get("sigla") + "' and mail='"+(String) params.get("mail")+"'";

    HashBeanVector result = dbmsImpl.executeQuery(idQuery, new String[] { "id" });

    if(result != null)
    {
      if(result.get("id") != null)
      {
        id = result.get("id").get(0);
      }
    }
	return id;
  }


  public int getId(String mail)
  {
    String id = "0";
    String idQuery = "SELECT id from datiaziende where mail = '"+mail+"'";

    HashBeanVector result = dbmsImpl.executeQuery(idQuery, new String[] { "id" });

    if(result != null)
    {
      if(result.get("id") != null)
      {
        id = result.get("id").get(0);
      }
    }
	return Integer.parseInt(id);
  }


  public boolean checkIfExistent(String mail)
  {
    HashBeanVector resMail = null;
    String mailQuery = "SELECT mail from datiaziende where mail = '"+mail+"'";
    resMail = dbmsImpl.executeQuery(mailQuery, new String[] {"mail"});
    String m = null;

    if(resMail.get("mail") != null)
    {
      m = resMail.get("mail").get(0);
    }

    if(StringUtils.isNotEmpty(m) && StringUtils.equals(mail, m))
	{
      return true;
	}
    else
    {
      return false;
    }
  }

  public ParamsMap getExistentParams(String mail)
  {
    ParamsMap m = new ParamsMapImpl();
    String mailQuery = "SELECT id, mail, username, password, denominazione from datiaziende, titolare where mail = '"+mail+"' and id=id_azienda";
    HashBeanVector resMail = dbmsImpl.executeQuery(mailQuery, new String[] {"id", "mail", "username", "password", "denominazione"});
    m.put("id", resMail.get("id").get(0));
    m.put("mail", resMail.get("mail").get(0));
    m.put("username", resMail.get("username").get(0));
    String pwd = resMail.get("password").get(0);
    pwd = utilityServiceImpl.pwdResolver(pwd, false);
    m.put("password", pwd);
    m.put("denominazione", resMail.get("denominazione").get(0));

    return m;
  }

}
