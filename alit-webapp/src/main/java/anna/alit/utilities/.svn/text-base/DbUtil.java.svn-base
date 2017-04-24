/**        DBMS.java        */
package anna.alit.utilities;

import java.sql.*;

/**
 * Questa classe mette a disposizione i metodi per effettuare interrogazioni
 * sulla base di dati.
 */
public class DbUtil {

	//identificazione
	private static String LoginUrl = "jdbc:postgresql://localhost:5434/alitpro";
    private static String LoginUser = "anna";
    private static String LoginPasswd = "77anna";
//    private static String LoginUser = "alitpro";
//    private static String LoginPasswd = "1229rtgjhf";
	private static String driver = "org.postgresql.Driver";

    public static ResultSet executeQuery(String query) {

    	Connection connection = null;
    	Statement statement = null;
    	ResultSet resultset = null;

    	try {
    		Class.forName(driver);

 			// Tentativo di connessione al database
			connection = DriverManager.getConnection(LoginUrl, LoginUser, LoginPasswd);
			// connesso.

			// ottengo l'oggetto per l'esecuzione della query
			statement = connection.createStatement();

			// Eseguo l'interrogazione desiderata
			resultset = statement.executeQuery(query);

    	} catch(ClassNotFoundException e) {
    		e.printStackTrace();
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	finally {

	   		if (connection != null) {
				try {
					connection.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
    	}
		return resultset;
    }


    public static int executeUpdate(String update) throws SQLException, ClassNotFoundException {

    	Connection connection = null;
    	PreparedStatement prepstat = null;
    	int rs = 0;

    	try {
    		Class.forName(driver);		// carica il driver

 			// Tentativo di connessione al database
			connection = DriverManager.getConnection(LoginUrl, LoginUser, LoginPasswd);
			// connesso.

			// ottengo l'oggetto per l'esecuzione della query
			prepstat = connection.prepareStatement(update);

			// Eseguo l'interrogazione desiderata
			rs = prepstat.executeUpdate();

    	} catch(ClassNotFoundException e) {
    		throw e;
    	} catch(SQLException e) {
    		throw e;
    	}
    	finally {

	   		if (connection != null) {
				try {
					connection.close();
				} catch(SQLException sqle1) {
					sqle1.printStackTrace();
				}
			}
    	}
		return rs;
    }

}