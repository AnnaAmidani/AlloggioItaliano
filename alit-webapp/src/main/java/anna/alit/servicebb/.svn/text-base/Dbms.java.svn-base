/* $Id: Dbms.java 513 2012-01-03 19:31:55Z anna.amidani $
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.servicebb;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;


/**
 *
 * @author anna
 * @created May 28, 2009
 */
public interface Dbms
{
  Connection openConnection();

  void closeConnection(Connection connection);

  ResultSet executeQuery(String query);

  List<String> executeGenericAdminQuery(String query);

  public ParamsMap retrieveAdminMixedParams(String intValue, String charvalue, String query);

  public ParamsMap retrieveAdminStringParams(String[] values, String query);

  int executeAdminQuery(String query, String columnName);

  String executeAdminStringQuery(String query, String columnName);

  HashBeanVector executeQuery(String query, String[] campi);

  HashBean executeSingleQuery(String query, String[] campi);

  int executeUpdate(String update);

  int executeAdminUpdate(String update);

  int insertImage(String insert, InputStream inputStream, int streamLength);

  int insertImageFromAdmin(String insert, byte[] bytes);
}
