package anna.alit.mock;

import anna.alit.servicebb.SegnalazioniServiceImpl;

public class SegnalazioniServiceMock extends SegnalazioniServiceImpl {

  public static SegnalazioniServiceMock thisobj = null;
  public static SegnalazioniServiceMock getInstance()
  {
    if(thisobj == null)
      return new SegnalazioniServiceMock();
    else
      return thisobj;
  }

  public SegnalazioniServiceMock()
  {
    dynamicInsert = DynamicInsertMock.getInstance();
    services = ServicesMock.getInstance();

    thisobj = this;
    log().info("");
  }
}
