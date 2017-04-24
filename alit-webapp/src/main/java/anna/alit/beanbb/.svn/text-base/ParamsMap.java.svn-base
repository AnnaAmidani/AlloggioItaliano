package anna.alit.beanbb;

import java.util.Map;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Contenitore per i parametri della request.
 *
 * @author anna
 */
public interface ParamsMap extends Map<String, Object> {

  /**
   * Associates the specified value with the specified key in this map.
   * If the map previously contained a mapping for the key, the old
   * value is replaced.
   *
   * @param key key with which the specified value is to be associated
   * @param value value to be associated with the specified key
   * @return the previous value associated with <tt>key</tt>, or
   *         <tt>null</tt> if there was no mapping for <tt>key</tt>.
   *         (A <tt>null</tt> return can also indicate that the map
   *         previously associated <tt>null</tt> with <tt>key</tt>.)
   */
  Object put(String key, Object value);

  /**
   * Inserisce tutti i parametri contenuti nella request.
   *
   * @param request request contenente i parametri da inserire.
   */
  void put(HttpServletRequest request);

  /**
   * Inserisce tutti i parametri contenuti nella session.
   *
   * @param session session contenente i parametri da inserire.
   */
  void put(HttpSession session);

  /**
   * Inserisce tutti i parametri contenuti nella session.
   *
   * @param session session contenente i parametri da inserire.
   */
  void put(ResultSet resultSet);

  /**
   * Se il parametro ricercato è un array ritorna il valore di posizione 0,
   * altrimenti ritorna il parametro.
   *
   * @param key chiave associata al parametro da ottenere.
   *
   * @return se il parametro ricercato è un array ritorna il valore di posizione 0,
   *         altrimenti ritorna il parametro.
   */
  Object get(String key);

  /**
   * Se il parametro ricercato è un array di lunghezza superiore dell'indice specificato
   * ritorna il valore di posizione <code>index</code>, altrimenti ritorna null.
   *
   * @param key chiave associata al parametro da ottenere.
   * @param index indice del parametro da ottenere.
   *
   * @return il parametro di indice <code>index</code>.
   */
  Object get(String key, int index);

  /**
   * Ritorna il parametro ricercato.
   *
   * @param key chiave associata al parametro da ottenere.
   *
   * @return il parametro ricercato.
   */
  Object gets(String key);


  /*
   * Ritorna il parametro ricercato come array.
   * Se il parametro non è un array lo inserisce in un array (di uguale tipo) in posizione zero.
   * Se il parametro è null ritorna null.
   */
  //TODO: creare metodo Object getAsArray(String key);
}