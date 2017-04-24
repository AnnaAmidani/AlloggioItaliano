/* $Id: AlitService.java 477 2011-10-04 14:04:32Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.servicebb;

import java.util.List;

import anna.alit.beanbb.ParamsMap;

/**
 *
 * @author mic
 * @created Jun 2, 2009
 */
public interface AlitService
{
  String SERVICE_NAME =  "alitService";

  /**
   * @param request
   * @param response
   * @throws IOException
   * @throws ServletException
   */
  String sendEmail(ParamsMap params);


  /**
   * @return
   */
  void sendEmailToList(List<String> mailList);

  /**
   * @return
   */
  UtilityService getUtilityService();


}
