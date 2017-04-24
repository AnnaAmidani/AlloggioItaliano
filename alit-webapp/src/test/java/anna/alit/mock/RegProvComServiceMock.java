package anna.alit.mock;

import anna.alit.servicebb.RegProvComServiceImpl;

public class RegProvComServiceMock extends RegProvComServiceImpl {

  public static RegProvComServiceMock thisobj = null;
  public static RegProvComServiceMock getInstance()
  {
    if(thisobj == null)
      return new RegProvComServiceMock();
    else
      return thisobj;
  }

  public RegProvComServiceMock()
  {
    dbmsImpl = DbmsMock.getInstance();

    thisobj = this;
    log().info("");
  }

}
