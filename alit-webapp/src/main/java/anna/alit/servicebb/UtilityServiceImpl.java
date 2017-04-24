package anna.alit.servicebb;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.utilities.Aes;

@Service(UtilityServiceImpl.SERVICE_NAME)
public class UtilityServiceImpl implements UtilityService {


  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }


  private String regexpUsername;

  @Autowired protected DbmsImpl dbmsImpl;

 /*
  *
  */
 public static UtilityService getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   UtilityService service = (UtilityService)(applicationContext.getBean(UtilityService.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public UtilityServiceImpl()
 {
   log().info("regexpUsername={}", regexpUsername);
 }


 /* (non-Javadoc)
 * @see anna.alit.servicebb.UtilityService#setRegexpUsername(java.lang.String)
 */
 public void setRegexpUsername(String regexpUsername)
 {
   this.regexpUsername = regexpUsername;
 }


 /*
  *
  */
 /* (non-Javadoc)
 * @see anna.alit.servicebb.UtilityService#setup()
 */
@PostConstruct
 public void setup()
 {
   log().info("regexpUsername={}", regexpUsername);
 }

/**
 * @param pwd
 * @param encrypt
 * @return the pwd
 */
public String pwdResolver(String pwd, boolean encrypt)
{
  if(StringUtils.isNotEmpty(pwd))
  {
    if(encrypt)
    {
      try
      {
        pwd = Aes.encryptToHexString(pwd);
      }
      catch (Exception e)
      {
        log().warn(e.getMessage());
      }
    }
    else
    {
      try
      {
        pwd = Aes.decryptFromHexString(pwd);
      }
      catch (Exception e)
      {
        log().warn(e.getMessage());
      }
    }
  }
  return pwd;
}


  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#updateScore(java.lang.String)
   */
  public int updateScore(String id) {

    int score = calculateScore(id);

    return dbmsImpl.executeUpdate("update datiaziende set punteggio = "
        + score + " where id = " + id);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#calculateScore(java.lang.String)
   */
  public int calculateScore(String id) {

    String[] stringOnePoint = new String[]{"zona", "nzona", "telefono", "telefono2", "cellulare",
        "cellulare2", "fax", "fax2", "web", "costruzione", "loco", "include", "prenotazione"};

    String[] arrayOnePoint = new String[]{"camera", "bagno", "tavola", "struttura", "pagamento"};

    String[] intOnePoint = new String[]{"annofondazione", "numcamere", "numlettimax",
        "numlettitot", "scontodel", "duratamin"};

    String[] intTwoPoints = new String[]{"kmcapoluogo", "kmcasello", "kmaeroporto",
        "kmstazione", "mtmezzipubblici"};

    String[] stringFourPoints = new String[]{"youtube", "flickr", "myspace", "facebook", "latitudine",
        "longitudine"};

    String temp, slogan, urlslogan;
    String[] strings;

    int num = 0;
    int score = 0;

    try
    {
    ResultSet rs = dbmsImpl.executeQuery("select * from  datiaziende, caratteristiche where datiaziende.id = " + id + " and datiaziende.id = caratteristiche.id_azienda_est");

    if(rs == null)
      return 0;

      while(rs.next()) {
        for(String s : stringOnePoint) {
          temp = rs.getString(s);
          if(temp != null && temp.length() > 0)
            ++score;
        }
        for(String s : arrayOnePoint) {
          temp = rs.getString(s);
          if(temp != null && temp.length() > 0)
            ++score;
        }
        for(String s : intOnePoint) {
          num = rs.getInt(s);
          if(num > 0)
            ++score;
        }

        temp = rs.getString("lingue");
        strings = splitArrayStringWithoutComma(temp);
        score += strings.length;

        temp = rs.getString("immagini");
        strings = splitArrayStringWithoutComma(temp);
        score += (strings.length * 2);

        for(String s : intTwoPoints) {
          num = rs.getInt(s);
          if(num > 0)
            score += 2;
        }
        for(String s : stringFourPoints) {
          temp = rs.getString(s);
          if(temp != null && temp.length() > 0)
            score += 4;
        }

        slogan = rs.getString("slogan1");
        urlslogan = rs.getString("urlslogan1");
        if( (slogan != null && slogan.length() > 0) || (urlslogan != null && urlslogan.length() > 0) )
          score += 4;

        slogan = rs.getString("slogan2");
        urlslogan = rs.getString("urlslogan2");
        if( (slogan != null && slogan.length() > 0) || (urlslogan != null && urlslogan.length() > 0) )
          score += 4;

        temp = rs.getString("tab");
        // TODO: rifare quì: tab è sempre pieno di 0,00
        if(temp != null && temp.length() > 0)
          score += 8;
      }
    }
    catch (SQLException e)
    {
      log().error(e.getLocalizedMessage());
    }

    ResultSet rs_count = null;
    try
    {
    rs_count = dbmsImpl.executeQuery("select count(segnalazioni.id) as num from datiaziende, segnalazioni"
        + " where datiaziende.id = " + id + " and datiaziende.id = segnalazioni.idazienda");

    if(rs_count == null)
      return score;

    while(rs_count.next())
      num = rs_count.getInt("num");
    }
    catch (SQLException e)
    {
      log().error(e.getLocalizedMessage());
    }

    num = num * 8;

    return score + num;
  }

  /*
   * Data una stringa nella forma:
   *     {luca,marco,piero}
   * ritorna l'array delle stringhe elencate
   * WARNING: le stringe contenute nell'array non devono contenere carattere ','
   */
  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#splitArrayStringWithoutComma(java.lang.String)
   */
  public String[] splitArrayStringWithoutComma(String values) {

    if(values == null)
      return new String[0];

    // formato => {luca,marco,piero}
    values = values.substring(1, values.length()-1);
    // formato => luca,marco,piero

    String[] toArray = values.split(",");
    return toArray;
  }

  /*
   * Data una stringa nella forma:
   *     {"luca","marco","piero"}
   * ritorna l'array delle stringhe elencate
   */
  // mai utilizzato da testare
  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#splitStringArray(java.lang.String)
   */
  @Deprecated
  public String[] splitStringArray(String values) {

    if(values == null)
      return new String[0];

    char[] vs = values.toCharArray();

    int length = vs.length;
    char c;
    String word = "";
    ArrayList<String> words = new ArrayList<String>();

    for(int i = 0; i <  length; i++) {
      // stato ricerca inizio stringa
      c = vs[i];

      if(c == '"') {
      // stato inizio stringa
        while(vs[++i] != '"' )
          word += vs[i];

        // stato fine stringa
        words.add(word);
        word = "";

      }
    }

    String[] s = new String[0];
    return words.toArray(s);
  }


  /*
   * Data una stringa nella forma:
   *     {"2,03","3,00","7,45"}
   * ritorna un array di stringhe contenente i numeri elencati (sia interi che con virgola)
   */
  // mai utilizzato da testare
  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#splitNumericArray(java.lang.String)
   */
  @Deprecated
  public String[] splitNumericArray(String values) {

    if(values == null)
      return new String[0];

    // formattazione => {"2,03","3,00","7,45"}
    values = values.substring(2, values.length()-2);
    // formattazione => 2,03","3,00","7,45
    values = values.replace("\",\"", " ");
    // formattazione => 2,03 3,00 7,45

    String[] toArray = values.split(" ");
    return toArray;
  }

  /*
   * Data una stringa nella forma:
   *     {"€2,03","€3,00","€7,45"}
   * ritorna un array di stringhe contenente i numeri elencati senza il carattere €
   */
  // mai utilizzato da testare
  /* (non-Javadoc)
   * @see anna.alit.servicebb.UtilityService#splitMoneyArray(java.lang.String)
   */
  @Deprecated
  public String[] splitMoneyArray(String values) {

    if(values == null)
      return new String[0];

    // formattazione => {"€2,03","€3,00","€7,45"}
    values = values.substring(2, values.length()-2);
    // formattazione => €2,03","€3,00","€7,45
    String euro = "" + values.charAt(0);  // euro = "€"
    values = values.replace(euro, "");
    // formattazione => 2,03","3,00","7,45
    values = values.replace("\",\"", " ");
    // formattazione => 2,03 3,00 7,45

    String[] toArray = values.split(" ");
    return toArray;
  }
}
