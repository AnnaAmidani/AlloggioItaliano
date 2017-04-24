package anna.alit.servicebb;

import javax.servlet.http.HttpServletRequest;

public interface SegnalazioniService {

  public static final String SERVICE_NAME = "SegnalazioniServiceImpl";

  void setSegnalazione(HttpServletRequest request, int id);

}