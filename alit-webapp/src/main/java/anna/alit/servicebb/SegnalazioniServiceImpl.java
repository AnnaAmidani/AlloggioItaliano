package anna.alit.servicebb;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.utilities.UtilService;

@Service(SegnalazioniServiceImpl.SERVICE_NAME)
public class SegnalazioniServiceImpl implements SegnalazioniService {

static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired protected DynamicInsert dynamicInsert;
  @Autowired protected Services services;

  /*
  *
  */
 public static SegnalazioniService getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   SegnalazioniService service = (SegnalazioniService)(applicationContext.getBean(SegnalazioniService.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public SegnalazioniServiceImpl()
 {
   log().info("");
 }



 /*
  *
  */

 /* (non-Javadoc)
 * @see anna.alit.servicebb.SegnalazioniService#setSegnalazione(javax.servlet.http.HttpServletRequest, int)
 */
public void setSegnalazione(HttpServletRequest request, int id) {


  String[] campiString = new String[]{"nome", "tipo", "regione", "idazienda",
          "descrizione2","categoria", "settore", "dal", "al"};
  String prov = request.getParameter("sigla");
  String comu = request.getParameter("comune");
  comu = UtilService.alitRequestFormatter(comu);

  HashBean datiString = services.makeHashBean(request, campiString);

  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String data = sdf.format(new Date());

  datiString.put("datapubblicazione", data);

  if(prov != null && !prov.equals("0"))
      datiString.put("prov", prov);
  if(comu != null && !comu.equals("comune"))
      datiString.put("comu", comu);

  dynamicInsert.execute("segnalazioni", datiString);

}

}


