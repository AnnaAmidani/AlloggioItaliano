package anna.alit.servicebb;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

@Service(DynamicInsertImpl.SERVICE_NAME)
public class DynamicInsertImpl implements DynamicInsert {


  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired protected DbmsImpl dbmsImpl;
  @Autowired protected ServicesImpl servicesImpl;


  /*
  *
  */
 public static DynamicInsert getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   DynamicInsert service = (DynamicInsert)(applicationContext.getBean(DynamicInsert.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public DynamicInsertImpl()
 {
   log().info("");
 }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#execute(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean)
   */
  public int execute(String table, HashBean datiString, HashBean datiInt) {
    return execute(table, datiString, datiInt, null);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#execute(java.lang.String, anna.alit.beanbb.HashBean)
   */
  public int execute(String table, HashBean datiString) {
    return execute(table, datiString, null, null);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#execute(java.lang.String, anna.alit.beanbb.HashBeanVector)
   */
  public int execute(String table, HashBeanVector datiArrayString) {
    return execute(table, null, null, datiArrayString);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#execute(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector)
   */
  public int execute(String table, HashBean datiString, HashBean datiInt, HashBeanVector datiArrayString) {
    String insert = make(table, datiString, datiInt, datiArrayString);
    return dbmsImpl.executeUpdate(insert);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean)
   */
  public String make(String table, HashBean datiString, HashBean datiInt) {
    return make(table, datiString, datiInt, null);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#make(java.lang.String, anna.alit.beanbb.HashBean)
   */
  public String make(String table, HashBean datiString) {
    return make(table, datiString, null, null);
  }


  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#make(java.lang.String, anna.alit.beanbb.HashBeanVector)
   */
  public String make(String table, HashBeanVector datiArrayString) {
    return make(table, null, null, datiArrayString);
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.DynamicInsert#make(java.lang.String, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBean, anna.alit.beanbb.HashBeanVector)
   */
  public String make(String table, HashBean datiString, HashBean datiInt, HashBeanVector datiArrayString) {

    String prima = "INSERT INTO " + table + "(";
    String seconda = " VALUES (";

    // dobbiamo inserire un elemento per chiave (se l'elemento non è nullo)
    String nomi, valori, value;
    String[] keys, values;

    if(datiString != null) {
      nomi = "";
      valori = "";
      keys = datiString.getAllKeysAsArray();

      for(String key : keys) {
        value = (datiString.get(key) == null) ? "" : datiString.get(key).replace('\'', '`');

        if(value != null && ! value.equals("") )
        {
          nomi += key + ", ";
          valori += "'" + value + "', ";
        }
      }

      if(nomi.length() != 0) {
        prima += nomi;
        seconda += valori;
      }
    }

    if(datiInt != null) {
      nomi = "";
      valori = "";
      keys = datiInt.getAllKeysAsArray();

      for(String key : keys) {
        value = datiInt.get(key);
        if(value != null && ! value.equals("") ) {
          nomi += key + ", ";
          valori += value + ", ";
        }
      }

      if(nomi.length() != 0) {
        prima += nomi;
        seconda += valori;
      }
    }

    if(datiArrayString != null) {
      nomi = "";
      valori = "";
      keys = datiArrayString.getAllKeysAsArray();

      for(String key : keys) {
        values = datiArrayString.getAsArray(key);
        if(values != null) {
          nomi += key + ", ";
          valori += servicesImpl.literalArrayString(values) + ", ";
        }
      }
      if(nomi.length() != 0) {
        prima += nomi;
        seconda += valori;
      }
    }

    if( seconda.equals("VALUES ();") )
        return "";

    prima = prima.substring(0, prima.length()-2 ) + ")";
    seconda = seconda.substring(0, seconda.length()-2 ) + ");";

    return prima + seconda;
  }
}
