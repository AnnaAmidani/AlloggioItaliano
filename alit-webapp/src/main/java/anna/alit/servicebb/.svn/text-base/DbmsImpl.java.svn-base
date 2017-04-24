/**        DbmsImpl.java        */
package anna.alit.servicebb;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;

/**
 * Questa classe mette a disposizione i metodi per effettuare interrogazioni sulla base di dati.
 */
//@Service("dbms")
public class DbmsImpl implements Dbms
{
  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Resource(name = "dataSource")
  protected DataSource dataSource;
  protected Connection connection = null;

  /*
   *
   */
  public static Dbms getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    Dbms service = (Dbms) (applicationContext.getBean("dbms"));
    return service;
  }

  /*
   *
   */
  public DbmsImpl()
  {
    log().debug("##############");
  }

  public Connection openConnection()
  {
    try
    {
      connection = dataSource.getConnection();
      log().debug("#####>>>>>>>>>(open) this.connection={}", this.connection);
    }
    catch (SQLException e)
    {
      log().error(e.getMessage());
      throw new RuntimeException(e);
    }
    return connection;
  }

  private Connection openConnectionForAdmin()
  {
    Connection adminConnection = null;
    try
    {
      adminConnection = dataSource.getConnection();
//      log().info("#####>>>>>>>>>(open) adminConnection={}", adminConnection);
    }
    catch (SQLException e)
    {
      log().error(e.getMessage());
      throw new RuntimeException(e);
    }

    return adminConnection;
  }


  /*
   * @see anna.alit.servicebb.Dbms#closeConnection(java.sql.Connection)
   */
  public void closeConnection(Connection connection)
  {
    log().debug("#####<<<<<<<<< (close)this.connection={}", this.connection);
    if (connection != null)
    {
      try
      {
        connection.close();
      }
      catch (SQLException e)
      {
        log().warn(e.getMessage(), e);
      }
    }
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public ResultSet executeQuery(String query)
  {
    Statement statement = null;
    ResultSet resultset = null;

	try
	{
	  statement = connection.createStatement();
	  resultset = statement.executeQuery(query);
	}
	catch (SQLException e)
	{
	  log().error( query + "\n" + e.getMessage(), e );
	}

	return resultset;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String, java.lang.String[])
   */
  public HashBeanVector executeQuery(String query, String[] campi)
  {
    HashBeanVector result = new HashBeanVector();
    ResultSet rs = null;

    try
    {
      rs = executeQuery(query);
      result.insertResult(rs, campi);
    }
    catch (SQLException e)
    {
      log().error(query + "\n" + e.getMessage(), e);
    }

    return result;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeSingleQuery(java.lang.String, java.lang.String[])
   */
  public HashBean executeSingleQuery(String query, String[] campi)
  {
    HashBean result = new HashBean();
    ResultSet singoloRisultato = null;

    try
    {
      singoloRisultato = executeQuery(query);
      result.insertResult(singoloRisultato, campi);
    }
    catch (SQLException e)
    {
      log().error(query + "\n" + e.getMessage(), e);
    }

    return result;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeUpdate(java.lang.String)
   */
  public int executeUpdate(String update)
  {
    PreparedStatement prepstat = null;
    int result = 0;

    try
    {
      prepstat = connection.prepareStatement(update);
      result = prepstat.executeUpdate();
    }
    catch (SQLException e)
    {
      log().error(update + "\n" + e.getMessage(), e);
    }

    return result;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public List<String> executeGenericAdminQuery(String query)
  {
    Statement statement = null;
    ResultSet resultset = null;
    List<String> mailList = new ArrayList<String>();

    Connection adminConnection = openConnectionForAdmin();

    try
    {
	  statement = adminConnection.createStatement();
	  resultset = statement.executeQuery(query);
	  if(resultset != null)
	  {
	    while(resultset.next())
	    {
	  	 mailList.add(resultset.getString("mail"));
	    }
	  }
	}
	catch (SQLException e)
	{
	  log().error( query + "\n" + e.getMessage(), e );
	}
	finally
	{
	  closeConnection(adminConnection);
	}

  return mailList;
}


  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public ParamsMap retrieveAdminMixedParams(String intValue, String charValue, String query)
  {
    ParamsMap map = new ParamsMapImpl();
    Statement statement = null;
    ResultSet resultset = null;

    Connection adminConnection = openConnectionForAdmin();

    try
    {
      statement = adminConnection.createStatement();
      resultset = statement.executeQuery(query);
      if(resultset != null)
      {
        while(resultset.next())
        {
          map.put(charValue, resultset.getString(charValue));
          map.put(intValue, resultset.getString(intValue));
        }
      }
    }
    catch (SQLException e)
    {
      log().error( query + "\n" + e.getMessage(), e );
    }
    finally
    {
      closeConnection(adminConnection);
    }

  return map;
}


  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public ParamsMap retrieveAdminStringParams(String[] values, String query)
  {
    ParamsMap map = new ParamsMapImpl();
    Statement statement = null;
    ResultSet resultset = null;

    Connection adminConnection = openConnectionForAdmin();

    try
    {
      statement = adminConnection.createStatement();
      resultset = statement.executeQuery(query);
      if(resultset != null)
      {
        while(resultset.next())
        {
          for(String value : values)
          {
            map.put(value, resultset.getString(value));
          }
        }
      }
    }
    catch (SQLException e)
    {
      log().error( query + "\n" + e.getMessage(), e );
    }
    finally
    {
      closeConnection(adminConnection);
    }

  return map;
}

  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public int executeAdminQuery(String query, String integerColumnName)
  {
    Statement statement = null;
    ResultSet resultset = null;
    int id = 0;

    Connection adminConnection = openConnectionForAdmin();
    try
    {
      statement = adminConnection.createStatement();
      resultset = statement.executeQuery(query);

      if (resultset != null)
      {
        while (resultset.next())
        {
          try
          {
            id = resultset.getInt(integerColumnName);
          }
          catch (SQLException e1)
          {
            log().warn(e1.getMessage());
          }
        }
      }

    }
    catch (SQLException e)
    {
      log().error(query + "\n" + e.getMessage(), e);
    }
    finally
    {
      closeConnection(adminConnection);
    }

    return id;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeQuery(java.lang.String)
   */
  public String executeAdminStringQuery(String query, String columnName)
  {
    Statement statement = null;
    ResultSet resultset = null;
    String value = "";

    Connection adminConnection = openConnectionForAdmin();
    try
    {
      statement = adminConnection.createStatement();
      resultset = statement.executeQuery(query);

      if (resultset != null)
      {
        while (resultset.next())
        {
          try
          {
            value = resultset.getString(columnName);
          }
          catch (SQLException e1)
          {
            log().warn(e1.getMessage());
          }
        }
      }

    }
    catch (SQLException e)
    {
      log().error(query + "\n" + e.getMessage(), e);
    }
    finally
    {
      closeConnection(adminConnection);
    }

    return value;
  }

  /*
   * @see anna.alit.servicebb.Dbms#executeUpdate(java.lang.String)
   */
  public int executeAdminUpdate(String update)
  {
    PreparedStatement prepstat = null;
    int result = 0;

    Connection adminConnection = openConnectionForAdmin();
    try
    {
      prepstat = adminConnection.prepareStatement(update);
      result = prepstat.executeUpdate();
    }
    catch (SQLException e)
    {
      log().error(update + "\n" + e.getMessage(), e);
    }
    finally
    {
      closeConnection(adminConnection);
    }
    return result;
  }

  /*
   * (non-Javadoc)
   * @see anna.alit.servicebb.Dbms#insertImage(java.lang.String, java.io.InputStream, int)
   */
  public int insertImage(String insert, InputStream inputStream, int streamLength)
  {
  	PreparedStatement pst = null;
    int esito = 0;
    if(connection == null)
    {
      log().error("insertImage() MUST not use openConnectionForAdmin() !!!");
      Connection adminConnection = openConnectionForAdmin();
      try
      {
        pst = adminConnection.prepareStatement(insert);
        pst.clearParameters();
        pst.setBinaryStream(1, inputStream, streamLength);
        esito = pst.executeUpdate();
      } catch (SQLException e)
      {
        log().error("insertImage failed", e);
      }
      finally
      {
        closeConnection(adminConnection);
      }
    }
    else
    {
      try
      {
        pst = connection.prepareStatement(insert);
        pst.clearParameters();
        pst.setBinaryStream(1, inputStream, streamLength);
        esito = pst.executeUpdate();
      } catch (SQLException e)
      {
        log().error("insertImage failed", e);
      }
    }

    return esito;
  }

  /*
   * (non-Javadoc)
   * @see anna.alit.servicebb.Dbms#insertImageFromAdmin(java.lang.String, byte[])
   */
  public int insertImageFromAdmin(String insert, byte[] bytes)
  {
	PreparedStatement pst = null;
    int esito = 0;
    if(bytes != null)
    {
      Connection adminConnection = openConnectionForAdmin();
      try
      {
        pst = adminConnection.prepareStatement(insert);
        pst.clearParameters();
        pst.setBytes(1, bytes);
        esito = pst.executeUpdate();
      }
      catch (SQLException e)
      {
        log().error("insertImage failed", e);
      }
      finally
      {
        closeConnection(adminConnection);
      }
    }
    return esito;
  }

}
