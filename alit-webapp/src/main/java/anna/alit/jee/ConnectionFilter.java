/* $Id: ConnectionFilter.java 515 2012-01-03 20:55:41Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.jee;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import anna.alit.servicebb.DbmsImpl;


/**
 * @author anna
 * @created May 28, 2009
 */
public class ConnectionFilter implements Filter
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
    log().debug("\n -> ConnectionFilter destroyed");
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

    if(request.getCharacterEncoding() == null)
    {
      //log().info("the char encoding is null, setting it to utf-8");
      try
      {
	      request.setCharacterEncoding("utf-8");
	    }
      catch (UnsupportedEncodingException e)
      {
	      log().warn("unable to set character encoding to utf-8! "+ e.getMessage());
      }
    }

    Connection connection = null;

    try
    {
      connection = DbmsImpl.getInstance().openConnection();
//      log().info("connection='{}'", connection);
      chain.doFilter(request, response);
//      log().info("request encode.. "+request.getCharacterEncoding());
//      log().info("response encode.. "+response.getCharacterEncoding());
    }
    catch (Exception e)
    {
      log().error( "{}", e.getMessage(), e );
    }

    DbmsImpl.getInstance().closeConnection(connection);

  }

}
