package anna.alit.servicebb;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;

@Service(RegisterService2Impl.SERVICE_NAME)
public class RegisterService2Impl implements RegisterService2 {

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired protected Dbms dbmsImpl;
  @Autowired protected ServicesImpl servicesImpl;
  @Autowired protected DynamicUpdateImpl dynamicUpdateImpl;
  @Autowired protected UtilityServiceImpl utilityServiceImpl;
  @Autowired protected TitolareServiceImpl titolareServiceImpl;

  public static final int TAB_COUNT = TitolareService.TAB_COUNT;

  /*
  *
  */
  public static RegisterService2 getInstance() {
    WebApplicationContext applicationContext = ContextLoader
        .getCurrentWebApplicationContext();
    RegisterService2 service = (RegisterService2) (applicationContext
        .getBean(RegisterService2.SERVICE_NAME));
    return service;
  }

  /*
   *
   */
  public RegisterService2Impl() {
    log().info("");
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.RegisterService2#Scheda2(javax.servlet.http.
   * HttpServletRequest)
   */
  public int Scheda2(ParamsMap params) {

    int id = (Integer) params.get("idLoggato");

    if (id == 0)
    {
      log().warn("id is null.");
      return -1;
    }

    String[] campiString = new String[] { "offerta", "include", "prenotazione"};
    String[] campiDate = new String[] { "dal", "al" };
    String[] campiInt = new String[] { "duratamin", "scontodel", "entrokm" };
    String[] campiArrayString = new String[] { "camera", "bagno", "tavola", "struttura", "pagamento" };
    String where = "id_azienda_est =" + id;

    HashBean datiString = servicesImpl.makeHashBean(params, campiString);
    HashBean datiDate = servicesImpl.makeHashBean(params, campiDate);
    HashBean datiInt = servicesImpl.makeHashBean(params, campiInt);
    HashBeanVector datiArrayString = servicesImpl.makeHashBeanVector(params, campiArrayString);

    String update = dynamicUpdateImpl.make("caratteristiche", datiString, datiDate, datiInt, datiArrayString, where);
    if (dbmsImpl.executeUpdate(update) == 0)
    {
      log().warn("update fail: update={}", update);
      return -2;
    }

    try
    {
    // calcolo ed aggiorno il punteggio
      utilityServiceImpl.updateScore(Integer.toString(id));
    }
    catch(Exception e)
    {
      log().warn("the score was not updated for user: ", id);
    }

    return 1;
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.RegisterService2#Scheda3(javax.servlet.http.
   * HttpServletRequest)
   */
  public int Scheda3(ParamsMap params) {

    int id = (Integer) params.get("idLoggato");

    if (id == 0)
    {
      log().warn("id is null.");
      return -1;
    }

    String where = "id_azienda_est =" + id;
    String[] campiString = new String[] { "descrizione_ita", "descrizione_eng", "descrizione_deu", "descrizione_fra", "latitudine", "longitudine" };

    HashBean datiString = servicesImpl.makeHashBean(params, campiString);

    String update = dynamicUpdateImpl.make("caratteristiche", datiString, where) + "; ";

    campiString = new String[] { "myspace", "youtube", "facebook", "flickr" };
    where = "id =" + id;
    datiString = servicesImpl.makeHashBean(params, campiString);

    update += dynamicUpdateImpl.make("datiaziende", datiString, new HashBean(), where);
    if (dbmsImpl.executeUpdate(update) == 0)
    {
      log().warn("update fail: update={}", update);
      return -2;
    }

    try
    {
    // calcolo ed aggiorno il punteggio
      utilityServiceImpl.updateScore(Integer.toString(id));
    }
    catch(Exception e)
    {
      log().warn("the score was not updated for user: ", id);
    }

    return 1;
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.RegisterService2#Scheda4(javax.servlet.http.
   * HttpServletRequest)
   */
  public int Scheda4(ParamsMap params) {

    /* UPDATE TABLE PREZZI */
    HashBean datiInt = new HashBean();
    double prices[] = null;
    String prezzomedio = "0.0";
    String[] tab = (String[]) params.gets("tab");
    if (tab != null && tab.length == TAB_COUNT) {
      prices = toDouble(tab);
      prezzomedio = "" + getAverage(prices);
    }
    if(StringUtils.equals(prezzomedio , "NaN"))
	{
    	prezzomedio = "0.0";
	}
    datiInt.put("prezzomedio", prezzomedio);

    HashBean datiString = new HashBean();
    datiString.put("note", (String) params.get("note"));
    datiString.put("tab", titolareServiceImpl.toNumericSQLArray(prices));

    String where = " id_azienda_est = " + (Integer) params.get("idLoggato");
    String update = dynamicUpdateImpl.make("caratteristiche", datiString, datiInt,
        where);

    if (dbmsImpl.executeUpdate(update) == 0)
    {
      log().warn("update fail: update={}", update);
      return -1;
    }

    /* UPDATE TABLE CALENDARIO */

    datiString = new HashBean();

    String[] allMesi = new String[] { "gennaio", "febbraio", "marzo", "aprile", "maggio",
        "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre" };

    for (String mese : allMesi)
      datiString.put(mese, (String) params.get(mese));

    where = " id_calendario = " + (Integer)params.get("idLoggato");
    update = dynamicUpdateImpl.make("calendario", datiString, where);

    if (dbmsImpl.executeUpdate(update) == 0)
    {
      log().warn("update fail: update={}", update);
      return -2;
    }

    return 1;
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.RegisterService2#SchedaSpot(javax.servlet.http.
   * HttpServletRequest)
   */
  public int SchedaSpot(ParamsMap params) {

    int id = (Integer) params.get("idLoggato");

    if (id == 0)
    {
      log().warn("id is null.");
      return -1;
    }

    String where = "id_azienda_est =" + id;

    String urlslogan1 = (String) params.get("urlslogan1");
    urlslogan1 = urlslogan1.trim();
    String urlslogan2 = (String) params.get("urlslogan2");
    urlslogan2 = urlslogan2.trim();
    String slogan1 = (String) params.get("slogan1");
    slogan1 = slogan1.trim();
    String slogan2 = (String) params.get("slogan2");
    slogan2 = slogan2.trim();

    HashBean datiString = new HashBean();

    if (urlslogan1 != null)
    {
      if (urlslogan1.contains("aggiungere un collegamento") || urlslogan1.equals(""))
      {
        urlslogan1 = " ";
        datiString.put("urlslogan1", urlslogan1);
      }
      datiString.put("urlslogan1", urlslogan1);
    }
    if (urlslogan2 != null)
    {
      if (urlslogan2.contains("aggiungere un collegamento") || urlslogan2.equals(""))
      {
        urlslogan2 = " ";
        datiString.put("urlslogan2", urlslogan2);
      }
      datiString.put("urlslogan2", urlslogan2);
    }
    if (slogan1 != null)
    {
      if (slogan1.contains("scrivere un testo") || slogan1.equals(""))
      {
        slogan1 = " ";
        datiString.put("slogan1", slogan1);
      }
      datiString.put("slogan1", slogan1);
    }
    if (slogan2 != null)
    {
      if (slogan2.contains("scrivere un testo") || slogan2.equals(""))
      {
        slogan2 = " ";
        datiString.put("slogan2", slogan2);
      }
      datiString.put("slogan2", slogan2);
    }

    String update = dynamicUpdateImpl.make("caratteristiche", datiString, where);

/*
    String[] campiString = new String[] { "img11", "img12" };
    where = "id_datiaziende =" + id;
    datiString = servicesImpl.makeHashBean(params, campiString);

    update += dynamicUpdateImpl.make("immagini", datiString, where) + "; ";
*/
    if (dbmsImpl.executeUpdate(update) == 0)
    {
      log().warn("update fail: update={}", update);
      return -2;
    }

    try
    {
    // calcolo ed aggiorno il punteggio
      utilityServiceImpl.updateScore(Integer.toString(id));
    }
    catch(Exception e)
    {
      log().warn("the score was not updated for user: ", id);
    }

    return 1;
  }

  private double getAverage(double[] prices) {

    if (prices.length != TAB_COUNT)
      return 0.0;

    // (1) 3 singole + 4 doppie + 2 triple
    // (7) 3 singole + 4 doppie + 2 triple
    // (1) 3 singole + 4 doppie + 2 triple
    // (7) 3 singole + 4 doppie + 2 triple

    double average = 0.0;

    double[] dayLow = new double[9];
    double[] weekLow = new double[9];
    double[] dayHigh = new double[9];
    double[] weekHigh = new double[9];

    System.arraycopy(prices, 0, dayLow, 0, 9);
    System.arraycopy(prices, 12, weekLow, 0, 9);
    System.arraycopy(prices, 24, dayHigh, 0, 9);
    System.arraycopy(prices, 36, weekHigh, 0, 9);

    int count = 36; // numero max di campi da includere nella media

    for (int i = 0; i < 9; i++) {
      if (dayLow[i] == 0)
        --count;
      if (weekLow[i] == 0)
        --count;
      if (dayHigh[i] == 0)
        --count;
      if (weekHigh[i] == 0)
        --count;
    }

    for (int i = 0; i < 3; i++) {
      average += dayLow[i] + dayHigh[i] + weekLow[i] / 7 + weekHigh[i] / 7;
    }

    for (int i = 3; i < 7; i++) {
      average += dayLow[i] / 2 + dayHigh[i] / 2 + weekLow[i] / 14 + weekHigh[i]
          / 14;
    }

    for (int i = 7; i < 9; i++) {
      average += dayLow[i] / 3 + dayHigh[i] / 3 + weekLow[i] / 21 + weekHigh[i]
          / 21;
    }

    return average / count;
  }

  private double[] toDouble(String[] tab) {

    double[] prices = new double[TAB_COUNT];
    String leteralDouble = "";
    String tabZero = TitolareService.TAB_ZERO + "";
    for (int i = TAB_COUNT; i-- != 0;) {
      try {
        if (tab[i] != null && (!tab[i].equals(tabZero))) {
          leteralDouble = tab[i].replace(',', '.');
          prices[i] = Double.parseDouble(leteralDouble);
        }
      } catch (Exception e) {
        prices[i] = 0.0;
      }
    }

    return prices;
  }
}