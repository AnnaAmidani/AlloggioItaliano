/* $Id: ConnectionFilter.java 334 2010-09-19 16:20:18Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.utilities;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author anna
 * @created May 28, 2009
 */
public class RegexFilter implements Filter
{

  static private Logger logger;


  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  private FilterConfig filterConfig;

  /*
   * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
   */
  @Override
  public void init(FilterConfig filterConfig) throws ServletException
  {
    this.filterConfig = filterConfig;
    log().debug("filterConfig is={}", filterConfig);
  }

  /*
   * @see javax.servlet.Filter#destroy()
   */
  @Override
  public void destroy()
  {
    this.filterConfig = null;
    log().debug("\n -> RegexFilter destroyed");
  }


  /*
   * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
   */
  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
  {
    if (filterConfig == null)
    {
      log().warn("filterConfig is null");
      return;
    }

    try
    {
      chain.doFilter(request, response);
    }
    catch (Exception e)
    {
      log().error( "{}", e.getMessage(), e );
    }

  }

}
