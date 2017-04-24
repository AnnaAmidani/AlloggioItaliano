/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

import org.springframework.util.StringUtils;


/**
 * @author janm
 */
public class EmailAddress
{
  private String emailAddress;
  private String fullName;
  private EmailAddressType addressType;


  public EmailAddress()
  {

  }


  public EmailAddress(final EmailAddressType addressType, final String emailAddress)
  {
    this.addressType = addressType;
    this.emailAddress = emailAddress;
  }


  public EmailAddress(final EmailAddressType addressType, final String emailAddress, final String fullName)
  {
    this.addressType = addressType;
    this.emailAddress = emailAddress;
    this.fullName = fullName;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#getAddressType()
   */
  public EmailAddressType getAddressType()
  {
    return addressType;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#setAddressType(anna.alit.email.EmailAddressType)
   */
  public void setAddressType(final EmailAddressType addressType)
  {
    this.addressType = addressType;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#getEmailAddress()
   */
  public String getEmailAddress()
  {
    return emailAddress;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#setEmailAddress(java.lang.String)
   */
  public void setEmailAddress(final String emailAddress)
  {
    this.emailAddress = emailAddress;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#getFullName()
   */
  public String getFullName()
  {
    return fullName;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#setFullName(java.lang.String)
   */
  public void setFullName(final String fullName)
  {
    this.fullName = fullName;
  }


  /* (non-Javadoc)
   * @see anna.alit.email.EmailAddress#validate()
   */
  public void validate()
  {
    if (!StringUtils.hasText(this.emailAddress))
      throw new IllegalArgumentException("Email address is missing.");
  }
}
