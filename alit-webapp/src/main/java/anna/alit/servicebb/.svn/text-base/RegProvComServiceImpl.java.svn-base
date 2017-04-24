package anna.alit.servicebb;

import java.sql.*;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBeanVector;


@Service(RegProvComServiceImpl.SERVICE_NAME)
public class RegProvComServiceImpl implements RegProvComService {

  static private Logger logger; @SuppressWarnings("static-access")
  protected Logger log()  { if (this.logger == null) this.logger = LoggerFactory.getLogger(this.getClass()); return this.logger; }

  @Autowired protected DbmsImpl dbmsImpl;

 /*
  *
  */
 public static RegProvComService getInstance()
 {
   WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
   RegProvComService service = (RegProvComService)(applicationContext.getBean(RegProvComService.SERVICE_NAME));
   return service;
 }



 /*
  *
  */
 public RegProvComServiceImpl()
 {
   log().info("");
 }



  /* (non-Javadoc)
   * @see anna.alit.servicebb.RegProvComService#getSigle(java.lang.String)
   */
  public HashBeanVector getSigle(String regione) {

    HashBeanVector result = new HashBeanVector();
    ResultSet regioni = null;

    String query =
      "SELECT sigla, nomeesteso from provincia where regione = '" + regione + "' order by nomeesteso";

    regioni = dbmsImpl.executeQuery(query);
    // Memorizzo il risultato dell'interrogazione nel Vector
    try {
      result.insertResult(regioni, new String[]{"sigla", "nomeesteso"});
    } catch(SQLException e) {
      e.printStackTrace();
    }

    return result;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.RegProvComService#getTrasporti(java.lang.String, java.lang.String)
   */
  public HashBeanVector getTrasporti(String regione, String sigla) {

    HashBeanVector result = new HashBeanVector();
    ResultSet sigle = null, limitrofe = null, comuni = null, aeroporti = null, caselli = null, stazioni = null;

    String querySigle =
      "SELECT sigla, nomeesteso from provincia where regione = '" + regione + "' order by sigla";

    String queryLimitrofe =
      "SELECT limitrofa1, limitrofa2, limitrofa3, limitrofa4, limitrofa5, limitrofa6, limitrofa7, limitrofa8 " +
      "FROM provincia WHERE sigla= '" + sigla +"'";

    String queryComuni =
      "SELECT distinct comune FROM comune," +
      " provincia WHERE comune.provincia = provincia.nomeesteso" +
      " AND provincia.sigla = '" + sigla + "' order by comune";

    String queryAeroporti =
      "SELECT distinct aeroporto FROM aeroporti WHERE sigprov = '" + sigla + "'";

    String queryCaselli =
      "SELECT distinct uscita, autostrada " +
      "FROM caselliautostrade WHERE sigprov = '" + sigla + "'";

    String queryStazioni =
      "SELECT distinct nomestazione FROM stazioni WHERE sigprov = '" + sigla + "'";

    limitrofe =  dbmsImpl.executeQuery(queryLimitrofe);

    try
    {
	  if(limitrofe != null && limitrofe.next())
	  {
		 for(int i = 1; i < 9; i++)
		 {
			 String match = "limitrofa"+i;
			 if(!StringUtils.equals(limitrofe.getString(match), "-"))
			 {
				 String orConditions = "or sigprov ='"+limitrofe.getString(match)+"'";
				 queryAeroporti += orConditions;
				 queryCaselli   += orConditions;
				 queryStazioni  += orConditions;
			 }

		 }

	  }
	}
    catch (SQLException e1)
    {
	  log().warn(e1.getMessage());
	}

    queryAeroporti += " order by aeroporto";
	queryCaselli   += " order by uscita";
	queryStazioni  += " order by nomestazione";

    sigle =  dbmsImpl.executeQuery(querySigle);
    comuni = dbmsImpl.executeQuery(queryComuni);
    aeroporti = dbmsImpl.executeQuery(queryAeroporti);
    caselli = dbmsImpl.executeQuery(queryCaselli);
    stazioni = dbmsImpl.executeQuery(queryStazioni);

    try
    {
      result.insertResult(sigle, new String[]{"sigla", "nomeesteso"});
      result.insertResult(comuni, new String[]{"comune"});
      result.insertResult(aeroporti, new String[]{"aeroporto"});
      result.insertResult(caselli, new String[]{"autostrada", "uscita"});
      result.insertResult(stazioni, new String[]{"nomestazione"});
    }
    catch(SQLException e)
    {
      e.printStackTrace();
    }

    return result;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.RegProvComService#getComune(java.lang.String, java.lang.String)
   */
  public HashBeanVector getComune(String regione, String sigla) {
      HashBeanVector result = new HashBeanVector();
      ResultSet sigle = null, comuni = null, distretti = null;

      String querySigle =
          "SELECT sigla, nomeesteso from provincia where regione = '" + regione + "' order by nomeesteso";

      String queryComuni =
          "SELECT distinct comune FROM comune," +
          " provincia WHERE comune.provincia = provincia.nomeesteso" +
          " AND provincia.sigla = '" + sigla + "' order by comune";

      String queryDistretti =
          "SELECT distinct distretto FROM distretto," +
          " provincia WHERE distretto.prov = provincia.sigla" +
          " AND provincia.sigla = '" + sigla + "' order by distretto";

      sigle =  dbmsImpl.executeQuery(querySigle);
      comuni = dbmsImpl.executeQuery(queryComuni);
      distretti = dbmsImpl.executeQuery(queryDistretti);

      try {
          result.insertResult(sigle, new String[]{"sigla", "nomeesteso"});
          result.insertResult(comuni, new String[]{"comune"});
          result.insertResult(distretti, new String[]{"distretto"});

      } catch(SQLException e) {
          e.printStackTrace();
      }
      return result;
  }

  /* (non-Javadoc)
   * @see anna.alit.servicebb.RegProvComService#insertDistretto(anna.alit.beanbb.HashBeanVector, java.lang.String)
   */
  public void insertDistretto(HashBeanVector hashResult, String regione) {

      ResultSet distretti = null;

      String queryDistretti =
                  "SELECT distinct distretto, regione" +
                  " FROM distretto, provincia" +
                  " WHERE distretto.prov = provincia.sigla" +
                  " AND provincia.regione ='"  + regione + "' order by distretto";

      distretti = dbmsImpl.executeQuery(queryDistretti);

      try {
          hashResult.insertResult(distretti, new String[]{"distretto"});
      } catch(SQLException e) {
          e.printStackTrace();
      }
  }

    /* (non-Javadoc)
     * @see anna.alit.servicebb.RegProvComService#popolaAction(java.lang.String, java.lang.String)
     */
    public HashBeanVector popolaAction(String regione, String sigla) {

    HashBeanVector hashResult = null;

      if(regione != null && (sigla == null || sigla.equals("0")) ) {
    // se non ho province eseguo query per ottenerle
      hashResult = getSigle(regione);
    }
    else if(regione != null && sigla != null && !sigla.equals("0")) {
    // se non ho i comuni eseguo una query per ottenerli (insieme a aeroporti, autostrade, stazioni)
      hashResult = getTrasporti(regione, sigla);
    }

      return hashResult;
  }

    /* (non-Javadoc)
     * @see anna.alit.servicebb.RegProvComService#RegProvComAction(java.lang.String, java.lang.String)
     */
    public HashBeanVector RegProvComAction(String regione, String sigla) {

      HashBeanVector hashResult = null;

      if(regione != null && (sigla == null || sigla.equals("0")) ) {
      // se non ho province eseguo query per ottenerle
          hashResult = getSigle(regione);
          insertDistretto(hashResult, regione);
      }
      else if(regione != null && sigla != null && !sigla.equals("0")) {
      // se non ho i comuni eseguo una query per ottenerli
          hashResult = getComune(regione, sigla);
      }

      return hashResult;
  }

}