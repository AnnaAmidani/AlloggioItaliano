package anna.alit.utilities;

import java.io.UnsupportedEncodingException;

public class StringUtf8 {

  byte[] value;
  
  public StringUtf8(String s) {
    try {
      value = s.getBytes("UTF-8");
    } catch (UnsupportedEncodingException e) {
      value = new byte[0];
    }
  }
  
  public String toString() {
    String s = "";
    
    for(byte b : value)
      s += (char) b;
    
    return s;
  }
  
}
