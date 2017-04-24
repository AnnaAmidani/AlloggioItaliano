/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 *
 *
 * @author mic
 * @created May 20, 2009
 */
@Service("emailService")
public class EmailServiceImpl implements EmailService
{
  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired private EmailMessageDao emailMessageDao;


  /*
   *
   */
  @Override
  public void enqueue(final EmailMessage message)
  {
    try
    {
      message.validate();
    }
    catch (IllegalArgumentException e)
    {
      // Invalid message, handle it
      log().warn("Invalid message, handle it: {}", e.getMessage());
      //return;
      throw new RuntimeException(e);
    }

    // the message is valid; insert it to the queue
    this.emailMessageDao.insert(message);
  }

}
