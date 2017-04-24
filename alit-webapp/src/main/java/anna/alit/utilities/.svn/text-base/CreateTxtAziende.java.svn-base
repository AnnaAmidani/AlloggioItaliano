package anna.alit.utilities;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.*;

/**
 * Programma per la gestione dell'output .txt contenente istruzioni
 * di insert (n-righe) in tabella database postgresql.
 *
 * @author Anna Amidani
 */
public class CreateTxtAziende {

	/**
	 * esmpio di esecuzione:<br>
	 *
	 * <code>java ProvinciaInsert nomefile </code>
	 *
	 * @param args argomenti necessari:<br>
	 * args[0] nome file su cui eseguire la conversione.<br>
	 */
	public static void main(String[] args) throws FileNotFoundException{

//    Scanner scFile = new Scanner(new File("/home/anna/newprova.txt"));
    Scanner scFile = new Scanner(new File("prova.txt"));

		PrintStream output = new PrintStream (new FileOutputStream ("/home/anna/insert.txt"));

		String riga = "", campo = "";
	    String intestazione = "insert into datiaziende(tipologia, sigla, comune, denominazione, indirizzo, telefono, cellulare, fax, web, mail)" +
	    " values(";

		// finché ho righe
		while(scFile.hasNextLine()) {
			riga = intestazione;
			for(int i=1; i<=10; i++){
				campo=scFile.nextLine();
				campo=campo.replace("'", "`");
				switch(i)
				{
					case 1: riga = riga + "\'" + campo + "\', "; break;
					case 2: riga = riga + "\'" + campo + "\', "; break;
					case 3: riga = riga + "\'" + campo + "\', "; break;
					case 4: riga = riga + "\'" + campo + "\', "; break;
					case 5: riga = riga + "\'" + campo + "\', "; break;
					case 6: riga = riga + "\'" + campo + "\', "; break;
					case 7: riga = riga + "\'" + campo + "\', "; break;
					case 8: riga = riga + "\'" + campo + "\', "; break;
					case 9: riga = riga + "\'" + campo + "\', "; break;
					case 10: default:
					riga = riga + "\'" +  campo + "\'); ";
				}
			}

			System.out.println(riga);
			output.println(riga);
		}

		// Chiudo i canali di comunicazione
		scFile.close();
		output.close();
	}
}