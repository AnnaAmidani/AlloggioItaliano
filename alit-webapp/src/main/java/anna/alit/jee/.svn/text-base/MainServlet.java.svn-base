package anna.alit.jee;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.sql.SQLException;
import java.text.*;
import java.util.Date;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;
import anna.alit.servicebb.*;
import anna.alit.utilities.UtilService;

/**
 * Questa classe gestisce le richieste riguardanti le ricerche all'interno della
 * base di dati.
 * <p>
 * Risponde solamente a richieste HTTP di tipo GET. I parametri vengono passati
 * tramite l'oggetto HttpServletRequest nel seguente ordine:
 * <ol>
 * <li>actionType: tipo di azione da eseguire
 * <li>se esistono pi&ugrave parametri si specificano per ogni tipo d'azione</li>
 * </ol>
 */
@SuppressWarnings("serial")
public class MainServlet extends HttpServlet
{

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  /**
   * metodo di richiesta/risposta http
   *
   * @param request
   *          Oggetto HttpServletRequest dal quale ottenere informazioni circa
   *          la richiesta effettuata.
   * @param response
   *          Oggetto HttpServletResponse per l'invio delle risposte.
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {

    if (request != null && response != null) // TODO: check doPost(request,
                                             // response)
      doGet(request, response);
  }

  /**
   * metodo di richiesta/risposta http
   *
   * @param request
   *          Oggetto HttpServletRequest dal quale ottenere informazioni circa
   *          la richiesta effettuata.
   * @param response
   *          Oggetto HttpServletResponse per l'invio delle risposte.
   */
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
  {

    // Definizione e recupero parametro/i (tipi di azione) della servlet/jsp
    String actiontype = request.getParameter("actiontype");
    String secondaction = request.getParameter("secondaction");
    String thirdaction = request.getParameter("thirdaction");
    String action = request.getParameter("action");

    if (action == null)
    {
      action = "";
    }
    if (actiontype == null)
    {
      actiontype = "";
    }
    if (secondaction == null)
    {
      secondaction = "";
    }
    if (thirdaction == null)
    {
      thirdaction = "";
    }

    String destinationPage = request.getParameter("destinationPage");
    String regione = request.getParameter("regione");
    String sigla = request.getParameter("sigla"); // targa
    String comune = request.getParameter("comune");
    String distretto = request.getParameter("distretto");
    String tipoesteso = request.getParameter("tipoesteso");
    String denominazione = request.getParameter("denominazione");
    String tipologia = request.getParameter("tipologia");

    // get current session if is valid, new session otherwise
    HttpSession session = request.getSession(true);

    // Dichiaro l'oggetto Dispatcher necessario per passare il controllo ad una
    // JSP o una pagina HTML
    RequestDispatcher dispatcher = null;
    HashBeanVector hashResult = null; // risultato della query

    request.setAttribute("denominazione", request.getParameter("denominazione"));
    request.setAttribute("annofondazione", request.getParameter("annofondazione"));

    if (action.equals("logout"))
    {
      destinationPage = "View/home.jsp";

      /* vuoto l'oggetto session */
      if (!session.isNew())
      {
        String locale = (String) session.getAttribute("locale");
        session.invalidate();
        // Create a new session for the user.
        session = request.getSession(true);
        if (locale != null)
        {
          session.setAttribute("locale", locale);
        }
      }

    }
    else if (secondaction.equals("caricaAlloggioRis"))
    {
      destinationPage = "View/numeroRisultati.jsp";
      hashResult = AlloggioServiceImpl.getInstance().getAziende();
      session.setAttribute("hashResult", hashResult);
      session.setAttribute("index", 0);
      hashResult = null; // vuoto hashResult prima che sia inserito nella
                         // request
    }
    else if (secondaction.equals("insert1"))
    {
      String mail = request.getParameter("mail");
      ParamsMap params = new ParamsMapImpl();
      params.put(request);

      boolean checked = false;
      if(StringUtils.isNotEmpty(mail))
      {
        checked = RegisterService1Impl.getInstance().checkIfExistent(mail);
      }
      if (checked)
      {
        ParamsMap m = RegisterService1Impl.getInstance().getExistentParams(mail);
        session.setAttribute("denominazione", m.get("denominazione"));
        session.setAttribute("mail", m.get("mail"));
        session.setAttribute("username", m.get("username"));
        session.setAttribute("password", m.get("password"));
        destinationPage = "View/alreadyRegistered.jsp";
        dispatcher = request.getRequestDispatcher(destinationPage);
        dispatcher.forward(request, response);
        return;
      }

      int id = RegisterService1Impl.getInstance().getRegister1New(params);
      HashBean result = TitolareServiceImpl.getInstance().getUsrAndPwd(id);
      request.setAttribute("username", result.get("username"));
      request.setAttribute("password", result.get("password"));
      request.setAttribute("id", id);
      request.setAttribute("mail", request.getParameter("mail"));
      request.setAttribute("denominazione", request.getParameter("denominazione"));
      if (id > 0)
      {
        /* VUOTO L'OGGETTO SESSION */
        if (!session.isNew())
        {
          String locale = (String) session.getAttribute("locale");
          session.invalidate();
          // Create a new session for the user.
          session = request.getSession(true);
          if (locale != null)
            session.setAttribute("locale", locale);
        }
        destinationPage = "jspService/done.jsp";

      }
      else
      {
        String msg = "A causa di un errore inatteso non è stato possibile concludere la registrazione.<br/> Si invita a riprovare.";
        destinationPage = "jspService/errorMessage.jsp?message=" + msg;
      }
    }
    else if (thirdaction.equals("updateReg1"))
    {
      ParamsMap params = new ParamsMapImpl();
      params.put(request);
      params.put(session);
      FormServiceImpl.getInstance().updateBeanLoggato(params);
      int res = UpRegService1Impl.getInstance().updateReg1(request);
      if (res == 1)
        destinationPage = "jspService/Updone.jsp";
      else
        destinationPage = "jspService/error.jsp";
    }
    else if (actiontype.equals("insert2"))
    {
      ParamsMap params = new ParamsMapImpl();
      params.put(request);
      params.put(session);
      FormServiceImpl.getInstance().updateBeanLoggato(params);
      int res = RegisterService2Impl.getInstance().Scheda2(params);
      if (res == 1)
      {
        destinationPage = "jspService/Updone.jsp";
      }
      else
      {
        destinationPage = "jspService/error.jsp";
      }
    }
    else if (actiontype.equals("insert3"))
    {
      ParamsMap params = new ParamsMapImpl();
      params.put(request);
      params.put(session);
      FormServiceImpl.getInstance().updateBeanLoggato(params);
      int res = RegisterService2Impl.getInstance().Scheda3(params);
      if (res == 1)
      {
        destinationPage = "jspService/Updone.jsp";
      }
      else
      {
        destinationPage = "jspService/error.jsp";
      }
    }
    else if (actiontype.equals("insert4"))
    {
      ParamsMap params = new ParamsMapImpl();
      params.put(request);
      params.put(session);
      FormServiceImpl.getInstance().updateBeanLoggato(params);
      int res = RegisterService2Impl.getInstance().Scheda4(params);
      if (res == 1)
      {
        destinationPage = "jspService/Updone.jsp";
      }
      else
      {
        destinationPage = "jspService/error.jsp";
      }
    }
    else if (actiontype.equals("registraspot"))
    {
      ParamsMap params = new ParamsMapImpl();
      params.put(request);
      params.put(session);
      FormServiceImpl.getInstance().updateBeanLoggato(params);
      int res = RegisterService2Impl.getInstance().SchedaSpot(params);
      if (res == 1)
      {
        destinationPage = "jspService/Updone.jsp";
      }
      else
      {
        destinationPage = "jspService/error.jsp";
      }

    }
    else if (actiontype.equals("popola"))
    {
      destinationPage = "View/Registrazione1.jsp";
      hashResult = RegProvComServiceImpl.getInstance().popolaAction(regione, sigla);

    }
    else if (actiontype.equals("popola3") && destinationPage != null)
    {
      hashResult = RegProvComServiceImpl.getInstance().RegProvComAction(regione, sigla);

    }
    else if (secondaction.equals("segnala"))
    {
      Integer idLoggato = (Integer) session.getAttribute("idLoggato");
      int id = idLoggato.intValue();
      SegnalazioniServiceImpl.getInstance().setSegnalazione(request, id);
      destinationPage = "View/logged.jsp";

    }
    else if (actiontype.equals("checklogin"))
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String data = sdf.format(new Date());
      int idLoggato = 0;
      String accettazioneContratto = request.getParameter("contratto");
      String accettazionePrivacy = request.getParameter("privacy");
      String username = request.getParameter("username");
      String password = request.getParameter("password");

      if(StringUtils.isEmpty(username))
      {
        username = (String)session.getAttribute("username");
      }
      username = UtilService.alitRequestFormatter(username);

      if(StringUtils.isEmpty(password))
      {
        password = (String)session.getAttribute("password");
      }

      try
      {
        if(StringUtils.isNotEmpty(accettazioneContratto) && StringUtils.equals(accettazioneContratto, "si") && StringUtils.isNotEmpty(accettazionePrivacy) && StringUtils.equals(accettazionePrivacy, "Acconsento"))
        {
          String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
          String kaptchaReceived = request.getParameter("kaptcha");

          if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected))
          {
            destinationPage = "jspService/errorK.jsp";
          }
          else
          {
            boolean updated = TitolareServiceImpl.getInstance().updateDataIscrizione(username, password, data);
            if(!updated)
            {
              log().warn("some error occurred in setting dataiscrizione property for user "+username);
            }
          }
        }

        if(TitolareServiceImpl.getInstance().firstTimeLogged(username, password))
        {
          session.setAttribute("username", username);
          session.setAttribute("password", password);
          session.setAttribute("firstTimeLogged", "firstTimeLogged");
          destinationPage = "View/contratto.jsp";
        }
        else
        {
          idLoggato = TitolareServiceImpl.getInstance().getValidation(username, password);


          if (idLoggato > 0)
          {
            destinationPage = "View/logged.jsp";
            if (session.getAttribute("gotoPage") != null)
            {
              destinationPage = (String) session.getAttribute("gotoPage");
              request.setAttribute("id", (String) session.getAttribute("id"));
              request.setAttribute("time", (String) session.getAttribute("time"));
            }

            /* VUOTO L'OGGETTO SESSION */
            if (!session.isNew())
            {
              String locale = (String) session.getAttribute("locale");
              session.invalidate();
              // Create a new session for the user.
              session = request.getSession(true);
              if (locale != null)
                session.setAttribute("locale", locale);
            }

            session.setAttribute("logged_user", "true");

            if (TitolareServiceImpl.getInstance().getAbbonato(idLoggato))
            {
              session.setAttribute("abbonato", "true");
            }
            // ottengo tutti i dati dell'utente logggato
            HashBean beanLoggato = TitolareServiceImpl.getInstance().getData(idLoggato);

            // Ottengo l'elenco delle sigle (p.s. la sigla del loggato c'è sempre)
            String query = "select regione, nomeesteso from provincia where sigla = '" + beanLoggato.get("sigla") + "'";
            regione = DbmsImpl.getInstance().executeSingleQuery(query, new String[] { "regione" }).get("regione");
            beanLoggato.put("regione", regione);
            hashResult = RegProvComServiceImpl.getInstance().RegProvComAction(regione, beanLoggato.get("sigla"));
            session.setAttribute("beanLoggato", beanLoggato);
            // beanLoggato contiene tutti i dati dell'utente loggato
            session.setAttribute("hashResult", hashResult);
            // hashResult contiene elenco sigle e nomeesteso della regione del
            // loggato
            session.setAttribute("idLoggato", idLoggato);
            request.setAttribute("username", username);
            // per stampa nome utente loggato nella destination page
          }
          else
          {
            destinationPage = "View/doLog.jsp";
          }
        }
      }
      catch (SQLException e)
      {
        log().error(":", e);
      }

    }
    else if (actiontype.equals("changeUserAndPwd"))
    {
      String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
      String kaptchaReceived = request.getParameter("kaptcha");

      if (kaptchaReceived == null || !kaptchaReceived.equalsIgnoreCase(kaptchaExpected))
      {
        destinationPage = "jspService/errorK.jsp";
      }
      else
      {
        String oldUser = request.getParameter("oldusername");
        String newpwd = request.getParameter("password");

        int check = TitolareServiceImpl.getInstance().changeUserAndPsw(oldUser, newpwd);

        if (check == 1)
        {
          session.invalidate();
          // spedire mail all'utente che conferma l'avvenuta modifica della
          // pwd!!!!
          // Una cosa così...
          // getUserMail(oldUsr);
          // params.add("usr", oldUsr);
          // AlitServiceImpl.sendemail()
          destinationPage = "View/doLog.jsp";
        }
        else
        {
          destinationPage = "View/doLogChangeError.jsp";
        }
      }

    }
    else
    {
      // non è stata rilevata alcuna azione da eseguire
      destinationPage = "jspService/error.jsp";
    }

    request.setAttribute("hashResult", hashResult);
    request.setAttribute("regione", regione);
    request.setAttribute("sigla", sigla);
    request.setAttribute("comune", comune);
    request.setAttribute("distretto", distretto);
    request.setAttribute("tipoesteso", tipoesteso);
    request.setAttribute("denominazione", denominazione);
    request.setAttribute("tipologia", tipologia);

    if (StringUtils.isNotEmpty(destinationPage) && StringUtils.contains(destinationPage, "cercaAlloggio.jsp"))
    {
      destinationPage = "View/home.jsp";
    }
    // Preparo il dispatcher
    dispatcher = request.getRequestDispatcher(destinationPage);

    // Passo il controllo alla destinationPage
    dispatcher.forward(request, response);
  }
}
