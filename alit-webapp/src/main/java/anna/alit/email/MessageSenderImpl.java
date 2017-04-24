/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import java.io.File;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

/**
 *
 * @author mic
 * @created May 20, 2009
 */
public class MessageSenderImpl implements MessageSender
{
  static private Logger logger;
  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  @Autowired
  protected JavaMailSender javaMailSender;

  protected String to;
  protected String from;
  protected String subject;
  protected String plainText;
  protected String imagePath;
  protected String imageName;

  /**
   *
   *
   * @author mic
   * @created May 20, 2009
   */
  private class MessagePreparator implements MimeMessagePreparator {

    /*
     * @see org.springframework.mail.javamail.MimeMessagePreparator#prepare(javax.mail.internet.MimeMessage)
     */
    @Override
    public void prepare(MimeMessage msg) throws Exception {

      msg.addFrom(InternetAddress.parse(from));
      msg.addRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
      msg.setSubject(subject);

      // create wrapper multipart/alternative part
      MimeMultipart ma = new MimeMultipart("alternative");
      msg.setContent(ma);

      // create the plain text
      if(plainText != null) {
        BodyPart plainTextPart = new MimeBodyPart();
        plainTextPart.setText(plainText);
        ma.addBodyPart(plainTextPart);
      }

      // create the html and image multipart wrapper
      BodyPart related = new MimeBodyPart();
      MimeMultipart mr = new MimeMultipart("related");
      related.setContent(mr);
      ma.addBodyPart(related);

      BodyPart html = new MimeBodyPart();
      html.setContent(
          "<html><head></head><body><h1>This is the HTML version of the mail."
              + "</h1><img src=\"cid:0001\"></body></html>", "text/html");
      mr.addBodyPart(html);

      BodyPart img = new MimeBodyPart();
      img.setHeader("Content-ID", "0001");
      img.setDisposition("inline");
      img.setDataHandler(new DataHandler(new FileDataSource(
          "./ch13/src/main/resources/images/apress.gif")));
      mr.addBodyPart(img);
    }
  }

  /*
   *
   */
  public MessageSenderImpl() {
  }

  /**
   * @see anna.alit.email.MessageSender#setTo(java.lang.String)
   */
  public void setTo(String to) {
    this.to = to;
  }

  /**
   * @see anna.alit.email.MessageSender#setFrom(java.lang.String)
   */
  public void setFrom(String from) {
    this.from = from;
  }

  /**
   * @see anna.alit.email.MessageSender#setSubject(java.lang.String)
   */
  public void setSubject(String subject) {
    this.subject = subject;
  }

  /**
   * @see anna.alit.email.MessageSender#setContent()
   */
  public void setPlainText(String plainText) {
    this.plainText = plainText;
  }

  public void setImagePath(String imagePath) {
    this.imagePath = imagePath;
  }

  public void setImageName(String imageName) {
    this.imageName = imageName;
  }

  /**
   * @see anna.alit.email.MessageSender#send()
   */
  public void send() throws MessagingException {

    MimeMessage msg = javaMailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(msg, true);

    helper.setTo(to);
    helper.setFrom(from);
    helper.setSubject(subject);

    if(plainText != null)
      helper.setText(plainText, true);

    // add the image
    if(imageName != null && imagePath != null) {
      FileSystemResource img = new FileSystemResource(new File(imagePath));
      helper.addAttachment(imageName, img);
    }

    javaMailSender.send(msg);
  }

  /*
   *
   */
  /*
   * (non-Javadoc)
   *
   * @see anna.alit.email.MessageSender#sendMessagePreparator()
   */
  public void sendMessagePreparator() {
    MessagePreparator preparator = new MessagePreparator();
    javaMailSender.send(preparator);
  }

  /*
   *
   */
  /*
   * (non-Javadoc)
   *
   * @see anna.alit.email.MessageSender#sendInlineMessage()
   */
  public void sendInlineMessage() throws MessagingException {
    MimeMessage msg = javaMailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(msg, true);

    helper.setTo(to);
    helper.setFrom(from);
    helper.setSubject(subject);

    helper.setText("<html><head></head><body><h1>Hello World!</h1>"
        + "<img src=\"cid:abc\"></body></html>", true);

    // add the image
    FileSystemResource img = new FileSystemResource(new File(
        "./ch13/src/main/resources/images/apress.gif"));
    helper.addInline("abc", img);

    javaMailSender.send(msg);
  }
}
