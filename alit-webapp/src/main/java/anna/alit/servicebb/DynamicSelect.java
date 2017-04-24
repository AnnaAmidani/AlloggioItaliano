package anna.alit.servicebb;

import java.sql.ResultSet;
import java.util.List;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

public interface DynamicSelect {

  public static final String SERVICE_NAME = "DynamicSelectImpl";

  ResultSet execute(String select, String from, String where);

  HashBeanVector execute(String select, String from, String where,
      String[] campi);

  HashBeanVector execute(String select, String from, String where,
      String orderBy, String[] campi);

  String makeSimpleWhere(HashBean datiString);

  String makeWhere(HashBean datiString, HashBean datiInt,
      HashBeanVector datiArrayString);

  /**
   * Genera una catena di 'condizioni booleane' in sintassi SQL nel seguente modo:
   * <ul>
   *   <li> 'values[0]' = any (arrayName) AND 'values[1]' = any (arrayName) ... </li>
   * </ul>
   * Convenzioni utilizzate:
   * <ol>
   *  <li> se values è null ritorna una stringa vuota. </li>
   *  <li> se values ha length == 0 ritorna una stringa vuota. </li>
   * </ol>
   *
   * @param values      valori che devono essere presenti nell'array spcificato
   * @param arrayName      nome array nel database (sintassi: tabella.campo)
   * @param booleanJunction  modo di collegare le condizioni (AND / OR)
   * @return il WHERE generato
   */
  String getSQLConditionIn(String[] values, String arrayName,
      String booleanJunction);

  /**
   * Genera una catena di 'condizioni booleane' in sintassi SQL nel seguente modo:
   * <ul>
   *   <li> 'values[0]' <> all (arrayName) AND 'values[1]' <> all (arrayName) ... </li>
   * </ul>
   * Convenzioni utilizzate:
   * <ol>
   *  <li> se values è null ritorna una stringa vuota. </li>
   *  <li> se values ha length == 0 ritorna una stringa vuota. </li>
   * </ol>
   *
   * @param values      valori che NON devono essere presenti nell'array spcificato
   * @param arrayName      nome array nel database (sintassi: tabella.campo)
   * @param booleanJunction  modo di collegare le condizioni (AND / OR)
   * @return il WHERE generato
   */
  String getSQLConditionNotIn(String[] values, String arrayName,
      String booleanJunction);

  /**
   * Concatena le 'condizioni booleane' passate in sintassi SQL nel seguente modo:
   * <ul>
   *   <li> ( conditions[0] ) AND ( conditions[1] ) ... </li>
   * </ul>
   * Convenzioni utilizzate:
   * <ol>
   *  <li> se conditions == null  ritorna una stringa vuota </li>
   *  <li> se conditions[x] == null la condition viene considerata invalida
   *    e quindi non viene inserita. </li>
   *  <li> se conditions[x].length() == 0 la condition viene considerata invalida
   *    e quindi non viene inserita. </li>
   *  <li> se non è presente almeno una condition valida ritorna una stringa vuota. </li>
   * </ol>
   *
   * @param conditions    condizioni booleane che deve soddisfare il WHERE
   * @param booleanJunction  modo di collegare le condizioni (AND / OR)
   * @return le 'condizioni booleane' concarenate se vi è almeno una condition valida, una stringa vuota altrimenti.
   */
  String makeWhere(List<String> conditions, String booleanJunction);

}