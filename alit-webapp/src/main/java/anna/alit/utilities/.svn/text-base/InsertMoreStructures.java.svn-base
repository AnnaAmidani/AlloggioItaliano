package anna.alit.utilities;

import java.sql.*;
import java.util.Random;

public class InsertMoreStructures
{

  private static String LoginUrl = "jdbc:postgresql://localhost:5432/alit_pro";
  private static String LoginUser = "anna";
  private static String LoginPasswd = "ciao";
  private static String driver = "org.postgresql.Driver";

  public static ResultSet executeQuery(String query)
  {

    Connection connection = null;
    Statement statement = null;
    ResultSet resultset = null;

    try
    {
      Class.forName(driver); // carica il driver

      // Tentativo di connessione al database
      connection = DriverManager.getConnection(LoginUrl, LoginUser, LoginPasswd);
      // connesso.

      // ottengo l'oggetto per l'esecuzione della query
      statement = connection.createStatement();

      // Eseguo l'interrogazione desiderata
      resultset = statement.executeQuery(query);

    }
    catch (ClassNotFoundException e)
    {
      e.printStackTrace();
    }
    catch (SQLException e)
    {
      e.printStackTrace();
    }
    finally
    {

      if (connection != null)
      {
        try
        {
          connection.close();
        }
        catch (SQLException sqle1)
        {
          sqle1.printStackTrace();
        }
      }
    }
    return resultset;
  }

  public static int executeUpdate(String update) throws SQLException, ClassNotFoundException
  {

    Connection connection = null;
    PreparedStatement prepstat = null;
    int rs = 0;

    try
    {
      Class.forName(driver); // carica il driver

      // Tentativo di connessione al database
      connection = DriverManager.getConnection(LoginUrl, LoginUser, LoginPasswd);
      // connesso.

      // ottengo l'oggetto per l'esecuzione della query
      prepstat = connection.prepareStatement(update);

      // Eseguo l'interrogazione desiderata
      rs = prepstat.executeUpdate();

    }
    catch (ClassNotFoundException e)
    {
      throw e;
    }
    catch (SQLException e)
    {
      throw e;
    }
    finally
    {

      if (connection != null)
      {
        try
        {
          connection.close();
        }
        catch (SQLException sqle1)
        {
          sqle1.printStackTrace();
        }
      }
    }
    return rs;
  }

  public static void main(String[] args)
  {

    String query = "select id, denominazione from datiaziende where id > 43029";

    ResultSet rs = executeQuery(query);

    String id, denominazione, usr, psw, update, isThere;
    try
    {
      while (rs.next())
      {
        id = rs.getString("id");
        System.out.println(id);
        denominazione = rs.getString("denominazione");
        System.out.print(id + "\t" + denominazione + "\t");

        usr = createUsername(denominazione);
        psw = createPsw(7);

        isThere = isThereUser(usr);
        int j = 0;

        while (!isThere.equals("0"))
        {
          if (j < 100)
          {
            ++j;
            isThere = isThereUser(usr + j);
          }
        }
        if (j != 0)
          usr += j;

        String updateFiglie = "INSERT INTO caratteristiche(id_azienda_est) VALUES(" + id
            + "); INSERT INTO calendario(id_calendario) values(" + id + "); ";

        update = updateFiglie + "insert into titolare (id_azienda, username, password, nome, cognome) " + "values("
            + id + ",'" + usr + "','" + psw + "', ' ', ' ')";

        System.out.println("updated " + executeUpdate(update) + "\n");
      }
    }
    catch (Exception e)
    {
      System.out.println(e + "\n HERE!! " + e.getMessage() + "\n" + e.getStackTrace());
    }
    System.out.println("end!");
  }

  private static String isThereUser(String usr) throws SQLException
  {
    String queryIsThereUser = "select count(codice) as num from titolare where username ='" + usr + "';";

    ResultSet resSet = executeQuery(queryIsThereUser);
    resSet.next();

    return resSet.getString("num");
  }

  public static String createUsername(String s)
  {
    replaceSpecial(s);
    char[] lower = s.toCharArray();
    String username = "";

    for (char ch : lower)
    {
      if (Character.isLetter(ch) || Character.isDigit(ch))
        username += ch;
      username = username.toLowerCase();
    }
    return username;
  }

  public static String createPsw(int length)
  {

    Random random = new Random();

    String chars = "";
    chars += "abcdefghijkmnpqrstuvwyz";
    chars += "ABCDEFGHJLKMNPQRSTUVWYZ";
    chars += "23456789";

    int numChars = chars.length();

    if (length <= 0)
      return "";

    StringBuffer buffer = new StringBuffer();

    char ch;
    for (int i = 0; i < length; i++)
    {
      ch = chars.charAt(random.nextInt(numChars));
      buffer.append(ch);
    }

    return buffer.toString();
  }

  private static String replaceSpecial(String s)
  {
    if (s.indexOf('à') != -1)
    {
      s = s.replace('à', 'a');
    }
    if (s.indexOf('è') != -1)
    {
      s = s.replace('è', 'e');
    }
    if (s.indexOf('ì') != -1)
    {
      s = s.replace('ì', 'i');
    }
    if (s.indexOf('ò') != -1)
    {
      s = s.replace('ò', 'o');
    }
    if (s.indexOf('ù') != -1)
    {
      s = s.replace('ù', 'u');
    }
    if (s.indexOf('é') != -1)
    {
      s = s.replace('é', 'e');
    }
    return s;
  }

}