package anna.alit.mock;

import anna.alit.servicebb.AlloggioServiceImpl;

public class AlloggioServiceMock extends AlloggioServiceImpl {

  public static AlloggioServiceMock thisobj = null;
  public static AlloggioServiceMock getInstance()
  {
    if(thisobj == null)
      return new AlloggioServiceMock();
    else
      return thisobj;
  }

  public AlloggioServiceMock()
  {
    dbmsImpl = DbmsMock.getInstance();

    thisobj = this;
    log().info("");
  }
}
