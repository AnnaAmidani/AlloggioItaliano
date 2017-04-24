package anna.alit.utilities;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RegexReplaceFLet {

	static private Logger logger;
	  @SuppressWarnings("static-access")
	  protected Logger log()
	  {
	    if (this.logger == null)
	      this.logger = LoggerFactory.getLogger(this.getClass());
	    return this.logger;
	  }

    private String searchFor;
    private String replaceWith;

    public void init(ServletConfig config)
    {
      this.searchFor = config.getInitParameter("searchFor");
      log().info("searchFor: "+searchFor);
      this.replaceWith = config.getInitParameter("replaceWith");
      log().info("replaceWith: "+replaceWith);
    }

    public void run(HttpServletRequest request, HttpServletResponse response)
    {
      String source = (String) request.getAttribute("source");
      log().info("source: "+source);
      String target = source.replaceAll(searchFor, replaceWith);
      log().info("target: "+target);

      request.setAttribute("target", target);
    }
}
