/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


/**
 *
 *
 * @author mic
 * @created May 20, 2009
 */
@Repository
public class HeapEmailMessageDao implements EmailMessageDao
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  private long lastId = 0L;
  private Map<Long, EmailMessage> mailQueue = new HashMap<Long, EmailMessage>();


  /*
   * @see mic.organic.mail.EmailMessageDao#insert(mic.organic.mail.EmailMessage)
   */
  @Override
  public void insert(EmailMessage emailMessage)
  {
    if (emailMessage.getId() == null)
    {
      this.lastId++;
      emailMessage.setId(this.lastId);
    }
    this.mailQueue.put(emailMessage.getId(), emailMessage);
  }


  /*
   * @see mic.organic.mail.EmailMessageDao#getUnsent()
   */
  @Override
  public List<EmailMessage> getUnsent()
  {
    List<EmailMessage> messages = new ArrayList<EmailMessage>();
    for (Long id : this.mailQueue.keySet())
    {
      if (!mailQueue.get(id).isSucceeded())
      {
        messages.add(mailQueue.get(id));
      }
    }
    if (!messages.isEmpty())
      return messages;
    return null;
  }


  /*
   * @see mic.organic.mail.EmailMessageDao#delete(mic.organic.mail.EmailMessage)
   */
  @Override
  public void delete(EmailMessage emailMessage)
  {
    this.mailQueue.remove(emailMessage.getId());
  }


  /*
   * @see mic.organic.mail.EmailMessageDao#update(java.lang.Long, int, boolean, java.util.Date)
   */
  @Override
  public void update(Long id, int sendAttemptCount, boolean success, Date date)
  {
    EmailMessage message = this.mailQueue.get(id);
    message.setSentDate(date);
    message.setSendAttemptCount(sendAttemptCount);
    if (success)
      message.setSucceeded(true);
    this.mailQueue.put(id, message);
  }
}
