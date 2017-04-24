package anna.alit.servicebb;


import javax.servlet.http.HttpServletRequest;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.ParamsMap;

public interface FormService {

  public static final String SERVICE_NAME = "FormServiceImpl";

  /**
   * Esegue le seguenti azioni:
   * (1) Ottiene il beanLoggato dalla session se presente, lo inizializza vuoto altrimenti
   * (2) Aggiorna/carica i dati nel beanLoggato acquisendoli dalla request
   *     se si arriva da una pagina di registrazione o pubblicità.
   * (3) Inserice il beanLoggato (aggiornato) nella session (session.setAttribute("beanLoggato", beanLoggato);)
   * (4) Ritorna il beanLoggato aggiornato.
   *
   * @param request HttpServletRequest di una pagina di registrazione utente o pubblicità.
   */
  HashBean updateBeanLoggato(HttpServletRequest request);

  /**
   * Esegue le seguenti azioni:
   * (1) Ottiene il beanLoggato dalla session se presente, lo inizializza vuoto altrimenti
   * (2) Aggiorna/carica i dati nel beanLoggato acquisendoli dalla request
   *     se si arriva da una pagina di registrazione o pubblicità.
   * (3) Inserice il beanLoggato (aggiornato) nella session (session.setAttribute("beanLoggato", beanLoggato);)
   * (4) Ritorna il beanLoggato aggiornato.
   *
   * @param params ParamsMap di una pagina di registrazione utente o pubblicità.
   */
  HashBean updateBeanLoggato(ParamsMap params);


  String arrayToString(String[] array);

}