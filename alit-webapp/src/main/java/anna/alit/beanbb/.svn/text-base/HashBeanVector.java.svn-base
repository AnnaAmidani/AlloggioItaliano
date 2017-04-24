package anna.alit.beanbb;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.Hashtable;

public class HashBeanVector implements Serializable{

  /**
   *
   */
	private static final long serialVersionUID = 7365256738207351719L;


  Hashtable<String, Vector<String>> hashtable;

  public HashBeanVector() {
    hashtable = new Hashtable< String, Vector<String> >();
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#put(java.lang.String, java.lang.String)
   */
  public void put(String key, String value) {
	  // ottengo lista associata alla chiave
    Vector<String> thisValues = hashtable.get(key);

    if(thisValues == null)
    {
    // se non vi è una lista associata alla chiave
      // creo una lista vuota
      thisValues = new Vector<String>();
      // inserisco la lista nell'hashtable
      hashtable.put(key, thisValues);
    }

    // aggiungo alla lista il nuovo valore
    thisValues.add(value);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#put(java.lang.String, java.lang.String[])
   */
  public void put(String key, String[] values) {
    // ottengo lista associata alla chiave
    Vector<String> thisValues = hashtable.get(key);

    if(thisValues == null) {
    // se non vi è una lista associata alla chiave
      // creo una lista vuota
      thisValues = new Vector<String>();
      // inserisco la lista nell'hashtable
      hashtable.put(key, thisValues);
    }

    // aggiungo alla lista i nuovi valori
    for(String value : values)
      thisValues.add(value);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#get(java.lang.String)
   */
  public Vector<String> get(String key) {
    // ritorno il vettore associato alla chiave nell'hashtable come array
    return hashtable.get(key);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#getAsArray(java.lang.String)
   */
  public String[] getAsArray(String key) {
    // ritorno la lista associata alla chiave nell'hashtable come array
    Vector<String> vector = hashtable.get(key);

    // se non vi è una lista associata alla chiave ritorna null
    if(vector == null)
      return null;

    String[] lista = new String[vector.size()];
    vector.toArray(lista);

    return lista;
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#insertResult(java.sql.ResultSet, java.lang.String[])
   */
  public void insertResult(ResultSet rs, String[] campi) throws SQLException {
    String value = null;
    if(rs != null) {
      try{
       while(rs.next()){  // posso scorrere i risultati nel result set
          for(String campo : campi) {
          // inserisco tutte le colonne del risultato nell'hashtable
            value = rs.getString(campo);
            if(value != null)
              this.put(campo, value);
            else
              this.put(campo, "");
          }
       }
      }
     catch(SQLException sqle)
     {
       sqle.getLocalizedMessage();
     }
  }
 }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#getAllKeysAsArray()
   */
  public String[] getAllKeysAsArray() {

    String[] keys = new String[hashtable.size()];
    hashtable.keySet().toArray(keys);

    return keys;
  }


  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#get(java.lang.String, int)
   */
  public String get(String key, int index) {
    return hashtable.get(key).get(index);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#length(java.lang.String)
   */
  public int length(String key) {
    Vector<String> values = hashtable.get(key);
    if(values == null)
      return -1;

    return values.size();
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#size()
   */
  public int size() {
    return hashtable.size();
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#remove(java.lang.String)
   */
  public Vector<String> remove(String key) {
    return hashtable.remove(key);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBeanVector#toString()
   */
  public String toString() {

    String str = "";
    for(String key : getAllKeysAsArray())
      str += key + " = " + hashtable.get(key) + "\n";

    return str;
  }



}
