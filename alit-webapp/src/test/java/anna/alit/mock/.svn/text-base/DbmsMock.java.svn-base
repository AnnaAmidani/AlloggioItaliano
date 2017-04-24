package anna.alit.mock;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

import anna.alit.servicebb.DbmsImpl;

public class DbmsMock extends DbmsImpl {

  public static DbmsMock thisobj = null;
  public static DbmsMock getInstance()
  {
    if(thisobj == null)
      return new DbmsMock();
    else
      return thisobj;
  }
  @Resource(name = "dataSource")
  protected DataSource dataSource;
  public String LoginUrl = "jdbc:postgresql://localhost:5432/bb_db";
  public String LoginUser = "postgres";
  public String LoginPasswd = "1982sql";
  public String driver = "org.postgresql.Driver";

  public DbmsMock() {
    connection = openConnection();

    thisobj = this;
    log().info("");
  }

  @BeforeMethod
  public Connection openConnection()
  {
    Connection conn = null;
    try
    {
      // carica il driver
      Class.forName(driver);
      // si connette al database
      conn = DriverManager.getConnection(LoginUrl, LoginUser, LoginPasswd);
    }
    catch(Exception e)
    {
      log().error("Errore durante l'apertura di una connessione al DB:", e);
      return null;
    }

    return conn;
  }



@AfterMethod
public void closeConnection(Connection connection)
{

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

}

