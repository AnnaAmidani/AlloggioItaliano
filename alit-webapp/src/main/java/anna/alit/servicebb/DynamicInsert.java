package anna.alit.servicebb;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

public interface DynamicInsert {

  public static final String SERVICE_NAME = "DynamicInsertImpl";

  /**
   * Esegue un'operazione di insert.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   *
   * @return 1 se l'operazione di insert &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBean datiString, HashBean datiInt);

  /**
   * Esegue un'operazione di insert.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   *
   * @return 1 se l'operazione di insert &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBean datiString);

  /**
   * Esegue un'operazione di insert.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   *
   * @return 1 se l'operazione di insert &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBeanVector datiArrayString);

  /**
   * Esegue un'operazione di insert.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   *
   * @return 1 se l'operazione di insert &egrave andata a buon fine, 0 in caso contrario.
   */
  int execute(String table, HashBean datiString, HashBean datiInt,
      HashBeanVector datiArrayString);

  /**
   * Ritorna una proposizione sql di insert formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   *
   * @return  Stringa formattata per insert.
   */
  String make(String table, HashBean datiString, HashBean datiInt);

  /**
   * Ritorna una proposizione sql di insert formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   *
   * @return  Stringa formattata per insert.
   */
  String make(String table, HashBean datiString);

  /**
   * Ritorna una proposizione sql di insert formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiArrayString  Dati di tipo Array varchar
   *
   * @return  Stringa formattata per insert.
   */
  String make(String table, HashBeanVector datiArrayString);

  /**
   * Ritorna una proposizione sql di insert formattata correttamente.
   *
   * @param table       Nome tabella in cui inserire i dati
   * @param datiString    Dati di tipo varchar da inserire
   * @param datiInt      Dati di tipo int da inserire
   * @param datiArrayString  Dati di tipo Array varchar
   *
   * @return  Stringa formattata per insert.
   */
  String make(String table, HashBean datiString, HashBean datiInt,
      HashBeanVector datiArrayString);

}