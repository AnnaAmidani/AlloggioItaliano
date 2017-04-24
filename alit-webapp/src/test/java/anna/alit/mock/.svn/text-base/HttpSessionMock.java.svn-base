package anna.alit.mock;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.commons.lang.NotImplementedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("deprecation")
public class HttpSessionMock implements HttpSession {

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  public Map<String, Object> attributes;
  public boolean invalidated, isNew;

  public HttpSessionMock() {
    attributes = new HashMap<String, Object>();
    invalidated = false;
    isNew = true;

    log().info("");
  }

  @Override
  public Object getAttribute(String name) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    isNew = false;
    return attributes.get(name);
  }

  @Override
  public Enumeration<String> getAttributeNames() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public long getCreationTime() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String getId() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public long getLastAccessedTime() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public int getMaxInactiveInterval() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public ServletContext getServletContext() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  @Deprecated
  public HttpSessionContext getSessionContext() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public Object getValue(String arg0) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public String[] getValueNames() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public void invalidate() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    invalidated = true;
  }

  @Override
  public boolean isNew() {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    return isNew;
  }

  @Override
  public void putValue(String arg0, Object arg1) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public void removeAttribute(String name) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    attributes.remove(name);
  }

  @Override
  public void removeValue(String name) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

  @Override
  public void setAttribute(String name, Object value) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    isNew = false;
    attributes.put(name, value);
  }

  @Override
  public void setMaxInactiveInterval(int arg0) {
    if(invalidated)
      throw new IllegalStateException("l'oggetto è stato invalidato");

    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

}
