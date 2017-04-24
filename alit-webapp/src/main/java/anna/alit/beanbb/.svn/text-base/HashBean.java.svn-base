package anna.alit.beanbb;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Hashtable;

public class HashBean {

  Hashtable<String, String> hashtable;

  public HashBean() {
    hashtable = new Hashtable<String, String>();
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#put(java.lang.String, java.lang.String)
   */
  public void put(String key, String value) {

    if(value == null) // se la chiave ha un valore associato viene sovrascritto
      hashtable.put(key, "");
    else
      hashtable.put(key, value);

  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#insertResult(java.sql.ResultSet, java.lang.String[])
   */
  public void insertResult(ResultSet rs, String[] campi) throws SQLException {

    if(rs != null) {

      try {
        while(rs.next()){ // ATTENZIONE: inserisco nell'HashBean SOLO il 1° risultato
        // while utilizzato per non chiamare rs.getString() su connessione chiusa
          for(String campo : campi) {
            // inserisco tutte le colonne (della 1° riga) del risultato nell'hashtable
            this.put(campo, rs.getString(campo));
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
   * @see anna.alit.beanbb.HashBean#get(java.lang.String)
   */
  public String get(String key) {
    // ritorno il vettore associato alla chiave nell'hashtable come array
    return hashtable.get(key);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#getAllKeysAsArray()
   */
  public String[] getAllKeysAsArray() {

    String[] keys = new String[hashtable.size()];
    hashtable.keySet().toArray(keys);

    return keys;
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#size()
   */
  public int size() {
    return hashtable.size();
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#remove(java.lang.String)
   */
  public String remove(String key) {
    return hashtable.remove(key);
  }

  /* (non-Javadoc)
   * @see anna.alit.beanbb.HashBean#toString()
   */
  @Override
  public String toString() {

    String str = "";
    String[] allKeys = getAllKeysAsArray();
    Arrays.sort(allKeys, String.CASE_INSENSITIVE_ORDER);

    for(String key : getAllKeysAsArray())
      str += key + ": " + hashtable.get(key) + "\n";

    return str;
  }
}
