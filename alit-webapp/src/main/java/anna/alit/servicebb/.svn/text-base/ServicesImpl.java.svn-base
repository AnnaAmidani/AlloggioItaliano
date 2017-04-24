package anna.alit.servicebb;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import anna.alit.beanbb.HashBean;
import anna.alit.beanbb.HashBeanVector;
import anna.alit.beanbb.ParamsMap;
import anna.alit.utilities.UtilService;

@Service(ServicesImpl.SERVICE_NAME)
public class ServicesImpl implements Services {

  static private Logger logger;

  @SuppressWarnings("static-access")
  protected Logger log() {
    if (this.logger == null)
      this.logger = LoggerFactory.getLogger(this.getClass());
    return this.logger;
  }

  /*
  *
  */
  public static Services getInstance() {
    WebApplicationContext applicationContext = ContextLoader.getCurrentWebApplicationContext();
    Services service = (Services) (applicationContext.getBean(Services.SERVICE_NAME));
    return service;
  }

  /*
  *
  */
  public ServicesImpl() {
    log().info("");
  }

  private String replaceSpecial(String s)
  {
	if(s.indexOf('à') != -1)
	{
	  s = s.replace('à', 'a');
	}
	if(s.indexOf('è') != -1)
	{
  	  s = s.replace('è', 'e');
	}
	if(s.indexOf('ì') != -1)
	{
	  s = s.replace('ì', 'i');
	}
	if(s.indexOf('ò') != -1)
	{
	  s = s.replace('ò', 'o');
	}
	if(s.indexOf('ù') != -1)
	{
	  s = s.replace('ù', 'u');
	}
	if(s.indexOf('é') != -1)
	{
	  s = s.replace('é', 'e');
	}
	return s;
  }
  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.Services#createUsername(java.lang.String)
   */
  public String createUsername(String s)
  {
	this.replaceSpecial(s);
    char[] lower = s.toCharArray();
    String username = "";

    for (char ch : lower)
    {
      if (Character.isLetter(ch) || Character.isDigit(ch))
      {
        username += ch;
      }
    }
    username = username.toLowerCase();

//    if (username.equals(""))
//    {
//      username = "alloggioItaliano";
//    }

    return username;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.Services#createPsw(int)
   */
  public String createPsw(int length) {

    Random random = new Random();

    String chars = "";
    chars += "abcdefghijkmnpqrstuvwyz";
    chars += "ABCDEFGHJLKMNPQRSTUVWYZ";
    chars += "23456789";

    int numChars = chars.length();

    if (length <= 0)
      return "";

    StringBuffer buffer = new StringBuffer();

    char ch;
    for (int i = 0; i < length; i++) {
      ch = chars.charAt(random.nextInt(numChars));
      buffer.append(ch);
    }

    return buffer.toString();
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.Services#literalArrayString(java.lang.String[])
   */
  public String literalArrayString(String[] array)
  {
    String literalArray = "'{";
    for (String value : array)
    {
      if (value != null && !value.equals("") && !value.equals("-"))
      {
  	    value = value.replace('\'', '`');
        literalArray += "\"" + value + "\", ";
      }
    }
    if (!literalArray.equals("'{"))
      literalArray = literalArray.substring(0, literalArray.length() - 2);

    literalArray += "}'";
    // }

    return literalArray;
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.Services#makeHashBeanVector(javax.servlet.http.
   * HttpServletRequest, java.lang.String[])
   */
  public HashBeanVector makeHashBeanVector(HttpServletRequest request, String[] parameterNames)
  {
    HashBeanVector dati = new HashBeanVector();

    for (String name : parameterNames)
    {
      String[] values = request.getParameterValues(name);
      if (values == null)
        continue;

      dati.put(name, values);
    }

    return dati;
  }

  public HashBeanVector makeHashBeanVector(ParamsMap params, String[] parameterNames)
  {
    HashBeanVector dati = new HashBeanVector();

    for (String name : parameterNames)
    {
      String[] values = (String[]) params.gets(name);
      if (values == null)
      {
        values = new String[]{""};
        //continue;
      }
      dati.put(name, values);
    }

    return dati;
  }


  /*
   * @see
   * anna.alit.servicebb.Services#makeHashBean(javax.servlet.http.HttpServletRequest
   */
  public HashBean makeHashBean(HttpServletRequest request, String[] parameterNames)
  {
    HashBean dati = new HashBean();
    String value = null;

    for (String name : parameterNames)
    {
      value = request.getParameter(name);
      if (value == null)
      {
        continue;
      }
      else
      {
        value = UtilService.alitRequestFormatter(value);
        dati.put(name, value);
      }
    }
    return dati;
  }

  public HashBean makeHashBean(ParamsMap params, String[] parameterNames)
  {
    HashBean dati = new HashBean();
    String value = null;

    for (String name : parameterNames) {
      value = (String) params.get(name);
      value = UtilService.alitRequestFormatter(value);
      if (value == null)
        value="";

      dati.put(name, value);
    }

    return dati;
  }

  public HashBeanVector makeFirstHashBeanVector(ParamsMap params, String[] parameterNames)
  {
    HashBeanVector dati = new HashBeanVector();

    for (String name : parameterNames)
    {
      String[] values = (String[]) params.gets(name);
      if (values == null)
      {
        continue;
      }
      dati.put(name, values);
    }

    return dati;
  }

  public HashBeanVector makeFirstHashBeanVector(HttpServletRequest request, String[] parameterNames)
  {
    HashBeanVector dati = new HashBeanVector();

    for (String name : parameterNames)
    {
      String[] values = request.getParameterValues(name);
      if (values == null)
        continue;

      dati.put(name, values);
    }

    return dati;
  }


  public HashBean makeFirstHashBean(ParamsMap params, String[] parameterNames)
  {
    HashBean dati = new HashBean();
    String value = null;

    for (String name : parameterNames)
    {
      value = (String) params.get(name);
      if (value == null)
      {
        continue;
      }
      dati.put(name, value);
    }

    return dati;
  }

  public HashBean makeFirstHashBean(HttpServletRequest request, String[] parameterNames)
  {
    HashBean dati = new HashBean();
    String value = null;

    for (String name : parameterNames)
    {
      value = request.getParameter(name);
      if (value == null)
      {
        continue;
      }
      dati.put(name, value);
    }
    return dati;
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.servicebb.Services#addToHashBean(anna.alit.beanbb.HashBean,
   * javax.servlet.http.HttpServletRequest, java.lang.String,
   * java.lang.String[])
   */
  public void addToHashBean(HashBean dati, HttpServletRequest request,
      String nometabella, String[] campi) {

    for (String campo : campi)
      dati.put(nometabella + "." + campo, request.getParameter(campo));
  }

  /*
   * (non-Javadoc)
   *
   * @seeanna.alit.servicebb.Services#addToHashBeanVector(anna.alit.beanbb.
   * HashBeanVector, javax.servlet.http.HttpServletRequest, java.lang.String,
   * java.lang.String[])
   */
  public void addToHashBeanVector(HashBeanVector dati,
      HttpServletRequest request, String nometabella, String[] campi) {

    for (String campo : campi) {
      String[] values = request.getParameterValues(campo);
      if (values == null)
        continue;

      dati.put(nometabella + "." + campo, values);
    }
  }



}
