package anna.alit.admin;

import anna.alit.model.AziendeModel;
import anna.alit.model.Banners;

public interface AdminActions
{
  public static final String SERVICE_NAME = "adminActions";

  public int insertBanner(Banners banner);

  public abstract int insert(AziendeModel aziendeModel);

  public abstract int update(AziendeModel aziendeModel, int id);

  public abstract int delete(String identifier);

  public abstract int subscription(String identifier, boolean activate);

  public void sendMailListParam(String sigla, String tipologia);

}