package anna.alit.servicebb;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import static org.testng.Assert.*;

@ContextConfiguration(locations = { "/test-alit.spring.xml" })
public class RegisterService1Test extends AbstractTestNGSpringContextTests{

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired protected Dbms dbms;
  @Autowired protected RegisterService1 registerService1;


  //@Test
  public void test_getRegister1New()
  {
    try {

      ParamsMap params = new ParamsMapImpl();

      String nome = "test Anna", cognome = "test Amidani", denominazione = "test AA", regione = "Lombardia",
        sigla = "MN", comune = "Asola", tipologia = "BB", mail = "anna@test.it", telefono = "045123123";

      // inserisco i campi obbligatori
      params.put("nome", nome);
      params.put("cognome", cognome);
      params.put("denominazione", denominazione);
      params.put("regione", regione);
      params.put("sigla", sigla);
      params.put("comune", comune);
      params.put("tipologia", tipologia);
      params.put("mail", mail);
      params.put("telefono", telefono);
      params.put("posizione", new String[] { "boh" });

      dbms.openConnection();

      int id = registerService1.getRegister1New(params);

      assertTrue(id > 0, "Insert fail (id = " + id + ").");
      log().info("Create new entry with Denominazione.id = {}", id);

      // verifico che i campi siano correttamente salvati nel db
      String[] campiTitolare = new String[] { "nome", "cognome" };
      String[] campiDatiaziende = new String[] { "denominazione", "sigla", "comune", "tipologia", "mail", "telefono" };

      HashBean hb = dbms.executeSingleQuery("select * from titolare where id_azienda = " + id + ";", campiTitolare);

      assertEquals( hb.get("nome"), nome, "wrong nome." );
      assertEquals( hb.get("cognome"), cognome, "wrong cognome." );

      hb = dbms.executeSingleQuery("select * from datiaziende where id = " + id + ";", campiDatiaziende);

      assertEquals( hb.get("denominazione"), denominazione, "wrong denominazione." );
      assertEquals( hb.get("sigla"), sigla, "wrong sigla." );
      assertEquals( hb.get("comune"), comune, "wrong comune." );
      assertEquals( hb.get("tipologia"), tipologia, "wrong tipologia." );
      assertEquals( hb.get("mail"), mail, "wrong mail." );
      assertEquals( hb.get("telefono"), telefono, "wrong telefono." );
    }
    catch(Exception e) {
      log().error(":", e);
      assertTrue(false, "test throw an unexpected exception."); //intercetto, stampo e faccio fallire il test perché non mi aspetto exceptions
    }
  }

}
