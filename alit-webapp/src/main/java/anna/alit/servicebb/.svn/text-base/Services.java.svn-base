package anna.alit.servicebb;

import javax.servlet.http.HttpServletRequest;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;

public interface Services {

  public static final String SERVICE_NAME = "ServicesImpl";

  String createUsername(String s);

  String createPsw(int length);

  /**
   * @param arrayValues  Valori contenuti nell'array.
   *
   * @return Stringa formattata per inserimento/update di array.
   */
  String literalArrayString(String[] array);

  /**
   * @param request       request ricevuta dalla jsp
   * @param parameterNames  array dei parametri da inserire nell'HashBeanVector
   *
   * @return  i dati
   */
  HashBeanVector makeHashBeanVector(HttpServletRequest request,
      String[] parameterNames);

  /**
   * @param request       request ricevuta dalla jsp
   * @param parameterNames  array dei parametri da inserire nell'HashBeanVector
   *
   * @return  i dati
   */
  HashBean makeHashBean(HttpServletRequest request, String[] parameterNames);

  void addToHashBean(HashBean dati, HttpServletRequest request,
      String nometabella, String[] campi);

  void addToHashBeanVector(HashBeanVector dati, HttpServletRequest request,
      String nometabella, String[] campi);

}