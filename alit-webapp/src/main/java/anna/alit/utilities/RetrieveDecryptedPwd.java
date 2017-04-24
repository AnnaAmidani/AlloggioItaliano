package anna.alit.utilities;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.commons.lang.xwork.StringUtils;

public class RetrieveDecryptedPwd {

	public static void main(String[] args) {

		//Inserire l'id per ottenere la password in chiaro di una determinata struttura
		//Solo a scopo di test!!!
//      String query = "select denominazione, id_azienda, username, password  from titolare, datiaziende where titolare.id_azienda = datiaziende.id and datiaziende.denominazione like '%erdinandeo%'";
      String query = "select denominazione, id_azienda, username, password  from titolare, datiaziende where titolare.id_azienda = datiaziende.id and id_azienda=6223";
//		String query = "select denominazione, id_azienda, username, password from titolare, datiaziende where titolare.id_azienda = datiaziende.id";

		//Attenzione: i parametri di connessioni al db sono CABLATI nella classe BdUtil. Ricordarsi di controllarne la correttezza
		ResultSet rs = DbUtil.executeQuery(query);


    try
    {
      System.out.println("ecco qui: "+Aes.decryptFromHexString("5/IRlvwkRZaEjFpbk8TRmA=="));
    }
    catch (InvalidKeyException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
    catch (NoSuchAlgorithmException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
    catch (NoSuchPaddingException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
    catch (IllegalBlockSizeException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
    catch (BadPaddingException e1)
    {
      // TODO Auto-generated catch block
      e1.printStackTrace();
    }
		String psw, id, usr, den;
		try
		{
			while(rs != null && rs.next())
			{
			  id = rs.getString("id_azienda");
			  psw = rs.getString("password");
			  usr = rs.getString("username");
			  System.out.print(id + "\t" + usr + "\t" + psw);

		      if(StringUtils.isNotEmpty(psw))
		      {
		        psw = Aes.decryptFromHexString(psw);
			    System.out.print("\ndecrypted password: "+psw);
			    System.out.print("\n\n");
		      }
			}
		}
		catch(Exception e)
		{
			System.out.println(e + "\n HERE!! " + e.getMessage() + "\n" + e.getStackTrace());
		}
		System.out.println("end!");
	}

}