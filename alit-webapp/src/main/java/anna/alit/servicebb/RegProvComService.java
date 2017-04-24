package anna.alit.servicebb;

import anna.alit.beanbb.HashBeanVector;

public interface RegProvComService {

  public static final String SERVICE_NAME = "RegProvComServiceImpl";

  HashBeanVector getSigle(String regione);

  HashBeanVector getTrasporti(String regione, String sigla);

  HashBeanVector getComune(String regione, String sigla);

  void insertDistretto(HashBeanVector hashResult, String regione);

  HashBeanVector popolaAction(String regione, String sigla);

  HashBeanVector RegProvComAction(String regione, String sigla);

}