/* $Id: AlitAction.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 */
package anna.alit.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;



/**
 *
 * @author mic
 * @created Apr 16, 2008
 */
@Service("alitAction")
@Scope("prototype")
public class AlitAction extends ActionSupport implements Preparable
{
  /**
	 *
	 */
	private static final long serialVersionUID = -2201400831637601954L;
static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }


  /*
   * @see com.opensymphony.xwork2.Preparable#prepare()
   */
  @Override
  public void prepare() throws Exception
  {
  }


  /**
   * just the default method, doing nothing
   */
  @Override
  public String execute()
  {
    log().info("##########################################################");
    return SUCCESS;
  }


  /**
   *
   */
  public String bind()
  {
    log().info("##########################################################");
    return SUCCESS;
  }

}
