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
public class RegisterService2Test extends AbstractTestNGSpringContextTests{

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired protected Dbms dbms;
  @Autowired protected RegisterService2 registerService2;


  //@Test
  public void test_Scheda2()
  {
    try {

      ParamsMap params = new ParamsMapImpl();

      Integer id = 35;

      String offerta="si", include="solo pernottamento", prenotazione="con caparra",
      dal="2009-04-12", al="2009-12-04", duratamin="3", scontodel="30", entrokm="2";


      params.put("offerta", offerta);
      params.put("include", include);
      params.put("prenotazione", prenotazione);
      params.put("dal", dal);
      params.put("al", al);

      params.put("duratamin", duratamin);
      params.put("scontodel", scontodel);
      params.put("entrokm", entrokm);

      params.put("idLoggato", id);

      dbms.openConnection();

      int inserted = registerService2.Scheda2(params);

      assertTrue(inserted == 1, "Insert fail (error code: " + inserted + ").");
      log().info("Create new entry with id = {}", id);

      // verifico che i campi siano correttamente salvati nel db
      String[] campiCaratteristiche = new String[] { "offerta", "include", "prenotazione", "dal", "al", "duratamin",
          "scontodel", "entrokm", "camera", "bagno", "tavola", "struttura", "pagamento"};

      HashBean hb = dbms.executeSingleQuery("select * from caratteristiche where id_azienda_est = " + id + ";", campiCaratteristiche);

      assertEquals( hb.get("offerta"), offerta, "wrong offerta." );
      assertEquals( hb.get("include"), include, "wrong include." );
      assertEquals( hb.get("prenotazione"), prenotazione, "wrong prenotazione." );
      assertEquals( hb.get("dal"), dal, "wrong dal." );
      assertEquals( hb.get("al"), al, "wrong al." );
      assertEquals( hb.get("duratamin"), duratamin, "wrong duratamin." );
      assertEquals( hb.get("scontodel"), scontodel, "wrong scontodel." );
      assertEquals( hb.get("entrokm"), entrokm, "wrong entrokm." );
    }
    catch(Exception e) {
      log().error(":", e);
      assertTrue(false, "test throw an unexpected exception."); //intercetto, stampo e faccio fallire il test perché non mi aspetto exceptions
    }
  }

}
