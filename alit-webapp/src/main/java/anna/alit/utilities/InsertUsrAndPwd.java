package anna.alit.utilities;

import java.sql.*;

import org.apache.commons.lang.xwork.StringUtils;

import anna.alit.servicebb.UtilityServiceImpl;

public class InsertUsrAndPwd
{

  public void insert(String execute)
  {
    if(StringUtils.isNotEmpty(execute) && StringUtils.equals(execute, "true"))
    {
      String query = "select id, denominazione, password from datiaziende, titolare where datiaziende.id = titolare.id_azienda and titolare.password is null";

      ResultSet rs = DbUtil.executeQuery(query);

      String id, denominazione, usr, psw, update, isThere;
      try
      {
        while (rs.next())
        {
          id = rs.getString("id");
          denominazione = rs.getString("denominazione");
          System.out.print(id + "\t" + denominazione + "\t");

          usr = UtilService.createUsername(denominazione);
          psw = UtilService.createPsw(7);

          psw = UtilityServiceImpl.getInstance().pwdResolver(psw, true);

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

          /*
           *
           *  Queste update vanno aggiunte nel caso in cui ci troviamo a dover inserire delle strutture ex-novo

          String updateFiglie = "INSERT INTO caratteristiche(id_azienda_est) VALUES(" + id + "); INSERT INTO calendario(id_calendario) values(" + id + "); ";
          update = updateFiglie + "insert into titolare (id_azienda, username, password, nome, cognome) " + "values(" + id + ",'" + usr + "','" + psw + "', ' ', ' ')";
           */

          update = "update titolare set username = '"+usr+"', password ='"+psw+"' where id_azienda="+id;

          System.out.println("updated " + DbUtil.executeUpdate(update) + "\n");
        }
      }
      catch (Exception e)
      {
        System.out.println(e + "\n HERE!! " + e.getMessage() + "\n" + e.getStackTrace());
      }
      System.out.println("end!");

    }

  }





  /**
   * @param usr
   * @return
   * @throws SQLException
   */
  private static String isThereUser(String usr) throws SQLException
  {
    String queryIsThereUser = "select count(codice) as num from titolare where username ='" + usr + "';";

    ResultSet resSet = DbUtil.executeQuery(queryIsThereUser);
    resSet.next();

    return resSet.getString("num");
  }

}