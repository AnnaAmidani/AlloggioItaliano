package anna.alit.servicebb;

import java.sql.ResultSet;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@Service(DynamicSelectImpl.SERVICE_NAME)
public class DynamicSelectImpl implements DynamicSelect {

    static private Logger logger; @SuppressWarnings("static-access")
    protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

    @Autowired private DbmsImpl dbmsImpl;

    /*
    *
    */
   public static DynamicSelect getInstance()
   {
     WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
     DynamicSelect service = (DynamicSelect)(applicationContext.getBean(DynamicSelect.SERVICE_NAME));
     return service;
   }



   /*
    *
    */
   public DynamicSelectImpl()
   {
     log().info("");
   }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#execute(java.lang.String, java.lang.String, java.lang.String)
   */
  public ResultSet execute(String select, String from, String where) {
    return dbmsImpl.executeQuery("select " + select + " from " + from + " where " + where);
  }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#execute(java.lang.String, java.lang.String, java.lang.String, java.lang.String[])
   */
  public HashBeanVector execute(String select, String from, String where, String[] campi) {
    return dbmsImpl.executeQuery("select " + select + " from " + from + " where " + where, campi);
  }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#execute(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String[])
   */
  public HashBeanVector execute(String select, String from, String where, String orderBy, String[] campi) {
    return dbmsImpl.executeQuery("select " + select + " from " + from + " where " + where + orderBy, campi);
  }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#makeSimpleWhere(anna.alit.beanbb.HashBean)
   */
  public String makeSimpleWhere(HashBean datiString) {


    String value, result = "";
    String[] keys;

    if(datiString != null) {
      keys = datiString.getAllKeysAsArray();

      for(String key : keys) {
        value = (datiString.get(key) == null) ? "" : datiString.get(key).replace('\'', '`');

        if(! value.equals("") ) {
          result += "AND " + key + " = '" + value + "'\n";
        }
      }
    }

    return result;

  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#makeWhere(anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector)
   */
  public String makeWhere(HashBean datiString, HashBean datiInt,
      HashBeanVector datiArrayString) {


    // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
    String value, result = "";
    String[] keys;

    if(datiString != null) {
      keys = datiString.getAllKeysAsArray();

      for(String key : keys) {
        value = (datiString.get(key) == null) ? "" : datiString.get(key).replace('\'', '`');

        if(! value.equals("") ) {
          result += "AND " + key + " = '" + value + "'\n";
        }

      }
    }

    // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
    if(datiInt != null) {
      keys = datiInt.getAllKeysAsArray();

      for(String key : keys) {
        value = (datiInt.get(key) == null) ? "" : datiInt.get(key).replace('\'', '`');

        if(! value.equals("") ) {
          result += "AND " + key + " = " + value + "\n";
        }
      }
    }

    // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
    if(datiArrayString != null) {
      keys = datiArrayString.getAllKeysAsArray();

      String values[], s;

      for(String key : keys) {
        s = "";
        values = datiArrayString.getAsArray(key);
        if(values != null && values.length != 0) {
          result += "  AND (";
          for(String v : values)
            s += "OR '" + v + "' = any(" + key + ")";

          result += s.substring(3);

          result += ")\n";
        }
      }
    }

    return result;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#getSQLConditionIn(java.lang.String[], java.lang.String, java.lang.String)
   */
  public String getSQLConditionIn(String[] values, String arrayName, String booleanJunction) {
    String where = "";
    booleanJunction = "\n " + booleanJunction + "\n";

    if(values == null || values.length == 0)
      return "";

    for(String v : values)
      where += "'" + v + "' = any (" + arrayName + ")" + booleanJunction;

    // rimuovo la booleanJunction finale
    where = where.substring( 0, (where.length() - booleanJunction.length()) );

    return where;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#getSQLConditionNotIn(java.lang.String[], java.lang.String, java.lang.String)
   */
  public String getSQLConditionNotIn(String[] values, String arrayName, String booleanJunction) {
    String where = "";
    booleanJunction = "\n " + booleanJunction + "\n";

    if(values == null || values.length == 0)
      return "";

    for(String v : values)
      where += "'" + v + "' <> all (" + arrayName + ")" + booleanJunction;

    // rimuovo la booleanJunction finale
    where = where.substring( 0, (where.length() - booleanJunction.length()) );

    return where;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicSelect#makeWhere(java.util.List, java.lang.String)
   */
  public String makeWhere(List<String> conditions, String booleanJunction) {
    String where = "";

    booleanJunction = "\n " + booleanJunction + "\n";

    int count = 0;

    for(String c : conditions)
      if(c != null && c.length() != 0) {
        where += " ( " + c + " ) " + booleanJunction;
        ++ count;
      }

    if(count == 0)
      return "";

    // rimuovo la booleanJunction finale
    where = where.substring( 0, (where.length() - booleanJunction.length()) );

    return where;
  }

}
