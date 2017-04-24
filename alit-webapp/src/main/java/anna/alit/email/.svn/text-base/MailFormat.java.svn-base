/* $Id$
 *
 * Copyright(C) 2009 [an5tash@gmail.com]
 * All Rights Reserved
 */
package anna.alit.email;

/**
 * @author anirvanc
 */
public enum MailFormat
{
  html(1), plain(2);

  private int value;


  MailFormat(final int value)
  {
    this.value = value;
  }


  public final int toInt()
  {
    return value;
  }


  public static MailFormat fromInt(final int value)
  {
    switch (value)
    {
    case (1):
      return html;
    case (2):
      return plain;
    }
    throw new IllegalArgumentException("Illegal value " + value);
  }
}
