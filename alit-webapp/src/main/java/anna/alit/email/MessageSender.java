package anna.alit.email;

import javax.mail.MessagingException;

public interface MessageSender {

  /*
   *
   */
  public abstract void setTo(String to);

  /*
   *
   */
  public abstract void setFrom(String from);

  /*
   *
   */
  public abstract void setSubject(String subject);

  /*
   *
   */
  public abstract void send() throws MessagingException;

  /*
   *
   */
  public abstract void sendMessagePreparator();

  /*
   *
   */
  public abstract void sendInlineMessage() throws MessagingException;

}