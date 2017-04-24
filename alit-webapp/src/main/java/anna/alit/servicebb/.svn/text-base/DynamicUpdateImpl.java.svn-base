package anna.alit.servicebb;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@Service(DynamicUpdateImpl.SERVICE_NAME)
public class DynamicUpdateImpl implements DynamicUpdate {

    static private Logger logger; @SuppressWarnings("static-access")
    protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

    @Autowired protected DbmsImpl dbmsImpl;
    @Autowired protected ServicesImpl servicesImpl;

   /*
    *
    */
   public static DynamicUpdate getInstance()
   {
     WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
     DynamicUpdate service = (DynamicUpdate)(applicationContext.getBean(DynamicUpdate.SERVICE_NAME));
     return service;
   }



   /*
    *
    */
   public DynamicUpdateImpl()
   {
     log().info("");
   }


  /* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#execute(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, java.lang.String)
 */
  public int execute(String table, HashBean datiString, HashBean datiInt, String where) {
    return execute(table, datiString, null, datiInt, null, where);
  }

  /* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#execute(java.lang.String, anna.alit.beanbb.HashBeanVector, java.lang.String)
 */
  public int execute(String table, HashBeanVector datiArrayString, String where) {
    return execute(table, null, null, null, datiArrayString, where);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicUpdate#execute(java.lang.String, anna.alit.beanbb.HashBeanVector, java.lang.String)
   */
    public int execute(String table, HashBean datiDate, String where) {
      return execute(table, null, datiDate, null, null, where);
    }

/* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#execute(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector, java.lang.String)
 */
  public int execute(String table, HashBean datiString, HashBean datiDate, HashBean datiInt, HashBeanVector datiArrayString, String where) {
    String update = make(table, datiString, datiDate, datiInt, datiArrayString, where);
    return dbmsImpl.executeUpdate(update);
  }

  /* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, java.lang.String)
 */
  public String make(String table, HashBean datiString, HashBean datiInt, String where) {
    return make(table, datiString, null, datiInt, null, where);
  }

  /* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBean, java.lang.String)
 */
  public String make(String table, HashBean datiString, String where) {
    return make(table, datiString, null, null, null, where);
  }

  /* (non-Javadoc)
 * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBeanVector, java.lang.String)
 */
  public String make(String table, HashBeanVector datiArrayString, String where) {
    return make(table, null, null, null, datiArrayString, where);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector, java.lang.String)
   */
    public String make(String table, HashBean datiString, HashBeanVector datiArrayString, String where) {
      return make(table, datiString, null, null, datiArrayString, where);
    }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector, java.lang.String)
   */
    public String make(String table, HashBean datiString, HashBean datiDate, HashBeanVector datiArrayString, String where) {
      return make(table, datiString, datiDate, null, datiArrayString, where);
    }

  public String make(String table, HashBean datiString, HashBean datiDate, HashBean datiInt, HashBeanVector datiArrayString, String where) {

    String update = "UPDATE " + table + " SET ";

    // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
    String valori, value;
    String[] keys, values;

    if(datiString != null) {
      valori = "";
      keys = datiString.getAllKeysAsArray();

      for(String key : keys) {
        value = (datiString.get(key) == null) ? "" : datiString.get(key).replace('\'', '`');
        valori += key + " = '" + value + "', ";
      }
      update += valori;
    }

    if(datiDate != null)
    {
      valori = "";
      keys = datiDate.getAllKeysAsArray();

      for(String key : keys)
      {
        value = (datiDate.get(key) == null) ? "" : datiDate.get(key);
        if(! value.equals("") )
        {
          valori += key + " = '" + value + "', ";
        }
        else
        {
          valori += key + " = null, ";
        }
      }
      update += valori;
    }

    if(datiInt != null) {
      valori = "";
      keys = datiInt.getAllKeysAsArray();

      for(String key : keys) {
        value = datiInt.get(key);

        if(! value.equals("") )
          valori += key + " = " + value + ", ";
      }

      if(valori.length() != 0)
        update += valori;
    }

    if(datiArrayString != null) {
      valori = "";
      keys = datiArrayString.getAllKeysAsArray();

      for(String key : keys) {
        values = datiArrayString.getAsArray(key);
        if(values != null)
          valori += key + " = " + servicesImpl.literalArrayString(values) + ", ";
      }
      if(valori.length() != 0)
        update += valori;
    }

    if( update.equals("UPDATE " + table + " SET ") )
    {
      log().warn("update is empty.");
      return "";
    }

    update = update.substring(0, update.length()-2 );

    return update += " WHERE " + where + ";";
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicUpdate#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector, java.lang.String)

    public String make(String table, HashBean datiString, HashBean datiInt, HashBeanVector datiArrayString, String where) {

      String update = "UPDATE " + table + " SET ";

      // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
      String valori, value;
      String[] keys, values;

      if(datiString != null) {
        valori = "";
        keys = datiString.getAllKeysAsArray();

        for(String key : keys) {
          value = (datiString.get(key) == null) ? "" : datiString.get(key).replace('\'', '`');
//          if(! value.equals("") )
//            valori += key + " = '" + value + "', ";
          valori += key + " = '" + value + "', ";
        }

        if(valori.length() != 0)
          update += valori;
      }

      if(datiInt != null) {
        valori = "";
        keys = datiInt.getAllKeysAsArray();

        for(String key : keys) {
          value = datiInt.get(key);

          if(! value.equals("") )
            valori += key + " = " + value + ", ";
        }

        if(valori.length() != 0)
          update += valori;
      }

      if(datiArrayString != null) {
        valori = "";
        keys = datiArrayString.getAllKeysAsArray();

        for(String key : keys) {
          values = datiArrayString.getAsArray(key);
          if(values != null)
            valori += key + " = " + servicesImpl.literalArrayString(values) + ", ";
        }
        if(valori.length() != 0)
          update += valori;
      }

      if( update.equals("UPDATE " + table + " SET ") )
      {
        log().warn("update is empty.");
        return "";
      }

      update = update.substring(0, update.length()-2 );

      return update += " WHERE " + where + ";";
    }*/


}
