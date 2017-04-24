package anna.alit.servicebb;

import java.sql.Timestamp;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;

/**
 * @author anna
 * @created Jun 2, 2009
 */
@Service(EmailConnectionService.SERVICE_NAME)
public class EmailConnectionServiceImpl implements EmailConnectionService
{
  static private Logger logger;
  private double random;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  /*
  *
  */
 public static EmailConnectionService getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   EmailConnectionService service = (EmailConnectionService) (applicationContext.getBean(EmailConnectionService.SERVICE_NAME));
   return service;
 }


 /*
  *
  */
 public EmailConnectionServiceImpl()
 {
   super();
 }



  /* (non-Javadoc)
   * @see anna.alit.servicebb.EmailConnectionService#insertEmailConnection(java.lang.String, java.lang.String, java.lang.String)
   */
  public long insertEmailConnection(String denominazione, String id_azienda, String email_azienda, String email_user)
  {
    long now = new Date().getTime(); // returns the number of milliseconds since January 1, 1970, 00:00:00 GMT
    Timestamp data_creazione;
    String insert;

    int result = 0;

    for(int i = 0; i < 10; i++)
    {
      data_creazione = new Timestamp( now );
      insert = " insert into emailconnection( id_azienda, email_azienda, email_user, data_creazione, denominazione)" +
        "values( " + id_azienda + ", '" + email_azienda + "', '" + email_user + "', '" + data_creazione + "', '" + denominazione + "');";

      result = DbmsImpl.getInstance().executeUpdate(insert);

      if(result == 1)
        break; // ho finito

      // id_azienda + data_creazione già occupati, ricreo now
      random = Math.random() * 6000;
      now = new Date().getTime() + (int)random; // (int)Math.random()*600 => genera un numero tra 0 e 6000
    }

    if(result == 1)
      return now;

    return 0;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.EmailConnectionService#getEmails(java.lang.String, java.lang.String)
   */
  public HashBean getEmails(String id_azienda, String data_creazione)
  {
    long x = 0;
    try
    {
      x = Long.parseLong(data_creazione);
    }
    catch(NumberFormatException e)
    {
      log().error( data_creazione + " non è parserizzabile a numero long.");
      return null;
    }

    Timestamp creationTime = new Timestamp( x );

    String select = "select denominazione, email_azienda, email_user from emailconnection " +
    		"where id_azienda = " + id_azienda + " and data_creazione = '" + creationTime + "' and data_spedizione is null";

    HashBean bean = DbmsImpl.getInstance().executeSingleQuery(select, new String[]{"denominazione", "email_user", "email_azienda"});

    if(bean.get("email_user") == null || bean.get("email_azienda") == null )
    {
      return null;
    }

    return bean;
  }

}
