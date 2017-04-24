package anna.alit.utilities;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;

import org.apache.commons.lang.StringUtils;

public class UpdateAesPwd {

	public void update(String execute) throws IOException {

		if(StringUtils.isNotEmpty(execute) && StringUtils.equals(execute, "true"))
		{
			FileWriter writer = new FileWriter("/tmp/updateAesPwd.log");

			String query = "select id_azienda, password from titolare where id_azienda<4000";

			//Attenzione: i parametri di connessione al db sono CABLATI nella classe BdUtil. Ricordarsi di controllarne la correttezza
			ResultSet rs = DbUtil.executeQuery(query);

			String id, psw, update;
			try
			{
				while(rs != null && rs.next())
				{
				  id = rs.getString("id_azienda");
				  psw = rs.getString("password");

				  writer.write("modifying "+ id + "\t" + psw + "...");

			      if(StringUtils.isNotEmpty(psw) && psw.length() != 24)
			      {
			        psw = Aes.encryptToHexString(psw);
			        writer.write("\npsw after: "+psw+"\n");
			        update = "update titolare set password ='"+psw+"' where id_azienda="+id;
			        writer.write( "updated " + DbUtil.executeUpdate(update) + "\n");
			      }
				}
			}
			catch(Exception e)
			{
				System.out.println(e + "\n HERE!! " + e.getMessage() + "\n" + e.getStackTrace());
			}
			writer.write("\n\nend!");
			writer.flush();
			writer.close();
			System.out.println("end!");
		}
	}

}