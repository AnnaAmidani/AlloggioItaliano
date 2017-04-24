package anna.alit.mock;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.NotImplementedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HttpServletRequestMock implements HttpServletRequest {

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  public Map<String, String> parameters;
  public Map<String, Object> attributes;
  public HttpSessionMock session;
  public RequestDispatcherMock dispatcher;

  public String contextPath = "";
  public String servletPath = "";
  public String realPath = "";

  public HttpServletRequestMock() {
    parameters = new HashMap<String, String>();
    attributes = new HashMap<String, Object>();
    session = new HttpSessionMock();
    dispatcher = new RequestDispatcherMock();

    log().info("");
  }

  @Override
  public String getAuthType() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getContextPath() {
    return contextPath;
  }

  @Override
  public Cookie[] getCookies() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public long getDateHeader(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getHeader(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Enumeration<String> getHeaderNames() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Enumeration<String> getHeaders(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getIntHeader(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getMethod() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getPathInfo() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getPathTranslated() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getQueryString() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getRemoteUser() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getRequestURI() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public StringBuffer getRequestURL() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getRequestedSessionId() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getServletPath() {
    log().error("è stato richiesto un metodo non implementato.");
    return servletPath;
  }

  @Override
  public HttpSession getSession() {
    return session;
  }

  @Override
  public HttpSession getSession(boolean create) {
    if(create && session.invalidated) {
      session = new HttpSessionMock();
    }
    return session;
  }

  @Override
  public Principal getUserPrincipal() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isRequestedSessionIdFromCookie() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isRequestedSessionIdFromURL() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isRequestedSessionIdFromUrl() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isRequestedSessionIdValid() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isUserInRole(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Object getAttribute(String name) {
    return attributes.get(name);
  }

  @Override
  public Enumeration<String> getAttributeNames() {
    Set<String> keyset = attributes.keySet();
    Enumeration<String> attrNames = Collections.enumeration(keyset);

    return attrNames;
  }

  @Override
  public String getCharacterEncoding() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getContentLength() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getContentType() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public ServletInputStream getInputStream() throws IOException {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getLocalAddr() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getLocalName() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getLocalPort() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Locale getLocale() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Enumeration<String> getLocales() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getParameter(String name) {
    return parameters.get(name);
  }

  @Override
  public Map<String, String> getParameterMap() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Enumeration<String> getParameterNames() {
    Set<String> keyset = parameters.keySet();
    Enumeration<String> paramNames = Collections.enumeration(keyset);

    return paramNames;
  }

  @Override
  public String[] getParameterValues(String arg0) {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getProtocol() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public BufferedReader getReader() throws IOException {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getRealPath(String arg0) {
    return realPath;
  }

  @Override
  public String getRemoteAddr() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getRemoteHost() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getRemotePort() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public RequestDispatcher getRequestDispatcher(String path) {
    dispatcher.path = path;
    return dispatcher;
  }

  @Override
  public String getScheme() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getServerName() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getServerPort() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public boolean isSecure() {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public void removeAttribute(String name) {
    attributes.remove(name);
  }

  @Override
  public void setAttribute(String name, Object value) {
    attributes.put(name, value);
  }

  @Override
  public void setCharacterEncoding(String arg0) throws UnsupportedEncodingException {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

}
