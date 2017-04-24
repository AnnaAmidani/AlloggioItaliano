/* $Id: AlitServiceImpl.java 514 2012-01-03 19:44:26Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.servicebb;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Properties;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.apache.commons.lang.xwork.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;
import anna.alit.email.EmailAddress;
import anna.alit.email.EmailAddressType;
import anna.alit.email.EmailMessage;
import anna.alit.email.EmailMessageDao;
import anna.alit.email.EmailQueueWorker;
import anna.alit.email.EmailService;
import anna.alit.email.FreemarkerEmailMessageProducer;
import anna.alit.email.MailFormat;
import anna.alit.utilities.Aes;



/**
 * @author anna
 * @created Jun 2, 2009
 */
@Service(AlitService.SERVICE_NAME)
public class AlitServiceImpl implements AlitService
{
  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log()
  {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired protected EmailQueueWorker emailQueueWorker;
  @Autowired protected EmailService emailService;
  @Autowired protected EmailMessageDao emailMessageDao;
  @Autowired protected FreemarkerEmailMessageProducer emailMessageProducer;
  @Autowired protected UtilityService utilityService;
  @Autowired protected DbmsImpl dbmsImpl;

  @SuppressWarnings("unused")
  private Authenticator auth;
  private Properties props;

  private Locale it_IT = new Locale("it", "IT");

  private String smtpAuthUser = "contatti@alloggioitaliano.it";
  private String smtpAuthPassword = "ancmbvl0";
  private String mailHost = "smtp.alloggioitaliano.it";
  private String port = "25";
  private String contatti = "contatti@alloggioitaliano.it";
  private String prenotazioni = "prenotazioni@alloggioitaliano.it";
  private String registrazione = "invito@alloggioitaliano.it";
  private String conferma = "conferma@alloggioitaliano.it";
  private String cancellazione = "cancellazione@alloggioitaliano.it";
  private String mailpec = "alloggioitaliano@pec.it";

  /*
   *
   */
  public static AlitService getInstance()
  {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    AlitService service = (AlitService) (applicationContext.getBean(AlitService.SERVICE_NAME));
    return service;
  }


  /*
   *
   */
  public AlitServiceImpl()
  {
    super();
  }


  /**
   * @return the utilityService
   */
  @Override
  public UtilityService getUtilityService()
  {
    return utilityService;
  }


  /**
   * @param smtpAuthUser the smtpAuthUser to set
   */
  public void setSmtpAuthUser(String smtpAuthUser)
  {
    this.smtpAuthUser = smtpAuthUser;
  }


  /**
   * @param smtpAuthPassword the smtpAuthPassword to set
   */
  public void setSmtpAuthPassword(String smtpAuthPassword)
  {
    this.smtpAuthPassword = smtpAuthPassword;
  }


  /**
   * @param mailHost the mailHost to set
   */
  public void setMailHost(String mailHost)
  {
    this.mailHost = mailHost;
  }


  /**
   * @param port the port to set
   */
  public void setPort(String port)
  {
    this.port = port;
  }


  /**
   * SimpleAuthenticator is used to do simple authentication when the SMTP server requires it.
   */
  private class SMTPAuthenticator extends javax.mail.Authenticator
  {

    public PasswordAuthentication getPasswordAuthentication()
    {
      String username = smtpAuthUser;
      String password = smtpAuthPassword;
      return new PasswordAuthentication(username, password);
    }
  }

  /*
   *
   */
  @PostConstruct
  public void startup()
  {
    log().info("========================================");
    log().info("  startup");
    log().info("========================================");

    props = new Properties();//System.getProperties();

    props.put("mail.smtp.host", mailHost);
    props.put("mail.smtp.port", port);
    props.put("mail.smtp.auth", "true");

    auth = new SMTPAuthenticator();
  }


  /*
   *
   */
  @PreDestroy
  public void shutdown()
  {
    log().info("========================================");
    log().info("  shutdown");
    log().info("========================================");
  }


  /*
   * @see anna.alit.servicebb.AlitService#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  @Override
  public String sendEmail(ParamsMap params)
  {
    String from, to, subject, page;
    String[] regione, tipologia, periodo, posizione;
    from = contatti;
    to = contatti;
    subject = (String) params.get("subject");
    //String body = (String) params.get("body");
    page = (String) params.get("page");

    try
    {
      if( page == null)
      {
        log().error("Wrong initial conditions.");
        return null;
      }

      EmailMessage mailMessage = new EmailMessage();

      if (page.equals("View/ok.jsp"))
      {
        regione = (String[]) params.gets("regione");
        tipologia = (String[]) params.gets("tipologia");
        periodo = (String[]) params.gets("periodo");
        posizione = (String[]) params.gets("posizione");
        String region = "";
        String tipolog = "";
        String period = "";
        String posizion = "";

      if (regione != null) {
        for (String reg : regione) {
          region += reg;
        }
      }
      if (tipologia != null) {
        for (String tip : tipologia) {
          tipolog += tip;
        }
      }
      if (periodo != null) {
        for (String per : periodo) {
          period += per;
        }
      }
      if (posizione != null) {
        for (String pos : posizione) {
          posizion += pos;
        }
      }
        mailMessage = emailMessageProducer.produce("ok", it_IT, MailFormat.html, params);

      }
      else if(page.equals("View/scheda1.jsp"))
      {
        long time = EmailConnectionServiceImpl.getInstance().insertEmailConnection((String)params.get("denominazione"), (String)params.get("id"), (String)params.get("to"), (String)params.get("userMail"));
        if(time == 0)
        {
          log().error("Insert into EmailConnection from MailtoStruttura FAILED!");
          return null;
        }
        params.put("time", time);
        to = (String) params.get("to");
        to = this.formatTo(to);
        from = prenotazioni;
        params.put("stringtime", params.get("time") + "");
        params.put("mail", params.get("to"));
        mailMessage = emailMessageProducer.produce("mailtostruttura", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/home.jsp"))
      {
        HashBean bean = EmailConnectionServiceImpl.getInstance().getEmails( (String) params.get("id"), (String) params.get("time"));
        if(bean == null)
        {
          log().error("Email già inviata!");
          String message = "I link per rispondere alle e-mail sono utilizzabili una sola volta:" +
          		"<br/> il presente link è scaduto.";
          return "jspService/errorMessage.jsp?message=" + message;
        }

        String denominazione = bean.get("denominazione");
        params.put("denominazione", denominazione);
        to = bean.get("email_user");
        to = this.formatTo(to);
        from = prenotazioni;
        mailMessage = emailMessageProducer.produce("mailformtouser", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/cercaAlloggio.jsp"))
      {
    	page = "View/home.jsp";
        mailMessage = emailMessageProducer.produce("contatti", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/logged.jsp"))
      {
        to = cancellazione;
        mailMessage = emailMessageProducer.produce("delete", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/cancellazioneForm.jsp"))
      {
        to = cancellazione;
        mailMessage = emailMessageProducer.produce("delete", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/cancellazioneForm_user.jsp"))
      {
    	from = cancellazione;
        to = (String)params.get("userMail");
        mailMessage = emailMessageProducer.produce("deleteConfirm", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/retrievePwdForm.jsp"))
      {
        to = (String)params.get("userMail");
        mailMessage = emailMessageProducer.produce("retrieve", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/admin/admin.jsp"))
      {
        from = registrazione;
        page = (String)params.get("page");
        to = (String)params.get("to_firstcontact");
        to = this.formatTo(to);
        String den = (String)params.get("to_den");
        subject = den  + " è presente su Alloggio Italiano";
        mailMessage = emailMessageProducer.produce("primoContatto", it_IT, MailFormat.html, params);
      }
      else if (page.equals("View/alreadyRegistered.jsp"))
      {
        from = registrazione;
        page = (String)params.get("page");
        to = (String)params.get("to_firstcontact");
        String den = (String)params.get("to_den");
        subject = den  + " è presente su Alloggio Italiano";
        mailMessage = emailMessageProducer.produce("primoContatto", it_IT, MailFormat.html, params);
      }

      else if (page.equals("View/doLog.jsp"))
      {
        to = (String) params.get("to");
        to = this.formatTo(to);
        from = conferma;
        mailMessage = emailMessageProducer.produce("registrazione", it_IT, MailFormat.html, params);
      }
      else
      {
        mailMessage = emailMessageProducer.produce("contatti", // registrazione_plain.ftl
            it_IT, MailFormat.html, params);
      }

      EmailAddress fromAddress = new EmailAddress(EmailAddressType.To, from);
      Set<EmailAddress> recipients = new HashSet<EmailAddress>();
      recipients.add(new EmailAddress(EmailAddressType.To, to));

      mailMessage.setRecipients(recipients);
      mailMessage.setFrom(fromAddress);
      mailMessage.setSubject(subject);

      emailService.enqueue(mailMessage);

      emailQueueWorker.run();

      if( page.equals("View/home.jsp") )
      {
        long x = 0;
        try
        {
          if(StringUtils.isNotEmpty((String) params.get("time")))
          {
            x = Long.parseLong( (String) params.get("time") );
          }
        }
        catch(NumberFormatException e)
        {
          log().error( x + " non è parserizzabile a numero long.");
          return null;
        }

        if(StringUtils.isNotEmpty((String) params.get("time")))
        {
            Timestamp sendtime = new Timestamp( new Date().getTime() );
            String update = "update emailconnection set data_spedizione = '" + sendtime + "'" +
            		" where id_azienda=" + params.get("id") + " and data_creazione = '" + new Timestamp(x) + "';" ;
            DbmsImpl.getInstance().executeUpdate(update);
        }

      }

    }
    catch(Exception e)
    {
      String error = "sendEmail(): " + e.getLocalizedMessage();
      StackTraceElement[] ste = e.getStackTrace();
      for(StackTraceElement s : ste)
        error += "\n\t at " + s.getClassName() + "." + s.getMethodName()
              + " ( " + s.getFileName() + " : " + s.getLineNumber() + " )";

      log().error(error);
    }

    return page;
  }


  private String formatTo(String to)
  {
    if(StringUtils.isNotEmpty(to))
    {
      to = to.trim();
      if(to.contains("/"))
      {
        to = to.substring(0, to.indexOf("/")-1);
      }
    }
    return to;
  }


  /*
   * @see anna.alit.servicebb.AlitService#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
   */
  @Override
  public void sendEmailToList(List<String> mailList)
  {
    String from, to, subject, den;
    from = registrazione;

    try
    {
      EmailMessage mailMessage = new EmailMessage();

      if(mailList.size() > 0)
      {
        for(String mail : mailList)
        {
          log().info("sending contact mail to "+mail);
          to = mail;
          ParamsMap params = findParams(mail);
          den = (String)params.get("to_den");
          subject = den  + " è presente su Alloggio Italiano";

          mailMessage = emailMessageProducer.produce("primoContatto", it_IT, MailFormat.html, params);

          EmailAddress fromAddress = new EmailAddress(EmailAddressType.To, from);
          Set<EmailAddress> recipients = new HashSet<EmailAddress>();
          recipients.add(new EmailAddress(EmailAddressType.To, to));
          mailMessage.setRecipients(recipients);
          mailMessage.setFrom(fromAddress);
          mailMessage.setSubject(subject);
          emailService.enqueue(mailMessage);
          emailQueueWorker.run();
        }
      }
    }
    catch(Exception e)
    {
      String error = "sendEmail(): " + e.getLocalizedMessage();
      StackTraceElement[] ste = e.getStackTrace();
      for(StackTraceElement s : ste)
        error += "\n\t at " + s.getClassName() + "." + s.getMethodName()
              + " ( " + s.getFileName() + " : " + s.getLineNumber() + " )";

      log().error(error);
    }
  }


  private ParamsMap findParams(String mail)
  {
    ParamsMap params = new ParamsMapImpl();

    String q1 = "select id, denominazione from datiaziende where mail like '%"+mail+"%'";

    ParamsMap map = dbmsImpl.retrieveAdminMixedParams("id", "denominazione", q1);

    params.put("to_den", map.get("denominazione"));

    this.updateNotifiedStatus((String)map.get("id"));

    String q2 = "select username, password from titolare where id_azienda="+map.get("id");
    String[] values = new String[]{"username", "password"};

    ParamsMap map2 = dbmsImpl.retrieveAdminStringParams(values, q2);

    String password = (String)map2.get(values[1]);
    try
    {
      password = Aes.decryptFromHexString(password);
    }
    catch (InvalidKeyException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (NoSuchAlgorithmException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (NoSuchPaddingException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (IllegalBlockSizeException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    catch (BadPaddingException e)
    {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    params.put("username", map2.get(values[0]));
    params.put("password", password);

    return params;
 }


  private void updateNotifiedStatus(String id)
  {
    String update = "UPDATE datiaziende SET notified=true where id=" + id;
    int res = dbmsImpl.executeAdminUpdate(update);

    if (res == 0)
    {
      log().warn("it was not possible to update notified status for user id "+id);
    }
  }

}
