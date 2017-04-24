package anna.alit.beanbb;

import java.lang.reflect.Array;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class ParamsMapImpl extends HashMap<String, Object>  implements ParamsMap
{
  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  public Object put(String key, Object value)
  {
   return super.put(key, value);
  }


  /*
   * (non-Javadoc)
   *
   * @see anna.alit.beanbb.ParamsMap#put(javax.servlet.http.HttpServletRequest)
   */
  @SuppressWarnings("unchecked")
  public void put(HttpServletRequest request)
  {
    Enumeration<String> paramNames = request.getParameterNames();
    String name;
    Object value;
    while( paramNames.hasMoreElements() )
    {
      name = paramNames.nextElement();
      value = request.getParameterValues(name);
      super.put(name, value);
    }
  }

  @SuppressWarnings("unchecked")
  public void put(HttpSession session)
  {
    Enumeration<String> paramNames = session.getAttributeNames();
    String name;
    Object value;
    while( paramNames.hasMoreElements() )
    {
      name = paramNames.nextElement();
      value = session.getAttribute(name);
      super.put(name, value);
    }
  }

  @SuppressWarnings("unchecked")
  public void put(ResultSet resultSet)
  {
    if( resultSet == null )
      return;

    ArrayList<String> keys = new ArrayList<String>();
    String key = null;
    ArrayList<Object> list = null;

    try
    {
      /* ottengo tutte le chiavi contenute nel ResultSet */
      ResultSetMetaData metaData = resultSet.getMetaData();

      if( metaData == null )
        return;

      int column_number = metaData.getColumnCount();

      for( int i = 1; i <= column_number; i++ )
      {
        key = metaData.getColumnName(i).toLowerCase();

        if( ! keys.contains(key))
        {
          keys.add(key);
        }

        super.put(key, new ArrayList<Object>());
      }
    }
    catch( SQLException e )
    {
      log().error("\n\tkey: " + key + "\n" , e);
      return;
    }

    try
    {
      /* ottengo tutti i valori contenuti nel ResultSet inserendoli in un ArrayList */
      while( resultSet.next() )
      {
        for( String k : keys )
        {
          key = k;
          list = (ArrayList<Object>) super.get(k);
          list.add( resultSet.getObject(k) );
        }
      }
    }
    catch( SQLException e )
    {
      log().error("\n\tkey: " + key + "\n" , e);
      return;
    }

    try
    {
      /* Converto ArrayList in array */
      for( String k : keys )
      {
        key = k;
        list = (ArrayList<Object>) super.get(k);
        super.put(k, list.toArray());
      }
    }
    catch( ClassCastException e )
    {
      log().error("\n\tkey: " + key + "\n" , e);
      return;
    }

  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.beanbb.ParamsMap#get(java.lang.String)
   */
  public Object get(String key)
  {
    Object value = super.get(key);

    if( value == null )
      return null;

    try
    {
      value = Array.get(super.get(key), 0);
    }
    catch( IllegalArgumentException e0 )
    {
      return super.get(key);
    }

    return value;
  }

  public Object get(String key, int index)
  {
    Object value = super.get(key);

    if( value == null )
      return null;

    try
    {
      value = Array.get(super.get(key), index);
    }
    catch( Exception e )
    {
      return null;
    }

    return value;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.beanbb.ParamsMap#gets(java.lang.String)
   */
  public Object gets(String key)
  {
    return super.get(key);
  }

}
