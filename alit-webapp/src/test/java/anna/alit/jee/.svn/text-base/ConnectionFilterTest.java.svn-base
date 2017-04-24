/* $Id: ConnectionFilter.java 34 2009-06-19 16:13:32Z michele.bianchi $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.jee;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

import anna.alit.servicebb.DbmsImpl;


/**
 * @author anna
 * @created Jul 3, 2009
 */
abstract class ConnectionFilterTest implements Filter
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
   * @see javax.servlet.Filter#destroy()
   */
  @Override
  public void destroy()
  {
    // TODO Auto-generated method stub

  }

  /*
   * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
   */
  @BeforeMethod
  public void openConnection()
  {
    DbmsImpl.getInstance().openConnection();
  }

  /*
   * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
   */
  @AfterMethod
  public void closeConnection(Connection connection)
  {
    DbmsImpl.getInstance().closeConnection(connection);
  }

  /*
   * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
   */
  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
  {
    if (request instanceof HttpServletRequest)
    {
      HttpServletRequest http = (HttpServletRequest) (request);
      log().info("pathinfo={}", http.getPathInfo());
    }
    if (filterConfig == null)
      return;

    Connection connection = DbmsImpl.getInstance().openConnection();

    //log().info("connection={}", connection);

    chain.doFilter(request, response);

    DbmsImpl.getInstance().closeConnection(connection);

  }


  /*
   * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
   */
  @Override
  public void init(FilterConfig filterConfig) throws ServletException
  {
    this.filterConfig = filterConfig;
  }

}
