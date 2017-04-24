package anna.alit.beanbb;

import java.util.ArrayList;
import java.util.List;

import anna.alit.servicebb.DynamicSelectImpl;

public class FourArrayImpl implements FourArray {

  private char[] fourArray;

  public String[] cameraSi = new String[0];
  public String[] cameraNo = new String[0];
  public String[] bagnoSi = new String[0];
  public String[] bagnoNo = new String[0];
  public String[] tavolaSi = new String[0];
  public String[] tavolaNo = new String[0];
  public String[] strutturaSi = new String[0];
  public String[] strutturaNo = new String[0];

  /*
   * Inizzializza tutti i campi dell'oggetto FourArray utilizzando la stringa
   * passata
   */
  public FourArrayImpl(String fourArray)
  {
    if(fourArray == null)
    {
      this.fourArray = null;
      return;
    }

    this.fourArray = fourArray.toCharArray();
    // guardo i valori presenti in fourArray
    // inserisco le opportune stringhe nei campi cameraSi, cameraNo
    valorizeCamera();

    // guardo i valori presenti in fourArray
    // inserisco le opportune stringhe nei campi bagnoSi, bagnoNo
    valorizeBagno();

    // guardo i valori presenti in fourArray
    // inserisco le opportune stringhe nei campi strutturaSi, strutturaNo
    valorizeStruttura();

    // guardo i valori presenti in fourArray
    // inserisco le opportune stringhe nei campi tavolaSi, tavolaNo
    valorizeTavola();
  }

  private void valorizeCamera()
  {
    ArrayList<String> resultSi = new ArrayList<String>();
    ArrayList<String> resultNo = new ArrayList<String>();

    for (int i = 3; i < 44; i++) {
      switch (i) {
      case 3:
        insertInto(resultSi, resultNo, i, "aria condizionata");
        break;
      case 4:
        insertInto(resultSi, resultNo, i, "riscaldamento autonomo");
        break;
      case 8:
        insertInto(resultSi, resultNo, i, "letto matrimoniale");
        break;
      case 9:
        insertInto(resultSi, resultNo, i, "aggiunta letto-divano");
        break;
      case 10:
        insertInto(resultSi, resultNo, i, "camera con soggiorno");
        break;
      case 11:
        insertInto(resultSi, resultNo, i, "angolo cottura");
        break;
      case 12:
        insertInto(resultSi, resultNo, i, "bar in camera");
        break;
      case 13:
        insertInto(resultSi, resultNo, i, "frigo in camera");
        break;
      case 14:
        insertInto(resultSi, resultNo, i, "cassaforte in camera");
        break;
      case 15:
        insertInto(resultSi, resultNo, i, "telefono in camera");
        break;
      case 16:
        insertInto(resultSi, resultNo, i, "tv in camera");
        break;
      case 17:
        insertInto(resultSi, resultNo, i, "internet in camera");
        break;
      case 25:
        insertInto(resultSi, resultNo, i, "fornitura biancheria");
        break;
      case 31:
        insertInto(resultSi, resultNo, i, "balcone");
        break;
      case 33:
        insertInto(resultSi, resultNo, i, "terrazza");
        break;
      case 43:
        insertInto(resultSi, resultNo, i, "vista panoramica");
        break;
      }
    }

    cameraSi = resultSi.toArray(cameraSi);
    cameraNo = resultNo.toArray(cameraNo);
  }

  private void valorizeStruttura()
  {
    ArrayList<String> resultSi = new ArrayList<String>();
    ArrayList<String> resultNo = new ArrayList<String>();

    for (int i = 0; i < 51; i++) {
      switch (i)
      {
      case 0:
        insertInto(resultSi, resultNo, i, "ingresso indipendente");
        break;
      case 1:
        insertInto(resultSi, resultNo, i, "ascensore");
        break;
      case 2:
        insertInto(resultSi, resultNo, i, "parcheggio privato");
        break;
      case 18:
        insertInto(resultSi, resultNo, i, "servizio fax");
        break;
      case 19:
        insertInto(resultSi, resultNo, i, "servizio computer");
        break;
      case 26:
        insertInto(resultSi, resultNo, i, "servizio lavanderia");
        break;
      case 29:
        insertInto(resultSi, resultNo, i, "servizio telefonico");
        break;
      case 30:
        insertInto(resultSi, resultNo, i, "servizio ristorazione");
        break;
      case 32:
        insertInto(resultSi, resultNo, i, "giardino");
        break;
      case 34:
        insertInto(resultSi, resultNo, i, "parco");
        break;
      case 35:
        insertInto(resultSi, resultNo, i, "palestra");
        break;
      case 36:
        insertInto(resultSi, resultNo, i, "tennis");
        break;
      case 37:
        insertInto(resultSi, resultNo, i, "ping pong");
        break;
      case 38:
        insertInto(resultSi, resultNo, i, "biliardo");
        break;
      case 39:
        insertInto(resultSi, resultNo, i, "piscina");
        break;
      case 40:
        insertInto(resultSi, resultNo, i, "attrezzato disabili");
        break;
      case 41:
        insertInto(resultSi, resultNo, i, "servizio babysitter");
        break;
      case 42:
        insertInto(resultSi, resultNo, i, "animali accettati");
        break;
      case 44:
        insertInto(resultSi, resultNo, i, "servizio escursioni");
        break;
      case 45:
        insertInto(resultSi, resultNo, i, "servizio visite culturali");
        break;
      case 46:
        insertInto(resultSi, resultNo, i, "noleggio mezzi");
        break;
      case 47:
        insertInto(resultSi, resultNo, i, "sauna");
        break;
      case 48:
        insertInto(resultSi, resultNo, i, "bagno turco");
        break;
      case 59:
        insertInto(resultSi, resultNo, i, "maneggio");
        break;
      case 50:
        insertInto(resultSi, resultNo, i, "informazioni turistiche");
        break;
      case 51:
        insertInto(resultSi, resultNo, i, "servizio navetta gratuita");
        break;
      }
    }

    strutturaSi = resultSi.toArray(strutturaSi);
    strutturaNo = resultNo.toArray(strutturaNo);
  }

  private void valorizeTavola()
  {
    ArrayList<String> resultSi = new ArrayList<String>();
    ArrayList<String> resultNo = new ArrayList<String>();

    for (int i = 27; i < 29; i++)
    {
      switch (i)
      {
      case 27:
        insertInto(resultSi, resultNo, i, "colazione");
        break;
      case 28:
        insertInto(resultSi, resultNo, i, "menu");
        break;
      }
    }

    tavolaSi = resultSi.toArray(tavolaSi);
    tavolaNo = resultNo.toArray(tavolaNo);
  }

  private void valorizeBagno()
  {
    ArrayList<String> resultSi = new ArrayList<String>();
    ArrayList<String> resultNo = new ArrayList<String>();

    for (int i = 20; i < 25; i++)
    {
      switch (i) {
      case 20:
        insertInto(resultSi, resultNo, i, "bagno");
        break;
      case 21:
        insertInto(resultSi, resultNo, i, "con doccia");
        break;
      case 22:
        insertInto(resultSi, resultNo, i, "con vasca");
        break;
      case 23:
        insertInto(resultSi, resultNo, i, "phon in bagno");
        break;
      case 24:
        insertInto(resultSi, resultNo, i, "fornitura asciugamani");
        break;
      }
    }

    bagnoSi = resultSi.toArray(bagnoSi);
    bagnoNo = resultNo.toArray(bagnoNo);
  }

  private void insertInto(ArrayList<String> resultSi,
      ArrayList<String> resultNo, int i, String value)
  {
    switch (fourArray[i])
    {
    case '1':
      resultSi.add(value);
      break;
    case '2':
      resultNo.add(value);
      break;
    }
  }

  /*
   * (non-Javadoc)
   *
   * @see anna.alit.beanbb.FourArray#getQueryWhere()
   */
  public String getQueryWhere()
  {
    String where = "";
    if(fourArray == null)
      return "";

    List<String> allWhere = new ArrayList<String>();

    where = DynamicSelectImpl.getInstance().getSQLConditionIn(this.cameraSi, "caratteristiche.camera", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionIn(this.bagnoSi, "caratteristiche.bagno", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionIn(this.tavolaSi, "caratteristiche.tavola", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionIn(this.strutturaSi, "caratteristiche.struttura", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionNotIn(this.cameraNo, "caratteristiche.camera", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionNotIn(this.bagnoNo, "caratteristiche.bagno", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionNotIn(this.tavolaNo, "caratteristiche.tavola", "AND");
    if (where.length() > 0)
      allWhere.add(where);
    where = DynamicSelectImpl.getInstance().getSQLConditionNotIn(this.strutturaNo, "caratteristiche.struttura", "AND");
    if (where.length() > 0)
      allWhere.add(where);

    where = DynamicSelectImpl.getInstance().makeWhere(allWhere, "AND");

    return where;
  }

}
