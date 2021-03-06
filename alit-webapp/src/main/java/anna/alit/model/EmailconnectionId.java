package anna.alit.model;

// Generated Mar 17, 2010 6:53:04 PM by Hibernate Tools 3.3.0.GA


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;


/**
 * EmailconnectionId generated by hbm2java
 */
@SuppressWarnings("serial")
@Embeddable
public class EmailconnectionId implements java.io.Serializable
{


  private int idAzienda;
  private Date dataCreazione;


  public EmailconnectionId()
  {
  }


  public EmailconnectionId(int idAzienda, Date dataCreazione)
  {
    this.idAzienda = idAzienda;
    this.dataCreazione = dataCreazione;
  }


  @Column(name = "id_azienda", nullable = false)
  public int getIdAzienda()
  {
    return this.idAzienda;
  }


  public void setIdAzienda(int idAzienda)
  {
    this.idAzienda = idAzienda;
  }


  @Column(name = "data_creazione", nullable = false, length = 29)
  public Date getDataCreazione()
  {
    return this.dataCreazione;
  }


  public void setDataCreazione(Date dataCreazione)
  {
    this.dataCreazione = dataCreazione;
  }


  public boolean equals(Object other)
  {
    if ((this == other))
      return true;
    if ((other == null))
      return false;
    if (!(other instanceof EmailconnectionId))
      return false;
    EmailconnectionId castOther = (EmailconnectionId) other;

    return (this.getIdAzienda() == castOther.getIdAzienda())
        && ((this.getDataCreazione() == castOther.getDataCreazione()) || (this.getDataCreazione() != null && castOther.getDataCreazione() != null && this.getDataCreazione().equals(
            castOther.getDataCreazione())));
  }


  public int hashCode()
  {
    int result = 17;

    result = 37 * result + this.getIdAzienda();
    result = 37 * result + (getDataCreazione() == null ? 0 : this.getDataCreazione().hashCode());
    return result;
  }


}
