/* $Id: MailTest.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2008 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTestNGSpringContextTests;
import org.testng.annotations.AfterClass;
import anna.alit.beanbb.ParamsMap;
import anna.alit.beanbb.ParamsMapImpl;

import static org.testng.Assert.*;


/**
 *
 *
 * @author mic
 * @created Dec 1, 2008
 */
@ContextConfiguration(locations = { "/test-mail.spring.xml" })
public class MailTest extends AbstractTestNGSpringContextTests
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired private EmailQueueWorker emailQueueWorker;
  @Autowired private EmailService emailService;
  @Autowired private EmailMessageDao emailMessageDao;
  @Autowired private FreemarkerEmailMessageProducer emailMessageProducer;

  private Locale it_IT = new Locale("it", "IT");
  //private Locale en_GB = new Locale("en", "GB");


  /*
   *
   */
  @AfterClass
  public void justWait() throws Exception
  {
    //String cd = getClass().getResource(".").toExternalForm();
    //freeMarkerConfiguer.setTemplateLoaderPath(cd);
    //Thread.sleep(300*1000);
  }


  /*
   *
   */
  //@Test
  public void testNothing() throws Exception
  {
    assertEquals(0, 0);

    //MailMessage mailMessage = null;
    //javaMailSender.
  }


  /*
   *
   */
  private EmailMessage createEmailMessage()
  {
    Set<EmailAddress> recipients = new HashSet<EmailAddress>();
    recipients.add(new EmailAddress(EmailAddressType.To, "an5tash@gmail.com"));
    EmailMessage message = new EmailMessage();
    message.setFrom(new EmailAddress(EmailAddressType.To, "an5tash@gmail.com"));
    message.setSubject("Test email");
    message.setBody("This is a test email.");
    message.setRecipients(recipients);
    return message;
  }


  /*
   *
   */
  //@Test
  public void testVoid()
  {
    EmailMessage message = createEmailMessage();
    message.setSubject(null);
    assertNull(message.getId(), "Should not have enqueued");
    message.setSubject("Test mail");
    EmailMessage anotherMessage = createEmailMessage();

    emailService.enqueue(message);
    assertNotNull(message.getId(), "Should have enqueued");

    emailService.enqueue(anotherMessage);
    assertNotNull(anotherMessage.getId(), "Should have enqueued");
    assertEquals(emailMessageDao.getUnsent().size(), 2, "Failed");
  }


  /*
   * this test send an email!!!
   */
  //@Test
  public void testEnqueueEmail() throws Exception
  {
    EmailMessage message = createEmailMessage();
    emailService.enqueue(message);

    emailQueueWorker.run();
  }


  /*
   *
   */
  private void assertBody(final Locale locale, final MailFormat format, final String expected)
  {
    EmailMessage mailMessage = emailMessageProducer.produce("test", locale, format, null);
    assertEquals(mailMessage.getBody(), expected, "Incorrect body");
  }


  /*
   *
   */
  //@Test
  public void testCreateBodyValidLocale()
  {
    assertBody(it_IT, MailFormat.html, "<html>italiano</html>");
    assertBody(it_IT, MailFormat.plain, "italiano");
    //assertBody(en_GB, MailFormat.plain, "British English");
  }


  /*
   *
   */
  //@Test
  public void testCreateBodyInvalidLocale()
  {
    try
    {
      assertBody(new Locale("fo", "BA"), MailFormat.plain, "British English");
      fail("Loaded template for invalid locale");
    }
    catch (RuntimeException e)
    {
      // expected
    }
}

  //@Test
  public void testSendMail(){

    EmailMessage message = new EmailMessage();
    EmailAddress fromAddress = new EmailAddress(EmailAddressType.To, "an5tash@gmail.com");

    Set<EmailAddress> recipients = new HashSet<EmailAddress>();
    recipients.add(new EmailAddress(EmailAddressType.To, "an5tash@gmail.com"));

    message.setRecipients(recipients);
    message.setFrom(fromAddress);
    message.setSubject("subject");
    message.setBody("ciao mondo!");

    emailService.enqueue(message);

    emailQueueWorker.run();
  }

  //@Test
  public void testSendFTLMail(){

    ParamsMap params = new ParamsMapImpl();
    params.put("from", "contatti");
    params.put("header", "questo è l'header");
    params.put("subject", "this is the subject");
    params.put("fromAnother", "questo è l'indirizzo fromAnnother");
    params.put("body", "bla");
    params.put("data", "data");
    params.put("regioni", new ArrayList<String>());
    params.put("tipologie", new ArrayList<String>());
    params.put("periodi", new ArrayList<String>());
    params.put("posizioni", new ArrayList<String>());
    params.put("noResp", "noResp noResp noResp noResp noResp noResp noResp");

    EmailMessage mailMessage = emailMessageProducer.produce("okX", it_IT, MailFormat.plain, params );
    log().info("{}", mailMessage.getBody());

    EmailAddress fromAddress = new EmailAddress(EmailAddressType.To, "an5tash@gmail.com");
    String subject = (String) params.get("subject");

    Set<EmailAddress> recipients = new HashSet<EmailAddress>();
    recipients.add(new EmailAddress(EmailAddressType.To, "an5tash@gmail.com"));

    mailMessage.setRecipients(recipients);
    mailMessage.setFrom(fromAddress);
    mailMessage.setSubject(subject);

    emailService.enqueue(mailMessage);

    emailQueueWorker.run();
  }


}
