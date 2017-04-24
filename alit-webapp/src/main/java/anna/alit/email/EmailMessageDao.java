/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import java.util.List;
import java.util.Date;


/**
 *
 *
 * @author mic
 * @created May 20, 2009
 */
public interface EmailMessageDao
{
  /*
   *
   */
  void insert(EmailMessage emailMessage);


  /*
   *
   */
  List<EmailMessage> getUnsent();


  /*
   *
   */
  void delete(EmailMessage emailMessage);


  /*
   *
   */
  void update(Long id, int sendAttemptCount, boolean success, Date date);
}
