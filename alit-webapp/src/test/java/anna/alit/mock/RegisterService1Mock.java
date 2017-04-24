package anna.alit.mock;

import anna.alit.servicebb.RegisterService1Impl;


public class RegisterService1Mock extends RegisterService1Impl {

  public static RegisterService1Mock thisobj = null;
  public static RegisterService1Mock getInstance()
  {
    if(thisobj == null)
      return new RegisterService1Mock();
    else
      return thisobj;
  }

  public RegisterService1Mock() {
    dbmsImpl = DbmsMock.getInstance();
    dynamicInsertImpl = DynamicInsertMock.getInstance();
    servicesImpl = ServicesMock.getInstance();
    dynamicUpdateImpl = DynamicUpdateMock.getInstance();
    titolareServiceImpl = TitolareServiceMock.getInstance();
    utilityServiceImpl = UtilityServiceMock.getInstance();

    thisobj = this;
    log().info("");
  }

}
