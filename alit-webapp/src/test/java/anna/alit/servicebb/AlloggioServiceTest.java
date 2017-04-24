package anna.alit.servicebb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.Test;

import static org.testng.Assert.*;

import anna.alit.beanbb.HashBeanVector;

@ContextConfiguration(locations = { "/test-alit.spring.xml" })
public class AlloggioServiceTest extends AbstractTestNGSpringContextTests{

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired protected Dbms dbms;
  @Autowired protected AlloggioService alloggioService;


  //@Test
  public void test_getAziende()
  {
    HashBeanVector hbv = null;

    String query =
      "SELECT denominazione, tipoesteso, comune " +
      "from datiaziende order by tipoesteso";

    dbms.openConnection();

    hbv = dbms.executeQuery(query, new String[]{"denominazione","tipoesteso","comune"});

    String[] denominazioni = hbv.getAsArray("denominazione");

    boolean esito = false;

    for(String den : denominazioni){
      if(den.equals("Aramis")) {
        esito = true;
        break;
      }
    }

    assertTrue( esito, "Aramis non esiste" );

  }





}


