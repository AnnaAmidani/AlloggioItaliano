package anna.alit.mock;

import anna.alit.servicebb.DynamicInsertImpl;

public class DynamicInsertMock extends DynamicInsertImpl {

  public static DynamicInsertMock thisobj = null;
  public static DynamicInsertMock getInstance()
  {
    if(thisobj == null)
      return new DynamicInsertMock();
    else
      return thisobj;
  }

  public DynamicInsertMock() {
    dbmsImpl = DbmsMock.getInstance();
    servicesImpl = ServicesMock.getInstance();

    thisobj = this;
    log().info("");
  }
}
