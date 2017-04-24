package anna.alit.mock;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang.NotImplementedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestDispatcherMock implements RequestDispatcher {

  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }
  //contiene il valore della destinationPage.
  //Se chiamiamo request.getRequestDspatcher(dp) la request setta destinationPage;
  public String path;

  public RequestDispatcherMock() {
    log().info("");
  }

  @Override
  public void forward(ServletRequest request, ServletResponse response) throws ServletException, IOException {
    log().info("Inoltrata una richiesta di passaggio alla risorsa {}", path);
  }

  @Override
  public void include(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
    log().error("è stato richiesto un metodo non implementato.");
    throw new NotImplementedException("TODO");
  }

}
