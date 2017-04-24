package anna.alit.mock;

import anna.alit.servicebb.ServicesImpl;

public class ServicesMock extends ServicesImpl {

  public static ServicesMock thisobj = null;
  public static ServicesMock getInstance()
  {
    if(thisobj == null)
      return new ServicesMock();
    else
      return thisobj;
  }

  public ServicesMock() {

    thisobj = this;
    log().info("");
  }

}
