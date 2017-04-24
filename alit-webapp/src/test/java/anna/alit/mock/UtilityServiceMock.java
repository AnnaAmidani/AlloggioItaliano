package anna.alit.mock;

import anna.alit.servicebb.UtilityServiceImpl;

public class UtilityServiceMock extends UtilityServiceImpl {

  public static UtilityServiceMock thisobj = null;
  public static UtilityServiceMock getInstance()
  {
    if(thisobj == null)
      return new UtilityServiceMock();
    else
      return thisobj;
  }

  public UtilityServiceMock() {
    dbmsImpl = DbmsMock.getInstance();

    thisobj = this;
    log().info("");
  }
}
