package anna.alit.servicebb;

import java.sql.*;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.lang.xwork.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;

@Service(GetAlloggioDataImpl.SERVICE_NAME)
public class GetAlloggioDataImpl implements GetAlloggioData {

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired
  private DbmsImpl dbmsImpl;

  /*
  *
  */
  public static GetAlloggioData getInstance() {
    WebApplicationContext applicationContext = ContextLoader
        .getCurrentWebApplicationContext();
    GetAlloggioData service = (GetAlloggioData) (applicationContext
        .getBean(GetAlloggioData.SERVICE_NAME));
    return service;
  }

  /*
  *
  */
  public GetAlloggioDataImpl() {
    log().info("");
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.GetAlloggioData#getData(java.lang.String)
   */
  public HashBean getData(String id) throws SQLException {

    HashBean hashbean = null;
    String querycomune = "select datiaziende.*, comune.* from datiaziende, comune "
        + "where datiaziende.id ="
        + id
        + " and datiaziende.comune = comune.comune ";

    ResultSet rs = dbmsImpl.executeQuery(querycomune);

    String[] campi = new String[] { "id", "denominazione", "sigla", "comune",
        "nzona", "zona", "loco", "indirizzo", "civico", "cap", "telefono",
        "cellulare", "fax", "telefono2", "cellulare2", "fax2", "regione",
        "nomeesteso", "sito", "urlslogan1", "mail", "web", "skype",
        "tipologia", "tipoesteso", "nome", "cognome", "mese", "codicefiscale",
        "webistituzionale", "aeroporti", "autostrade", "stazioni",
        "annofondazione", "giorno", "anno", "numcamere", "wwwilmeteo",
        "wwwcomuniitaliani", "numlettimin", "numlettimax", "numlettitot",
        "appartamenti", "kmcapoluogo", "kmcasello", "sitoprovincia",
        "kmaeroporto", "kmstazione", "tariffamin", "include", "prenotazione",
        "dal", "al", "camera", "bagno", "responsabilita", "tavola",
        "struttura", "descrizione_ita", "descrizione_eng","descrizione_deu", "descrizione_fra","prezzomedio", "pagamento", "tab",
        "immagini", "slogan1", "slogan2", "scontodel", "offerta", "latitudine",
        "longitudine", "entrokm", "duratamin", "mtmezzipubblici", "urlslogan2",
        "costruzione", "posizione", "lingue", "linguadescr", "youtube",
        "myspace", "facebook", "flickr", "gennaio", "febbraio", "marzo",
        "aprile", "maggio", "giugno", "note", "luglio", "agosto", "settembre",
        "ottobre", "novembre", "dicembre" };

    if (rs == null) {

      String query = "select datiaziende.*, titolare.*, caratteristiche.*, provincia.regione, "
          + " provincia.nomeesteso, provincia.sitoprovincia, regione.sito, calendario.*"
          + " from datiaziende, titolare, caratteristiche, provincia, regione, calendario"
          + " where datiaziende.id = "
          + id
          + " and titolare.id_azienda = "
          + id
          + " and caratteristiche.id_azienda_est = "
          + id
          + " and datiaziende.sigla = provincia.sigla "
          + " and calendario.id_calendario = "
          + id
          + " and provincia.regione = regione.nomeregione;";

      hashbean = dbmsImpl.executeSingleQuery(query, campi);

      return hashbean;
    }

    try {

      while (rs.next()) {
        if (rs.getString("denominazione") != null
            && rs.getString("denominazione") != "") {
          String query = "select datiaziende.*, titolare.*, caratteristiche.*, comune.*, provincia.regione, "
              + " provincia.nomeesteso, provincia.sitoprovincia, regione.sito, calendario.*"
              + " from datiaziende, titolare, caratteristiche, provincia, regione, comune, calendario"
              + " where datiaziende.id = "
              + id
              + " and titolare.id_azienda = "
              + id
              + " and caratteristiche.id_azienda_est = "
              + id
              + " and datiaziende.sigla = provincia.sigla "
              + " and datiaziende.comune = comune.comune "
              + " and calendario.id_calendario = "
              + id
              + " and provincia.regione = regione.nomeregione;";

          hashbean = dbmsImpl.executeSingleQuery(query, campi);
        }
      }
    }
    catch(SQLException slqe)
    {
      slqe.getLocalizedMessage();
    }

    return hashbean;
  }

  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.servicebb.GetAlloggioData#cleanTelephoneNumber(java.lang.String)
   */
  public String cleanTelephoneNumber(String phone) {

    if (phone == null)
      return "";

    phone = phone.trim();

    if (phone.length() < 5)
      return "";

    if (phone.startsWith("0") && phone.length() > 1)
      return phone.substring(1);

    return phone;
  }

  /*
   * (non-Javadoc)
   *
   * @see
   * anna.alit.servicebb.GetAlloggioData#cleanTheArraystring(java.lang.String)
   */
  public String cleanTheArraystring(String key) {
    if (key == null)
      return "";

    return key.replace('{', ' ').replace('}', ' ').replace(",", "; ").replace(
        "\"", " ").replace(" ;", ";").replace("  ", " ");
  }

  public String internationalize(String key, String locale, String separator)
  {
    ResourceBundle rb = ResourceBundle.getBundle("messages", new Locale(locale.toLowerCase(), locale.toUpperCase()));

    if(key == null)
    {
      return "";
    }
    String clearkey = key.replace("{", "").replace("}", "").replace("\"", "").replace(" ", "_");

    String[] keys = clearkey.split(",");

    String result= "", localized = "";

    int length = keys.length;
    if(length == 0)
      return "";

    for(int i = 0; i < length; i++)
    {

      try
      {
        localized = rb.getString("opt." + keys[i]);
      }
      catch (Exception e)
      {
    	if(StringUtils.isNotEmpty(keys[i]))
    	{
          log().warn("chiave '{}' non presente in locale '{}'", "opt." + keys[i], locale);
    	}
        continue;
      }
      if(i != (length-1) )
        result += localized + separator;
      else
        result += localized;
    }

    return result;
  }

}