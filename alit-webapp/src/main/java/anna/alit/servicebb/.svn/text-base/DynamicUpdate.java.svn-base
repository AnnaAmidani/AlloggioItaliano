package anna.alit.servicebb;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

public interface DynamicUpdate {

  public static final String SERVICE_NAME = "DynamicUpdateImpl";

  /**
   * Esegue un'operazione di update.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return 1 se l'operazione di update &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBean datiString, HashBean datiInt, String where);

  /**
   * Esegue un'operazione di update.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return 1 se l'operazione di update &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBeanVector datiArrayString, String where);

  /**
   * Esegue un'operazione di update.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return 1 se l'operazione di update &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBean datiString, HashBean datiDate, HashBean datiInt,
      HashBeanVector datiArrayString, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBean datiString, HashBean datiInt, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBean datiString, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBeanVector datiArrayString, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBean datiString,
      HashBeanVector datiArrayString, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where        condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBean datiString, HashBean datiInt,
      HashBeanVector datiArrayString, String where);

  /**
   * Ritorna una proposizione sql di update formattata correttamente.
   *
   * @param table            Nome tabella in cui inserire i dati
   * @param datiString       Dati di tipo varchar da inserire
   * @param datiDate         Dati di tipo date da inserire
   * @param datiInt          Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   * @param where            condizione di esecuzione (where-clause)
   *
   * @return  Stringa formattata per update.
   */
  String make(String table, HashBean datiString, HashBean datiDate, HashBean datiInt,
      HashBeanVector datiArrayString, String where);

}