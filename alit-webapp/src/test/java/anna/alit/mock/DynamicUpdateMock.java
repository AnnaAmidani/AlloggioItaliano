package anna.alit.mock;

import anna.alit.servicebb.DynamicUpdateImpl;

public class DynamicUpdateMock extends DynamicUpdateImpl {

  public static DynamicUpdateMock thisobj = null;
  public static DynamicUpdateMock getInstance()
  {
    if(thisobj == null)
      return new DynamicUpdateMock();
    else
      return thisobj;
  }

  public DynamicUpdateMock() {
    dbmsImpl = DbmsMock.getInstance();
    servicesImpl = ServicesMock.getInstance();

    thisobj = this;
    log().info("");
  }

}
