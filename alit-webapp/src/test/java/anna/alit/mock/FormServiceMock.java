package anna.alit.mock;

import anna.alit.servicebb.FormServiceImpl;

public class FormServiceMock extends FormServiceImpl {

  public static FormServiceMock thisobj = null;
  public static FormServiceMock getInstance()
  {
    if(thisobj == null)
      return new FormServiceMock();
    else
      return thisobj;
  }

  public FormServiceMock()
  {
    thisobj = this;
    log().info("");
  }

}
