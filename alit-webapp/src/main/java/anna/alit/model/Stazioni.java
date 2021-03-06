package anna.alit.model;

// Generated Mar 17, 2010 6:53:04 PM by Hibernate Tools 3.3.0.GA


import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;


/**
 * Stazioni generated by hbm2java
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "stazioni", schema = "public")
public class Stazioni implements java.io.Serializable
{


  private StazioniId id;


  public Stazioni()
  {
  }


  public Stazioni(StazioniId id)
  {
    this.id = id;
  }


  @EmbeddedId
  @AttributeOverrides( { @AttributeOverride(name = "id", column = @Column(name = "id", nullable = false)),
      @AttributeOverride(name = "nomestazione", column = @Column(name = "nomestazione", nullable = false)),
      @AttributeOverride(name = "sigprov", column = @Column(name = "sigprov", nullable = false, length = 2)) })
  public StazioniId getId()
  {
    return this.id;
  }


  public void setId(StazioniId id)
  {
    this.id = id;
  }


}
