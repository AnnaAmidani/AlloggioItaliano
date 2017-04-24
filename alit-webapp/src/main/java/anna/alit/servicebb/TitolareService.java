package anna.alit.servicebb;

import java.sql.SQLException;

import anna.alit.beanbb.HashBean;

public interface TitolareService {

  public static final String SERVICE_NAME = "TitolareServiceImpl";
  /**
   * Numero delle celle della tabella dei prezzi della struttura
   */
  public static final int TAB_COUNT = 48;
  /**
   * Carattere che sostituisce il valore 0.00 della tabella dei prezzi in caratteristiche
   */
  public static final char TAB_ZERO = '-'; // (char) ('\u0000' + 151);

  int getValidation(String username, String password)
  throws SQLException;

  boolean getAbbonato(int idLoggato)
  throws SQLException;

  boolean updateDataIscrizione(String username, String password, String data)
      throws SQLException;

  boolean firstTimeLogged(String username, String password)
  throws SQLException;

  boolean setUserAndPsw(String user, String pwd, String id);

  HashBean getUsrAndPwd(int id);

  int changeUserAndPsw(String oldUser, String newpwd);

  /**
   * Ritorna tutti i dati relativi all'azienda corrispondente all'id passato.</br>
   * I valori dell'array tab vengono scritti come:
   * <ul>
   *   <li> 2,30 4,50 - 6,78 </li>
   * <ul>
   * dove '-' sostituisce le occorrenze del valore '0.00'
   *
   * @param id  id dell'azienda da ricercare
   * @return tutti i dati relativi all'azienda corrispondente all'id passato
   */
  HashBean getData(int id);

  /**
   * Normalizza il formato del campo SQL 'tab' della tabella 'caratteristiche'
   * per una stampa corretta della tabella dei prezzi nel XHTML.
   *
   *
   * return i valori di 'tab' correttamente formattati
   */

  String[] getTab(String tab);

  /**
   * Normalizza il formato del campo SQL 'tab' della tabella 'caratteristiche'
   * per una stampa corretta della tabella dei prezzi nel XHTML.
   *
   *
   * return i valori di 'tab' correttamente formattati
   */

  String[] getTabWithoutZero(String tab);

  /**
   * Normalizza il formato del campo SQL 'tab' della tabella 'caratteristiche'
   * per una stampa corretta della tabella dei prezzi nel XHTML.
   *
   *
   * return i valori di 'tab' correttamente formattati
   */

  String normalizeTab(String tab);

  /**
   * Ritorna una stringa contenenti esattamente 'count' valori.</br>
   * se la stringa passata contiene:
   * <ul>
   *   <li> 'count' valori, ritorno i valori dati in ingresso </li>
   *  <li> meno di 'count' valori, aggiungo tanti '0,00' quanti sono i valori mancanti </li>
   *  <li> più di 'count' valori, ritorno solo i primi 'count' valori </li>
   * </ul>
   *
   * Il formato della string di ingresso deve essere del tipo:
   * <ul>
   *   <li> "3,45 6,54 7,89 8,98 2,34 0,00" </li>
   * </ul>
   *
   * @param arrayValues  valori da immettere nella lista di valori di ritorno.
   * @param count      numero di valori (esatto) che deve contenere la stringa di ritorno.
   *
   * @return  una lista di esattamente 'count' valori.
   */
  String fixToLength(String arrayValues, int count);

  /**
   * Ritorna i valori contenuti nell' array Numeric SQL passato convertendone il formato:
   * formato di ingresso:  {2.03,0.00,6.55}
   * formato di ritorno:  2,03 0,00 6,55
   *
   * @param  sqlArray array Numeric SQL (contenuto in una stringa) di cui convertire il formato
   *
   * @return  tutti i valori contenuti in sqlArray separati da uno spazio
   */
  String formatNumericSQLArray(String sqlArray);

  /**
   * Ritorna i valori contenuti nell' array Money SQL passato convertendone il formato:
   * formato di ingresso:  {"€2,03","€0,00","€6,55"}
   * formato di ritorno:  2,03 0,00 6,55
   *
   * @param  sqlArray array Money SQL (contenuto in una stringa) di cui convertire il formato
   *
   * @return  tutti i valori contenuti in sqlArray separati da uno spazio
   */
  String formatMoneySQLArray(String sqlArray);

  /**
   *
   */
  String toNumericSQLArray(double[] array);

}