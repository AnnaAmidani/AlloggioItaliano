package anna.alit.servicebb;

import java.sql.SQLException;

import anna.alit.beanbb.HashBean;

public interface GetAlloggioData {

  public static final String SERVICE_NAME = "GetAlloggioDataImpl";

  HashBean getData(String id) throws SQLException;

  String cleanTelephoneNumber(String phone);

  String cleanTheArraystring(String key);

  String internationalize(String key, String locale, String separator);
}