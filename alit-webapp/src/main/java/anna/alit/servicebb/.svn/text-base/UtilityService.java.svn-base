package anna.alit.servicebb;

import javax.annotation.PostConstruct;

public interface UtilityService {

  public static final String SERVICE_NAME = "UtilityServiceImpl";

  /**
   * @param regexpUsername the regexpUsername to set
   */
  void setRegexpUsername(String regexpUsername);

  /*
   *
   */
  @PostConstruct
  void setup();

  int updateScore(String id);

  String pwdResolver(String pwd, boolean encrypt);

  int calculateScore(String id);

  /*
   * Data una stringa nella forma:
   *     {luca,marco,piero}
   * ritorna l'array delle stringhe elencate
   * WARNING: le stringe contenute nell'array non devono contenere carattere ','
   */
  String[] splitArrayStringWithoutComma(String values);

  /*
   * Data una stringa nella forma:
   *     {"luca","marco","piero"}
   * ritorna l'array delle stringhe elencate
   */
  // mai utilizzato da testare
  @Deprecated
  String[] splitStringArray(String values);

  /*
   * Data una stringa nella forma:
   *     {"2,03","3,00","7,45"}
   * ritorna un array di stringhe contenente i numeri elencati (sia interi che con virgola)
   */
  // mai utilizzato da testare
  @Deprecated
  String[] splitNumericArray(String values);

  /*
   * Data una stringa nella forma:
   *     {"€2,03","€3,00","€7,45"}
   * ritorna un array di stringhe contenente i numeri elencati senza il carattere €
   */
  // mai utilizzato da testare
  @Deprecated
  String[] splitMoneyArray(String values);

}