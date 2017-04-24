package anna.alit.utilities;

import java.io.UnsupportedEncodingException;

public class XhtmlEncoder {
  
  
  public static String encode(String s) {
    if(s == null)
      return "";
    
    s = s.replace("&amp;", "&");

    s = s.replace("è", "&egrave;"); 
    s = s.replace("à", "&agrave;"); 
    s = s.replace("ò", "&ograve;"); 
    s = s.replace("ù", "&ugrave;"); 
    s = s.replace("ì", "&igrave;"); 
    s = s.replace("é", "&eacute;"); 
    s = s.replace("\"", "&quot;"); 
    s = s.replace("&", "&amp;"); 
    s = s.replace("<", "&lt;"); 
    s = s.replace(">", "&gt;"); 
    s = s.replace("€", "&euro;"); 
    s = s.replace("©", "&copy;"); 
    s = s.replace("®", "&reg;"); 
    s = s.replace("Ø", "&Oslash;"); 
    s = s.replace("£", "&pound;"); 
    s = s.replace("¹", "&sup1;"); 
    s = s.replace("º", "&ordm;"); 
    return s;
  }
  
  public static String encodeUtf8(String s) {
    
    if(s == null)
      return "";
    
    String encoded = "";
    
    try {
      encoded = new String(s.getBytes("UTF-8"));
    } catch (UnsupportedEncodingException e) {
      return "";
    }
     
     return encoded;
  }
  
}
