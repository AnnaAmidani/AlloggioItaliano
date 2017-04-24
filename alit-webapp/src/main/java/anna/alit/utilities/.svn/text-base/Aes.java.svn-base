package anna.alit.utilities;

/* $Id: Aes.java 321 2010-09-23 14:06:58Z anna.amidani $ Sep 14, 2009 ee14645 */

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.security.core.codec.Base64;

//import org.apache.commons.codec.binary.Base64;



/**
 * This program generates a AES key, retrieves its raw bytes, and then reinstantiates a AES key from the key bytes. The reinstantiated key is used to initialize
 * a AES cipher for encryption and decryption.
 *
 * @author mic
 * @created Sep 20, 2010
 */
public class Aes
{
  private static final String ALGO = "AES";


  /*
   *
   */
  public static void main(String[] args) throws Exception
  {
    String message = "This is just an example";
    String encrypted = encryptToHexString(message);
    System.out.println("decrypted string: " + encrypted);
    String decrypted = decryptFromHexString(encrypted);

    System.out.println("decrypted string: " + decrypted);
  }


  /**
   * Generate the secret key specs.
   */
  private static byte[] getSecretKey()
  {
    byte[] raw = "ciaociaociaociao".getBytes();//skey.getEncoded();
    return raw;
  }


  /*
   *
   */
  private static Cipher getCipher(boolean enrypt) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException
  {
    SecretKeySpec skeySpec = new SecretKeySpec(getSecretKey(), ALGO);
    Cipher cipher = Cipher.getInstance(ALGO);
    cipher.init(enrypt ? Cipher.ENCRYPT_MODE : Cipher.DECRYPT_MODE, skeySpec);
    return cipher;
  }


  /*
   *
   */
  public static String encryptToHexString(String message) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException
  {
    Cipher cipher = getCipher(true);
    byte[] encrypted = cipher.doFinal(message.getBytes());
    return new String(Base64.encode(encrypted));
  }


  /*
   *
   */
  public static String decryptFromHexString(String encrypted) throws InvalidKeyException, NoSuchAlgorithmException, NoSuchPaddingException, IllegalBlockSizeException, BadPaddingException
  {
    Cipher cipher = getCipher(false);
    byte[] original = cipher.doFinal(Base64.decode(encrypted.getBytes()));
    return new String(original);
  }

}