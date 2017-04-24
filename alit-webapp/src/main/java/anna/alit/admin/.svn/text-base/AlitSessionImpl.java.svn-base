/* $Id$
 *
 * Copyright(C) 2010 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.admin;

import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import mic.organic.aaa.model.AccountModel;
import mic.organic.core.OrganicSessionImpl;


/**
 *
 *
 * @author mic
 * @created Oct 23, 2010
 */
public class AlitSessionImpl extends OrganicSessionImpl<AccountModel>
{
 static private Logger logger; @SuppressWarnings("static-access")
 protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }


 /*
  *
  */
 public AlitSessionImpl()
 {
   super();
   //log().info("=================================================");
   log().info("sessionId={}, creationTime={}", getSessionId(), new Date(getCreationTime()));

   //refreshAuthenticationContext();
 }

}
