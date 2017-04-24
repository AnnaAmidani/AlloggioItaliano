package anna.alit.servicebb;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.xwork.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@Service(TitolareServiceImpl.SERVICE_NAME)
public class TitolareServiceImpl implements TitolareService
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
  protected UtilityServiceImpl utilityServiceImpl;

  /**
   * Numero delle celle della tabella dei prezzi della struttura
   */
  public final int TAB_COUNT = 48;
  /**
   * Carattere che sostituisce il valore 0.00 della tabella dei prezzi in
   * caratteristiche
   */
  public final char TAB_ZERO = ' '; // (char) ('\u0000' + 151);
  /**
   * Carattere che sostituisce il valore 0.00 della tabella dei prezzi in
   * caratteristiche
   */
  public static final String TAB_SPLIT = "q"; // (char) ('\u0000' + 151);

  /*
  *
  */
  public static TitolareService getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    TitolareService service = (TitolareService) (applicationContext.getBean(TitolareService.SERVICE_NAME));
    return service;
  }

  /*
  *
  */
  public TitolareServiceImpl()
  {
    log().info("");
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#getValidation(java.lang.String,
   * java.lang.String, java.lang.String)
   */
  public int getValidation(String username, String password) throws SQLException
  {
    ResultSet resultset = null;
    int check = 0;

    if(StringUtils.isNotEmpty(password))
    {
      password = utilityServiceImpl.pwdResolver(password, true);
//      log().info(password);
    }

    String query = "SELECT id_azienda from titolare where username='" + username + "' and password='" + password + "'";

    resultset = dbmsImpl.executeQuery(query);

      try
      {
        if(resultset != null && resultset.next())
        {
          check = resultset.getInt("id_azienda");
        }
      }catch (SQLException e)
      {
        log().error(e.getLocalizedMessage());
      }
    return check;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#getAbbonato(java.lang.String,
   * java.lang.String, java.lang.String)
   */
  public boolean getAbbonato(int idLoggato) throws SQLException
  {
    ResultSet resultset = null;
    boolean check = false;

    String query = "SELECT abbonato from titolare where id_azienda=" + idLoggato;

    resultset = dbmsImpl.executeQuery(query);

    try
    {
      if (resultset != null && resultset.next())
        check = resultset.getBoolean("abbonato");

    } catch (SQLException e)
    {
      e.printStackTrace();
    }
    return check;
  }


  public boolean firstTimeLogged(String username, String password) throws SQLException
  {
    ResultSet resultset = null;
    int check = 0;
    boolean firstTimeLogged = false;

    if(StringUtils.isNotEmpty(password))
    {
      password = utilityServiceImpl.pwdResolver(password, true);
    }

    String query = "SELECT id_azienda from titolare where username='" + username + "' and password='" + password + "'";

    resultset = dbmsImpl.executeQuery(query);

      try
      {
        if(resultset != null && resultset.next())
        {
          check = resultset.getInt("id_azienda");
          ResultSet resultset1 = null;
          String checkDate = "";

          String queryFirstTime = "select dataiscrizione from titolare where id_azienda =" + check;
          resultset1 = dbmsImpl.executeQuery(queryFirstTime);

          if (resultset1 != null)
          {
            try
            {
              while (resultset1.next())
              {
                checkDate = resultset1.getString("dataiscrizione");
                if(StringUtils.isEmpty(checkDate))
                {
                  firstTimeLogged = true;
                }
              }
            }
           catch (SQLException e1)
           {
             log().error(e1.getMessage());
           }
          }
         }
      }
      catch (SQLException e)
      {
        log().error(e.getLocalizedMessage());
      }
    return firstTimeLogged;

  }


  public boolean updateDataIscrizione(String username, String password, String data) throws SQLException
  {
    ResultSet resultset1 = null;
    int id = 0;

    if(StringUtils.isNotEmpty(password))
    {
      password = utilityServiceImpl.pwdResolver(password, true);
    }

    String queryId = "select id_azienda from titolare where username ='" + username + "' and password='"+password+"'";

    boolean updated = false;

    resultset1 = dbmsImpl.executeQuery(queryId);

    if (resultset1 != null)
    {
      try
      {
        while (resultset1.next())
        {
          id = resultset1.getInt("id_azienda");
        }
      }
     catch (SQLException e)
     {
      e.printStackTrace();
     }
   }

    if (id > 0)
    {
      String update = "update titolare set dataiscrizione ='" + data + "' where id_azienda =" + id + ";";
      update += "update datiaziende set responsabilita = true where id=" + id + ";";

      if(dbmsImpl.executeUpdate(update) != 0)
      {
        updated = true;
      }
    }

    return updated;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#setUserAndPsw(java.lang.String,
   * java.lang.String, java.lang.String)
   */
  public boolean setUserAndPsw(String user, String pwd, String id)
  {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String data = sdf.format(new Date());

    String queryIsThereUser = "SELECT count(username) AS username from titolare where username='" + user + "'";

    HashBeanVector result = dbmsImpl.executeQuery(queryIsThereUser, new String[] { "username" });

    if (!result.get("username").get(0).equals("0"))
      // se user esiste già in table ritorna falso
      return false;

    if(StringUtils.isNotEmpty(pwd))
    {
      pwd = utilityServiceImpl.pwdResolver(pwd, true);
    }

    // aggiornamento intermedio: se le precedenti operazioni sono andate a buon
    // fine, creo user e pass e valorizzo la data di iscrizione al sito
    String userpass = "UPDATE titolare SET username='" + user + "', password ='" + pwd + "', dataiscrizione='"+data+"' WHERE id_azienda =" + id + ";";

    if (dbmsImpl.executeUpdate(userpass) == 0)
      return false;

    return true;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#getUsrAndPwd(int)
   */
  public HashBean getUsrAndPwd(int id)
  {

    String query = "SELECT username, password from titolare where id_azienda=" + id + "";

    HashBean result = dbmsImpl.executeSingleQuery(query, new String[] { "username", "password" });

    String pwd = result.get("password");

    if(StringUtils.isNotEmpty(pwd))
    {
      pwd = utilityServiceImpl.pwdResolver(pwd, false);
    }

    result.put("password", pwd);
    return result;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#changeUserAndPsw(java.lang.String,
   * java.lang.String, java.lang.String, java.lang.String)
   */
  public int changeUserAndPsw(String oldUser, String newpwd)
  {
    int check = 0;
    if(newpwd.length() < 8)
    {
//      log().info(""+newpwd.length());
      return check;
    }
    else
    {
      if(StringUtils.isNotEmpty(newpwd))
      {
    	newpwd = utilityServiceImpl.pwdResolver(newpwd, true);
//        log().info(newpwd);
      }

      String query = "UPDATE titolare set password='" + newpwd + "' " + "where username='" + oldUser + "';";

      check = dbmsImpl.executeUpdate(query);

      return check;
    }
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#getData(int)
   */
  public HashBean getData(int id)
  {

    String query = "select datiaziende.*, titolare.*, caratteristiche.*, calendario.*, provincia.nomeesteso"
        + " from datiaziende, titolare, caratteristiche, calendario, provincia " + " where datiaziende.id = " + id
        + " and datiaziende.sigla = provincia.sigla" + " and titolare.id_azienda = " + id + " and caratteristiche.id_azienda_est = " + id
        + " and calendario.id_calendario = " + id;

    HashBean beanLoggato = dbmsImpl.executeSingleQuery(query, new String[] { "denominazione", "sigla", "nomeesteso", "comune", "nzona",
        "zona", "loco", "indirizzo", "civico", "cap", "telefono", "cellulare", "fax", "telefono2", "cellulare2", "fax2", "mail", "skype",
        "web", "tipologia", "nome", "cognome", "mese", "codicefiscale", "annofondazione", "youtube", "myspace", "flickr", "facebook",
        "costruzione", "posizione", "lingue", "aeroporti", "autostrade", "stazioni", "giorno", "anno", "numcamere", "numlettimin",
        "numlettimax", "numlettitot", "appartamenti", "kmcapoluogo", "kmcasello", "kmaeroporto", "kmstazione", "mtmezzipubblici",
        "offerta", "include", "prenotazione", "dal", "al", "duratamin", "scontodel", "camera", "bagno", "tavola", "struttura", "entrokm",
        "pagamento", "descrizione_ita", "descrizione_eng", "descrizione_deu", "descrizione_fra", "latitudine", "longitudine", "youtube", "myspace", "facebook", "flickr", "tab", "slogan1", "slogan2",
        "urlslogan1", "urlslogan2", "note", "gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre",
        "ottobre", "novembre", "dicembre" });

    // Converto il formato del valore del campo tab
    // da --> {2.03,0.00,6.55}
    // a --> 2,03[TAB_ZERO]6,55
    String tab = normalizeTab(beanLoggato.get("tab"));
    beanLoggato.put("tab", tab);

    return beanLoggato;
  }

  /**
   * Normalizza il formato del campo SQL 'tab' della tabella 'caratteristiche'
   * per una stampa corretta della tabella dei prezzi nel XHTML. Il formato
   * della string di ritorno è del tipo:
   * <ul>
   * <li>"3,45[TAB_SPLIT]6,54[TAB_SPLIT]7,89[TAB_SPLIT]8,98[TAB_SPLIT]2,34[TAB_SPLIT]0,00"
   * </li>
   * </ul>
   *
   * return i valori di 'tab' correttamente formattati
   */
  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#normalizeTab(java.lang.String)
   */
  public String normalizeTab(String tab)
  {
    tab = formatNumericSQLArray(tab);
    tab = fixToLength(tab, TAB_COUNT);

    return tab;
  }

  /**
   * Ritorna l'array del campo 'tab' della tabella 'caratteristiche'
   *
   * return i valori di 'tab' correttamente formattati
   */
  public String[] getTab(String tab)
  {
    tab = formatNumericSQLArray(tab);
    tab = fixToLength(tab, TAB_COUNT);

    return tab.split(TAB_SPLIT);
  }

  /**
   * Ritorna l'array del campo 'tab' della tabella 'caratteristiche' sostituendo
   * '0,00' con ''
   *
   * return i valori di 'tab' correttamente formattati
   */
  public String[] getTabWithoutZero(String tab)
  {
    tab = formatNumericSQLArray(tab);
    tab = fixToLength(tab, TAB_COUNT);
    String[] tab_without_zero = tab.split(TAB_SPLIT);
    for (int i = tab_without_zero.length; i-- != 0;)
      if (tab_without_zero[i].equals("0,00"))
        tab_without_zero[i] = "";

    return tab_without_zero;
  }

  /**
   * Ritorna una stringa contenenti esattamente 'count' valori.</br> se la
   * stringa passata contiene:
   * <ul>
   * <li>'count' valori, ritorno i valori dati in ingresso</li>
   * <li>meno di 'count' valori, aggiungo tanti '0,00' quanti sono i valori
   * mancanti</li>
   * <li>più di 'count' valori, ritorno solo i primi 'count' valori</li>
   * </ul>
   *
   * Il formato della string di ingresso deve essere del tipo:
   * <ul>
   * <li>"3,45[TAB_SPLIT]6,54[TAB_SPLIT]7,89[TAB_SPLIT]8,98[TAB_SPLIT]2,34[TAB_SPLIT]0,00"
   * </li>
   * </ul>
   *
   * @param arrayValues
   *          valori da immettere nella lista di valori di ritorno.
   * @param count
   *          numero di valori (esatto) che deve contenere la stringa di
   *          ritorno. N.B. count DEVE essere > 1.
   *
   * @return una lista di esattamente 'count' valori.
   */
  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#fixToLength(java.lang.String, int)
   */
  public String fixToLength(String arrayValues, int count)
  {

    String[] array = arrayValues.split(TAB_SPLIT);
    int length = array.length;
    if (length == count)
      return arrayValues;

    if (length < count)
    {
      // aggiungo ad 'arrayValues' i valori mancanti
      for (int i = 0; i < (count + 1 - length); i++)
        arrayValues += TAB_SPLIT + "0,00";

      if (arrayValues.startsWith(TAB_SPLIT))
        // arrayValue non conteneva valori
        arrayValues = arrayValues.substring(TAB_SPLIT.length()); // tolgo
      // TAB_SPLIT
      // iniziale
    } else
    {
      // inserisco in 'arrayValues' solo i primi 48 valori
      arrayValues = array[0];
      for (int i = 1; i < count; i++)
        arrayValues += TAB_SPLIT + array[i];
    }

    return arrayValues;
  }

  /**
   * Ritorna i valori contenuti nell' array Numeric SQL passato convertendone il
   * formato: formato di ingresso: {2.03,0.00,6.55} formato di ritorno:
   * 2,03[TAB_SPLIT]0,00[TAB_SPLIT]6,55
   *
   * @param sqlArray
   *          array Numeric SQL (contenuto in una stringa) di cui convertire il
   *          formato
   *
   * @return tutti i valori contenuti in sqlArray separati da uno spazio
   */
  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.servicebb.TitolareService#formatNumericSQLArray(java.lang.String)
   */
  public String formatNumericSQLArray(String sqlArray)
  {

    // formato 'sqlArray': {2.03,0.00,6.55}

    if (sqlArray == null || sqlArray.length() < 4)
    {
      // se sqlArray non contiene almeno un valore
      return "";
    }

    // formato => {2.03,3.00}
    sqlArray = sqlArray.substring(1, sqlArray.length() - 1);
    // formato => 2.03,3.00
    sqlArray = sqlArray.replace(",", TAB_SPLIT);
    // formato => 2.03[TAB_SPLIT]3.00
    sqlArray = sqlArray.replace(".", ",");
    // formato => 2,03[TAB_SPLIT]3,00

    return sqlArray;
  }

  /**
   * Ritorna i valori contenuti nell' array Money SQL passato convertendone il
   * formato: formato di ingresso: {"€2,03","€0,00","€6,55"} formato di ritorno:
   * 2,03 0,00 6,55
   *
   * @param sqlArray
   *          array Money SQL (contenuto in una stringa) di cui convertire il
   *          formato
   *
   * @return tutti i valori contenuti in sqlArray separati da uno spazio
   */
  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.servicebb.TitolareService#formatMoneySQLArray(java.lang.String)
   */
  public String formatMoneySQLArray(String sqlArray)
  {

    // formato 'tab': {"€2,03","€0,00","€6,55"}

    if (sqlArray == null || sqlArray.length() < 4)
    {
      // se sqlArray non contiene almeno un valore
      return "";
    }

    // formato => {"€2,03","€3,00"}
    sqlArray = sqlArray.substring(2, sqlArray.length() - 2);
    // formato => €2,03","€3,00
    String euro = "" + sqlArray.charAt(0);
    sqlArray = sqlArray.replace(euro, "");
    // formato => 2,03","3,00
    sqlArray = sqlArray.replace("\",\"", " ");
    // formato => 2,03 3,00

    return sqlArray;
  }

  /**
   * Dato un array di double ritorna una stringa in formato SQL
   *
   * @param array
   *          valori da inserire nell'array SQL
   *
   * @return un array SQL numeric in formato stringa
   */

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.TitolareService#toNumericSQLArray(double[])
   */
  public String toNumericSQLArray(double[] array)
  {
    String sqlArray = "{";
    int i;
    for (i = 0; i < array.length - 1; i++)
    {
      sqlArray += (array[i] + ", ");
    }
    sqlArray += array[i] + "}";
    return sqlArray;
  }
}
