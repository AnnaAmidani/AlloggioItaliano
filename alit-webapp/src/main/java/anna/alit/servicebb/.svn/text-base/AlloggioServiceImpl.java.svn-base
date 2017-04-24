package anna.alit.servicebb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.*;

@Service(AlloggioServiceImpl.SERVICE_NAME)
public class AlloggioServiceImpl implements AlloggioService {

  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired protected DbmsImpl dbmsImpl;

  /*
  *
  */
 public static AlloggioService getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   AlloggioService service = (AlloggioService)(applicationContext.getBean(AlloggioService.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public AlloggioServiceImpl()
 {
   log().info("");
 }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.AlloggioService#getAziende()
   */
  public HashBeanVector getAziende() {


    String query =
      "SELECT denominazione, tipoesteso, comune " +
      "from datiaziende order by tipoesteso";

    return dbmsImpl.executeQuery(query, new String[]{"denominazione","tipoesteso","comune"});
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.AlloggioService#AziendeAction()
   */
  public HashBeanVector AziendeAction() {

    HashBeanVector hashResult = null;
    hashResult = getAziende();

    return hashResult;
    }


}