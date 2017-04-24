package anna.alit.mock;

import anna.alit.servicebb.UpRegService1Impl;

public class UpRegService1Mock extends UpRegService1Impl {

  public static UpRegService1Mock thisobj = null;
  public static UpRegService1Mock getInstance()
  {
    if(thisobj == null)
      return new UpRegService1Mock();
    else
      return thisobj;
  }

  public UpRegService1Mock()
  {
    dynamicUpdateImpl = DynamicUpdateMock.getInstance();
    dbmsImpl = DbmsMock.getInstance();
    servicesImpl = ServicesMock.getInstance();
    utilityServiceImpl = UtilityServiceMock.getInstance();

    thisobj = this;
    log().info("");
  }

}
