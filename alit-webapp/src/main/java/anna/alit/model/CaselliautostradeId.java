package anna.alit.model;

// Generated Mar 17, 2010 6:53:04 PM by Hibernate Tools 3.3.0.GA


import javax.persistence.Column;
import javax.persistence.Embeddable;


/**
 * CaselliautostradeId generated by hbm2java
 */
@SuppressWarnings("serial")
@Embeddable
public class CaselliautostradeId implements java.io.Serializable
{


  private int id;
  private String autostrada;


  public CaselliautostradeId()
  {
  }


  public CaselliautostradeId(int id, String autostrada)
  {
    this.id = id;
    this.autostrada = autostrada;
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


  @Column(name = "autostrada", nullable = false, length = 50)
  public String getAutostrada()
  {
    return this.autostrada;
  }


  public void setAutostrada(String autostrada)
  {
    this.autostrada = autostrada;
  }


  public boolean equals(Object other)
  {
    if ((this == other))
      return true;
    if ((other == null))
      return false;
    if (!(other instanceof CaselliautostradeId))
      return false;
    CaselliautostradeId castOther = (CaselliautostradeId) other;

    return (this.getId() == castOther.getId())
        && ((this.getAutostrada() == castOther.getAutostrada()) || (this.getAutostrada() != null && castOther.getAutostrada() != null && this.getAutostrada().equals(castOther.getAutostrada())));
  }


  public int hashCode()
  {
    int result = 17;

    result = 37 * result + this.getId();
    result = 37 * result + (getAutostrada() == null ? 0 : this.getAutostrada().hashCode());
    return result;
  }


}
