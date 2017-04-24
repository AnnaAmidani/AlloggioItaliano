package anna.alit.servicebb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;

@Service(GetSegnalazioniDataImpl.SERVICE_NAME)
public class GetSegnalazioniDataImpl implements GetSegnalazioniData {
  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired
  private DbmsImpl dbmsImpl;

  /*
  *
  */
  public static GetSegnalazioniDataImpl getInstance() {
    WebApplicationContext applicationContext = ContextLoader
        .getCurrentWebApplicationContext();
    GetSegnalazioniDataImpl service = (GetSegnalazioniDataImpl) (applicationContext
        .getBean(GetSegnalazioniDataImpl.SERVICE_NAME));
    return service;
  }

  /*
  *
  */
  public GetSegnalazioniDataImpl() {
    log().info("");
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.GetSegnalazioniData#getData(java.lang.String)
   */
  public HashBean getData(String id) {

    String query = "select datiaziende.*, segnalazioni.*"
        + " from datiaziende, segnalazioni"
        + " where datiaziende.id = segnalazioni.idazienda and "
        + " segnalazioni.id = " + id + ";";

    HashBean hashbean = dbmsImpl.executeSingleQuery(query, new String[] { "id",
        "denominazione", "sigla", "comune", "telefono", "cellulare", "fax",
        "mail", "tipoesteso", "nome", "tipo", "settore", "categoria",
        "descrizione2", "regione", "dal", "al", "prov", "comu", "idazienda" });

    if (hashbean == null)
      return new HashBean();

    return hashbean;
  }

}