package anna.alit.mock;

import anna.alit.servicebb.TitolareServiceImpl;

public class TitolareServiceMock extends TitolareServiceImpl{

  public static TitolareServiceMock thisobj = null;
  public static TitolareServiceMock getInstance()
  {
    if(thisobj == null)
      return new TitolareServiceMock();
    else
      return thisobj;
  }

  public TitolareServiceMock() {
    dbmsImpl = DbmsMock.getInstance();

    thisobj = this;
    log().info("");
  }
}
