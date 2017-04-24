package anna.alit.utilities;

import java.util.Random;

public class UtilService
{

  public static String createUsername(String s)
  {
    replaceSpecial(s);
    char[] lower = s.toCharArray();
    String username = "";

    for (char ch : lower)
    {
      if (Character.isLetter(ch) || Character.isDigit(ch))
      {
        username += ch;
        username = username.toLowerCase();
      }
    }
    return username;
  }

  public static String createPsw(int length)
  {

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
    for (int i = 0; i < length; i++)
    {
      ch = chars.charAt(random.nextInt(numChars));
      buffer.append(ch);
    }

    return buffer.toString();
  }


  private static String replaceSpecial(String s)
  {
    s = alitRequestFormatter(s);
    if (s.indexOf('à') != -1)
    {
      s = s.replace('à', 'a');
    }
    if (s.indexOf('è') != -1)
    {
      s = s.replace('è', 'e');
    }
    if (s.indexOf('ì') != -1)
    {
      s = s.replace('ì', 'i');
    }
    if (s.indexOf('ò') != -1)
    {
      s = s.replace('ò', 'o');
    }
    if (s.indexOf('ù') != -1)
    {
      s = s.replace('ù', 'u');
    }
    if (s.indexOf('é') != -1)
    {
      s = s.replace('é', 'e');
    }
    return s;
  }

  public static String alitRequestFormatter(String value)
  {
    if (value != null)
    {
      if (value.indexOf('\'') != -1)
      {
        value = value.replace('\'', '`');
      }
      if (value.indexOf("Ã¨") != -1)
      {
        value = value.replace("Ã¨", "è");
      }
      if (value.indexOf("Ã ") != -1)
      {
        value = value.replace("Ã ", "à");
      }
      if (value.indexOf("Ã²") != -1)
      {
        value = value.replace("Ã²", "ò");
      }
      if (value.indexOf("Ã¹") != -1)
      {
        value = value.replace("Ã¹", "ù");
      }
      if (value.indexOf("Ã¬") != -1)
      {
        value = value.replace("Ã¬", "ì");
      }
      if (value.indexOf("Ã©") != -1)
      {
        value = value.replace("Ã©", "é");
      }
      if (value.indexOf('Ã') != -1)
      {
        value = value.replace('Ã', 'à');
      }
      if (value.indexOf("à¨") != -1)
      {
        value = value.replace("à¨", "è");
      }
      if (value.indexOf("à©") != -1)
      {
        value = value.replace("à©", "é");
      }
      if (value.indexOf("à¬") != -1)
      {
        value = value.replace("à¬", "ì");
      }
      if (value.indexOf("à²") != -1)
      {
        value = value.replace("à²", "ò");
      }
      if (value.indexOf("à¹") != -1)
      {
        value = value.replace("à¹", "ù");
      }
    }

    return value;
  }

  public static String extractTipo(String tipo)
  {
    String esteso = "no match found for tipologia/tipoesteso";
    if (tipo.equals("AC"))
    {
      esteso = "affittacamere/locanda";
    }
    if (tipo.equals("AT"))
    {
      esteso = "agriturismo/countryhouse";
    }
    if (tipo.equals("BB"))
    {
      esteso = "bed and breakfast";
    }
    if (tipo.equals("OG"))
    {
      esteso = "ostello";
    }
    if (tipo.equals("RA"))
    {
      esteso = "rifugio";
    }
    return esteso;
  }

}