package anna.alit.mock;

import anna.alit.servicebb.RegisterService2Impl;

public class RegisterService2Mock extends RegisterService2Impl {

  public static RegisterService2Mock thisobj = null;
  public static RegisterService2Mock getInstance()
  {
    if(thisobj == null)
      return new RegisterService2Mock();
    else
      return thisobj;
  }

  public RegisterService2Mock()
  {
    dbmsImpl = DbmsMock.getInstance();
    servicesImpl = ServicesMock.getInstance();
    dynamicUpdateImpl = DynamicUpdateMock.getInstance();
    utilityServiceImpl = UtilityServiceMock.getInstance();
    titolareServiceImpl = TitolareServiceMock.getInstance();

    thisobj = this;
    log().info("");
  }

}
