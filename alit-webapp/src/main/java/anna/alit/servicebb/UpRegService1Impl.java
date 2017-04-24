package anna.alit.servicebb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@Service(UpRegService1Impl.SERVICE_NAME)
public class UpRegService1Impl implements UpRegService1 {

  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }


  @Autowired protected DynamicUpdateImpl dynamicUpdateImpl;
  @Autowired protected DbmsImpl dbmsImpl;
  @Autowired protected ServicesImpl servicesImpl;
  @Autowired protected UtilityServiceImpl utilityServiceImpl;
 /*
  *
  */
 public static UpRegService1 getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   UpRegService1 service = (UpRegService1)(applicationContext.getBean(UpRegService1.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public UpRegService1Impl()
 {
   log().info("");
 }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.UpRegService1#updateReg1(javax.servlet.http.HttpServletRequest)
   */
  public int updateReg1(HttpServletRequest request) {

      HttpSession session = request.getSession();

      int idLoggato = (Integer) session.getAttribute("idLoggato");

      if(idLoggato == 0)
          return -1;

      String[] campiString = new String[]{"denominazione", "sigla",
              "nzona", "zona", "loco", "indirizzo", "civico",
              "telefono", "cellulare", "fax", "telefono2", "cellulare2", "fax2",
              "mail", "skype", "web", "tipologia", "costruzione"};
      String[] campiInt = new String[]{"annofondazione", "cap"};
      String[] campiArrayString = new String[]{"posizione"};
      String where = "id =" + idLoggato;
      String comune = request.getParameter("comune");

      HashBean datiString = servicesImpl.makeHashBean(request, campiString);

      if(comune != null && !comune.equals("comune") && !comune.equals("0"))
          datiString.put("comune", comune);

      HashBean datiInt = servicesImpl.makeHashBean(request, campiInt);
      HashBeanVector datiArrayString = servicesImpl.makeHashBeanVector(request, campiArrayString);

      String update = dynamicUpdateImpl.make("datiaziende", datiString, datiInt, datiArrayString, where );

      campiString = new String[]{"nome", "cognome", "mese", "codicefiscale"};
      campiInt = new String[]{"giorno", "anno"};
      where = "id_azienda =" + idLoggato;

      datiString = servicesImpl.makeHashBean(request, campiString);
      datiInt = servicesImpl.makeHashBean(request, campiInt);

      update += dynamicUpdateImpl.make("titolare", datiString, datiInt, where );

      campiString = new String[]{"aeroporti", "autostrade", "stazioni"};
      campiInt = new String[]{"numcamere", "numlettimin", "numlettimax", "numlettitot", "appartamenti",
                              "kmcapoluogo", "kmcasello", "kmaeroporto", "kmstazione", "mtmezzipubblici"};
      campiArrayString = new String[]{"lingue"};
      where = "id_azienda_est =" + idLoggato;

      datiString = servicesImpl.makeHashBean(request, campiString);
      datiInt = servicesImpl.makeHashBean(request, campiInt);
      datiArrayString = servicesImpl.makeHashBeanVector(request, campiArrayString);

      update += " " + dynamicUpdateImpl.make("caratteristiche", datiString, datiInt, datiArrayString, where);

      if( dbmsImpl.executeUpdate(update) == 0)
          return -4;

      // calcolo ed aggiorno il punteggio
      utilityServiceImpl.updateScore(idLoggato + "");

      return 1;
  }
}