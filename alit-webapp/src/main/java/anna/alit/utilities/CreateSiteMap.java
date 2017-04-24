package anna.alit.utilities;

import java.io.FileNotFoundException;
import java.sql.ResultSet;
import java.io.*;

/**
 * Programma per la gestione dell'output .xml contenente codice per sitemap
 *
 * @author Anna Amidani
 */
public class CreateSiteMap {

	/**
   *
	 */
	public static void main(String[] args) throws FileNotFoundException
	{
		PrintStream output = new PrintStream (new FileOutputStream ("/home/tash/alloggio_italiano_sitemap_2.xml"));

		String query = "select id, denominazione, sigla, comune from datiaziende where id > 25000";

		ResultSet rs = DbUtil.executeQuery(query);

    String id, denominazione, sigla, comune;

    String xml_declare = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">";
    output.println(xml_declare);
    try
    {
      while(rs.next())
      {
        id = rs.getString("id");
        denominazione = rs.getString("denominazione");
        sigla = rs.getString("sigla");
        comune = rs.getString("comune");

        comune = comune.replaceAll(" ", "-").replaceAll("\\`", "_").replaceAll("è", "&egrave;").replaceAll("é", "&eacute;").replaceAll("à", "&agrave;").replaceAll("ì", "&igrave;").replaceAll("ò", "&ograve;").replaceAll("ù", "&ugrave;");
        denominazione = denominazione.replaceAll(" / ", "/").replaceAll(" ", "-").replaceAll("\\`", "_").replaceAll("\\&", "\\&amp;").replaceAll("è", "&egrave;").replaceAll("é", "&eacute;").replaceAll("à", "&agrave;").replaceAll("ì", "&igrave;").replaceAll("ò", "&ograve;").replaceAll("ù", "&ugrave;");
        denominazione += ".html";

        String xml_block = "\n<url>\n<loc>http://alloggioitaliano.it/descrizione-alloggio/";
        xml_block += id + "/" + sigla + "/" + comune + "/" + denominazione;
        xml_block += "</loc>\n<changefreq>weekly</changefreq>\n<priority>0.8</priority>\n</url>";
        output.println(xml_block);
      }
    }
    catch(Exception e)
    {
      System.out.println(e + "\n HERE!! " + e.getMessage() + "\n" + e.getStackTrace());
    }

    String final_xml = "\n</urlset>";

		output.println(final_xml);

		output.close();

		System.out.println("end!");
	}
}