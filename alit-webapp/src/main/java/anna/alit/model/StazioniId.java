package anna.alit.model;

// Generated Mar 17, 2010 6:53:04 PM by Hibernate Tools 3.3.0.GA


import javax.persistence.Column;
import javax.persistence.Embeddable;


/**
 * StazioniId generated by hbm2java
 */
@SuppressWarnings("serial")
@Embeddable
public class StazioniId implements java.io.Serializable
{
  private int id;
  private String nomestazione;
  private String sigprov;


  public StazioniId()
  {
  }


  public StazioniId(int id, String nomestazione, String sigprov)
  {
    this.id = id;
    this.nomestazione = nomestazione;
    this.sigprov = sigprov;
  }


  @Column(name = "id", nullable = false)
  public int getId()
  {
    return this.id;
  }


  public void setId(int id)
  {
    this.id = id;
  }


  @Column(name = "nomestazione", nullable = false)
  public String getNomestazione()
  {
    return this.nomestazione;
  }


  public void setNomestazione(String nomestazione)
  {
    this.nomestazione = nomestazione;
  }


  @Column(name = "sigprov", nullable = false, length = 2)
  public String getSigprov()
  {
    return this.sigprov;
  }


  public void setSigprov(String sigprov)
  {
    this.sigprov = sigprov;
  }


  public boolean equals(Object other)
  {
    if ((this == other))
      return true;
    if ((other == null))
      return false;
    if (!(other instanceof StazioniId))
      return false;
    StazioniId castOther = (StazioniId) other;

    return (this.getId() == castOther.getId())
        && ((this.getNomestazione() == castOther.getNomestazione()) || (this.getNomestazione() != null && castOther.getNomestazione() != null && this.getNomestazione().equals(
            castOther.getNomestazione())))
        && ((this.getSigprov() == castOther.getSigprov()) || (this.getSigprov() != null && castOther.getSigprov() != null && this.getSigprov().equals(castOther.getSigprov())));
  }


  public int hashCode()
  {
    int result = 17;

    result = 37 * result + this.getId();
    result = 37 * result + (getNomestazione() == null ? 0 : this.getNomestazione().hashCode());
    result = 37 * result + (getSigprov() == null ? 0 : this.getSigprov().hashCode());
    return result;
  }


}
