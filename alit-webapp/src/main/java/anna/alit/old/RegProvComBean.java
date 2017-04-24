package anna.alit.old;

/**
 * Bean per tabelle: regione, provincia, comune
 * In Richiesta: il Bean memorizza il valore selezionato dall'utente da selectbox1 nel menu 'regione'(=regione.nomeregione).
 * Il valore viene passato al dbms.java per l'esecuzione della query (che cerca la co-incidenza regione.nomeregione=provincia.regione), che rende l'elenco * delle provincie afferenti.
 * In Risposta: Il Bean, valorizzato, va a popolare la selectbox2.
 * In Richiesta: il Bean memorizza il valore selezionato dall'utente da selectbox2 nel menu 'provincia'(=provincia.nomeesteso).
 * Il valore viene passato al dbms.java per l'esecuzione della query (che cerca la co-incidenza provincia.nomeesteso=comune.provincia) che rende l'elenco * dei comuni di appartenenza
 * In Risposta: Il Bean, valorizzato, va a popolare la selectbox3.
 */

public class RegProvComBean {
  //Definizione dei campi del Bean (variabili private: accessibili solo tramite i metodi get e set)
  private String nomeregione; //tab Regione
  private String provincia;   //tab Comune
  private String comune;      //tab Comune
  private String distretto;       //tab Provincia
  private String sigla;       //tab Provincia
  private String prov;       //tab Distretto
  private String siglaprovincia;       //tab Comune
  private String nomeesteso;  //tab Provincia
  private String regione;     //tab Provincia
  private String limitrofa1;  // "     "  ...
  private String limitrofa2;
  private String limitrofa3;
  private String limitrofa4;
  private String limitrofa5;
  private String limitrofa6;
  private String limitrofa7;
  private String limitrofa8;

  //Definizione del costruttore del Bean
  public RegProvComBean() {
      nomeregione = null;
      provincia = null;
      comune = null;
      distretto = null;
      sigla = null;
      prov = null;
      siglaprovincia = null;
      nomeesteso = null;
      regione = null;
      limitrofa1 = null;
      limitrofa2 = null;
      limitrofa3 = null;
      limitrofa4 = null;
      limitrofa5 = null;
      limitrofa6 = null;
      limitrofa7 = null;
      limitrofa8 = null;
      }

  //metodi set
  public void setNomeregione(String s) {
      nomeregione = s;
      }

  public void setProvincia(String s) {
      provincia = s;
  }

  public void setComune(String s) {
      comune = s;
  }

  public void setProv(String s) {
    prov = s;
  }

  public void setSiglaProvincia(String s) {
    siglaprovincia = s;
  }

  public void setDistretto(String s) {
      distretto = s;
  }

  public void setSigla(String s) {
      sigla = s;
  }

  public void setNomeesteso(String s) {
      nomeesteso = s;
  }

  public void setRegione(String s) {
      regione = s;
  }

  public void setLimitrofa1(String s) {
      limitrofa1 = s;
  }

  public void setLimitrofa2(String s) {
      limitrofa2 = s;
  }

  public void setLimitrofa3(String s) {
      limitrofa3 = s;
  }

  public void setLimitrofa4(String s) {
      limitrofa4 = s;
  }

  public void setLimitrofa5(String s) {
      limitrofa5 = s;
  }

  public void setLimitrofa6(String s) {
      limitrofa6 = s;
  }

  public void setLimitrofa7(String s) {
      limitrofa7 = s;
  }

  public void setLimitrofa8(String s) {
      limitrofa8 = s;
  }


  //metodi get
  public String getNomeregione() {
      return nomeregione;
  }

  public String getProvincia() {
      return provincia;
  }

  public String getComune() {
      return comune;
  }

  public String getProv() {
    return prov;
  }

  public String getSiglaprovincia() {
    return siglaprovincia;
  }

  public String getDistretto() {
      return distretto;
  }

  public String getSigla() {
      return sigla;
  }

  public String getNomeesteso() {
      return nomeesteso;
  }

  public String getRegione() {
      return regione;
  }

  public String getLimitrofa1() {
      return limitrofa1;
  }

  public String getLimitrofa2() {
      return limitrofa2;
  }

  public String getLimitrofa3() {
      return limitrofa3;
  }

  public String getLimitrofa4() {
      return limitrofa4;
  }

  public String getLimitrofa5() {
      return limitrofa5;
  }

  public String getLimitrofa6() {
      return limitrofa6;
  }

  public String getLimitrofa7() {
      return limitrofa7;
  }

  public String getLimitrofa8() {
      return limitrofa8;
  }
}
